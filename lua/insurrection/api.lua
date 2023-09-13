local lanes = require"lanes".configure()
local json = require "json"
local asyncLibs = "base, table, package, string"
local blam = require "blam"
local requests = require "requestscurl"
local interface = require "insurrection.interface"
local glue = require "glue"
local exists = glue.canopen
local actions = require "insurrection.redux.actions"
local core = require "insurrection.core"
local harmony = require "mods.harmony"
local menus = require "insurrection.menus"
local shared = interface.shared
local constants = require "insurrection.constants"
local loading = core.loading
local luna = require "luna"

local api = {}
api.host = read_file("insurrection_host") or "http://localhost:4343/"
if DebugMode then
    api.host = "http://localhost:4343/"
end
api.version = "v1"
api.url = api.host .. api.version
api.variables = {refreshRate = 3000, refreshTimerId = nil}

---@class insurrectionSession
---@field token? string
---@field lobbyKey? string
---@field username? string

---@type insurrectionSession
api.session = {token = nil, lobbyKey = nil, username = nil}

-- Models

---@class requestResult
---@field message string

---@class loginResponse
---@field message string
---@field token? string
---@field player {nameplate: number, publicId: string, name: string, rank: number}
---@field secondsToExpire number

---@class availableParameters
---@field maps string[]
---@field gametypes string[]
---@field templates string[]

---@class serverInstance
---@field password string
---@field template string
---@field host string
---@field port integer
---@field map string
---@field gametype string
---@field cpu integer
---@field owner string
---@field lobbyKey string

---@class lobbyRoom
---@field owner string
---@field players string[]
---@field map string
---@field gametype string
---@field template string
---@field server serverInstance

function async(func, callback, ...)
    if (#Lanes == 0) then
        Lanes[#Lanes + 1] = {thread = lanes.gen(asyncLibs, func)(...), callback = callback}
    else
        dprint("Warning! An async function is trying to add another thread!", "warning")
    end
end

local function connect(desiredMap, host, port, password)
    api.stopRefreshLobby()
    if not map == "ui" then
        console_out("Can't connect to a server while in-game.")
        return
    end
    -- dprint("Connecting to " .. tostring(host) .. ":" .. tostring(port) .. " with password " .. tostring(password))
    if exists("maps\\" .. desiredMap .. ".map") or
        exists(core.getMyGamesHaloCEPath() .. "\\chimera\\maps\\" .. desiredMap .. ".map") then
        discord.setPartyWithLobby()
        -- Force game profile name to be the same as the player's name
        core.setGameProfileName(api.session.player.name)
        core.connectServer(host, port, password)
    else
        interface.dialog("ERROR", "LOCAL MAP NOT FOUND",
                         "Map \"" .. desiredMap .. "\" was not found on your game files.")
    end
end

local function unknownError(logs)
    if type(logs) ~= "string" then
        if type(logs) == "table" and logs.json then
            logs = tostring(inspect(logs)) .. "\n" .. tostring(inspect(logs.json()))
        else
            logs = tostring(inspect(logs))
            dprint("Unknown error: " .. logs, "error")
        end
    end
    interface.dialog("ERROR", "UNKNOWN ERROR",
                     "An unknown error has ocurred, please check logs and try again later.")
    if logs then
        local log = read_file("insurrection.log") or ""
        log = log .. "\n" .. debug.traceback()
        log = log .. "\n" .. logs
        write_file("insurrection.log", log)
    end
end

---@param response httpResponse<loginResponse>
---@return boolean
local function onLoginResponse(response)
    loading(false)
    if response then
        if response.code == 200 then
            local jsonResponse = response.json()
            api.session.token = jsonResponse.token
            api.session.player = jsonResponse.player
            requests.headers = {"Authorization: Bearer " .. api.session.token}
            -- Save last defined nameplate
            core.saveSettings({nameplate = jsonResponse.player.nameplate})
            interface.loadProfileNameplate()
            api.available()
            menus.dashboard()
            return true
        elseif response.code == 401 then
            local jsonResponse = response.json()
            interface.dialog("ATTENTION", "ERROR " .. response.code, jsonResponse.message)
            return false
        end
    end
    unknownError(response)
    return false
end
function api.login(username, password)
    loading(true, "Logging in...")
    async(requests.postform, function(result)
        onLoginResponse(result[1])
    end, api.url .. "/login", {username = username, password = password})
end

---@param response httpResponse<availableParameters>
---@return boolean
function onAvailableResponse(response)
    loading(false)
    if response then
        if response.code == 200 then
            local jsonResponse = response.json()
            store:dispatch(actions.setAvailableResources(jsonResponse))
            return true
        end
    end
    unknownError(response)
    return false
end
function api.available()
    loading(true, "Loading available parameters...")
    async(requests.get, function(result)
        onAvailableResponse(result[1])
    end, api.url .. "/available")
end

---@param response httpResponse<lobbyResponse | lobbyRoom | requestResult>
---@return boolean
local function onLobbyResponse(response)
    dprint("onLobbyResponse", "info")
    loading(false)
    if response then
        if response.code == requests.codes.ok then
            ---@class lobbyResponse
            ---@field key string
            ---@field lobby lobbyRoom

            local jsonResponse = response.json()
            if jsonResponse then
                -- We asked for a new lobby room
                if jsonResponse.key then
                    api.session.lobbyKey = jsonResponse.key
                    store:dispatch(actions.setLobby(jsonResponse.key, jsonResponse.lobby))
                else
                    -- We have to joined an existing lobby
                    local lobby = jsonResponse
                    store:dispatch(actions.setLobby(api.session.lobbyKey, lobby))
                    -- There is a server already running for this lobby, connect to it
                    if lobby.server then
                        discord.setParty(api.session.lobbyKey, #lobby.players, 16, lobby.map)
                        connect(lobby.server.map, lobby.server.host, lobby.server.port,
                                lobby.server.password)
                        return true
                    end
                end
                -- Start a timer to pull lobby data every certain time
                if api.variables.refreshTimerId then
                    api.stopRefreshLobby()
                end
                -- Create global function to be called by the timer
                refreshLobby = function()
                    if api.session.lobbyKey then
                        api.refreshLobby()
                    end
                end
                api.variables.refreshTimerId = set_timer(api.variables.refreshRate, "refreshLobby")
                ---@type interfaceState
                local state = store:getState()
                local isPlayerLobbyOwner = api.session.player and api.session.player.publicId ==
                                               state.lobby.owner
                if isPlayerLobbyOwner then
                    menus.lobby()
                    discord.updatePresence("Hosting a lobby", "Waiting for players...")
                    discord.setParty(api.session.lobbyKey, #state.lobby.players, 16, state.lobby.map)
                    require"insurrection.components.dynamic.lobbyMenu".init()
                else
                    menus.lobby(true)
                    --menus.lobby()
                    discord.updatePresence("In a lobby", "Waiting for players...")
                    require"insurrection.components.dynamic.lobbyMenuClient".init()
                end
            end
            return true
        elseif response.code == requests.codes.forbidden then
            local jsonResponse = response.json()
            if jsonResponse and jsonResponse.key then
                api.lobby(jsonResponse.key)
            end
            return true
        else
            api.session.lobbyKey = nil
            local jsonResponse = response.json()
            interface.dialog("ATTENTION", "ERROR " .. response.code, jsonResponse.message)
            return false
        end
    end
    unknownError(response)
    return false
end
function api.lobby(lobbyKey)
    loading(true, "Loading lobby...")
    if lobbyKey then
        api.session.lobbyKey = lobbyKey
        async(requests.get, function(result)
            onLobbyResponse(result[1])
        end, api.url .. "/lobby/" .. lobbyKey)
    else
        async(requests.get, function(result)
            onLobbyResponse(result[1])
        end, api.url .. "/lobby")
    end
end

---@param response httpResponse<lobbyRoom | requestResult>
---@return boolean
local function onLobbyRefreshResponse(response)
    dprint("onLobbyRefreshResponse", "info")
    loading(false)
    if response then
        if response.code == 200 then
            local lobby = response.json()
            if lobby then
                -- Update previously joined lobby data
                store:dispatch(actions.updateLobby(api.session.lobbyKey, lobby))
                ---@type interfaceState
                local state = store:getState()
                local isPlayerLobbyOwner = api.session.player and api.session.player.publicId ==
                                               state.lobby.owner
                if not isPlayerLobbyOwner then
                    discord.setParty(nil, #lobby.players, 16, lobby.map)
                    require"insurrection.components.dynamic.lobbyMenuClient".update()
                else
                    require"insurrection.components.dynamic.lobbyMenu".update()
                    discord.setParty(api.session.lobbyKey, #lobby.players, 16, lobby.map)
                end
                -- Lobby already started, join the server
                if lobby.server and not blam.isGameDedicated() then
                    api.stopRefreshLobby()
                    connect(lobby.server.map, lobby.server.host, lobby.server.port,
                            lobby.server.password)
                end
            end
            return true
        else
            api.stopRefreshLobby()
            -- TODO Add a generic error handling function for this
            local jsonResponse = response.json()
            interface.dialog("ERROR", "ERROR " .. response.code, jsonResponse.message)
            return false
        end
    end
    api.stopRefreshLobby()
    unknownError(response)
    return false
end
function api.refreshLobby()
    loading(true, "Refreshing lobby...", false)
    if api.session.lobbyKey then
        dprint("Refreshing lobby data...", "info")
        async(requests.get, function(result)
            onLobbyRefreshResponse(result[1])
        end, api.url .. "/lobby/" .. api.session.lobbyKey)
    end
end
function api.stopRefreshLobby()
    if api.session.lobbyKey then
        discord.updatePresence("Playing Insurrection")
        pcall(stop_timer, api.variables.refreshTimerId)
    end
end
function api.deleteLobby()
    if api.session.lobbyKey then
        discord.updatePresence("Playing Insurrection")
        discord.setParty(nil)
        dprint("DELETING lobby", "warning")
        pcall(stop_timer, api.variables.refreshTimerId)
        api.variables.refreshTimerId = nil
        api.session.lobbyKey = nil
    end
end

---@param response httpResponse<serverBorrowResponse>
---@return boolean
local function onBorrowResponse(response)
    loading(false)
    if response then
        if response.code == 200 then
            -- Prevent lobby from refreshing while we are waiting for the server to start
            -- This is critical to avoid crashing the game due to multitasking stuff
            api.stopRefreshLobby()
            ---@class serverBorrowResponse
            ---@field password string
            ---@field message string
            ---@field port number
            ---@field host string
            ---@field map string

            local jsonResponse = response.json()
            if jsonResponse then
                dprint(jsonResponse)
                connect(jsonResponse.map, jsonResponse.host, jsonResponse.port,
                        jsonResponse.password)
            end
            return true
        elseif response.code == 404 then
            local jsonResponse = response.json()
            interface.dialog("ATTENTION", "ERROR " .. response.code, jsonResponse.message)
            return false
        else
            api.stopRefreshLobby()
            if response.code == 500 then
                interface.dialog("ATTENTION", "ERROR " .. response.code, "Internal Server Error")
                return false
            else
                local jsonResponse = response.json()
                interface.dialog("ATTENTION", "ERROR " .. response.code, jsonResponse.message)
                return false
            end
        end
    end
    api.stopRefreshLobby()
    unknownError(response)
    return false
end
function api.borrow(template, map, gametype)
    loading(true, "Borrowing game server...", false)
    async(requests.get, function(result)
        onBorrowResponse(result[1])
    end, api.url .. "/borrow/" .. template .. "/" .. map .. "/" .. gametype .. "/" ..
              api.session.lobbyKey)
end

---@param response httpResponse<any>
---@return boolean
function onPlayerEditNameplateResponse(response)
    loading(false)
    if response then
        if response.code == 200 then
            interface.dialog("INFORMATION", "CONGRATULATIONS", "Profile customized successfully.")
            return true
        else
            local jsonResponse = response.json()
            if jsonResponse then
                interface.dialog("WARNING", "ERROR " .. response.code, jsonResponse.message)
            end
            return false
        end
    end
    unknownError(response)
    return false
end
---Edit player nameplate
---@param data {nameplate: string, bipeds: table<string, string>}
function api.playerProfileEdit(data)
    loading(true, "Editing profile...", false)
    async(requests.patch, function(result)
        if onPlayerEditNameplateResponse(result[1]) then
            interface.loadProfileNameplate(data.nameplate)
        end
    end, api.url .. "/players", data)
end

local function onLobbyEditResponse(response)
    loading(false)
    if response then
        if response.code == 200 then
            return true
        else
            local jsonResponse = response.json()
            if jsonResponse then
                interface.dialog("ATTENTION", "ERROR " .. response.code, jsonResponse.message)
            end
            return false
        end
    end
    unknownError(response)
    return false
end
function api.editLobby(lobbyKey, data)
    loading(true, "Editing lobby...", false)
    async(requests.patch, function(result)
        onLobbyEditResponse(result[1])
    end, api.url .. "/lobby/" .. lobbyKey, data)
end

return api
