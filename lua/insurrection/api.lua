local lanes = require"lanes".configure()
local json = require "json"
local getState = require "insurrection.redux.getState"
local react = require "insurrection.react"
local asyncLibs = "base, table, package, string"
local blam = require "blam"
local requests = require "requestscurl"
local interface = require "insurrection.interface"
local glue = require "glue"
local exists = glue.canopen
local actions = require "insurrection.redux.actions"
local core = require "insurrection.core"
local menus = require "insurrection.menus"
local shared = interface.shared
local constants = require "insurrection.constants"
local loading = core.loading
local luna = require "luna"
local utils = require "insurrection.utils"

local api = {}

api.variables = {refreshRate = 3000, refreshTimerId = nil}

---@class insurrectionSession
---@field token? string
---@field lobbyKey? string
---@field username? string
---@field player? insurrectionPlayer

---@type insurrectionSession
api.session = {token = nil, lobbyKey = nil, username = nil, player = nil}

-- Models

---@class requestResult
---@field message string

---@class insurrectionPlayer
---@field name string
---@field nameplate number
---@field publicId string
---@field rank number
---@field bipeds table<string, string>

---@class loginResponse
---@field message string
---@field token? string
---@field player insurrectionPlayer
---@field secondsToExpire number

---@class availableParameters
---@field maps string[]
---@field gametypes string[]
---@field templates string[]
---@field customization table<string, {maps: string[], tags: string[]}>

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

---@class insurrectionLobby
---@field owner string
---@field players insurrectionPlayer[]
---@field map string
---@field gametype string
---@field template string
---@field server serverInstance
---@field isPublic boolean

function async(func, callback, ...)
    if #Lanes == 0 then
        Lanes[#Lanes + 1] = {thread = lanes.gen(asyncLibs, func)(...), callback = callback}
    else
        logger:debug("Warning! An async function is trying to add another thread!")
    end
end

local function connect(desiredMap, host, port, password)
    api.stopRefreshLobby()
    if not map == "ui" then
        console_out("Can't connect to a server while in-game.")
        return
    end
    -- logger:debug("Connecting to " .. tostring(host) .. ":" .. tostring(port) .. " with password " .. tostring(password))
    if exists("maps\\" .. desiredMap .. ".map") or
        exists(core.getMyGamesHaloCEPath() .. "\\chimera\\maps\\" .. desiredMap .. ".map") then
        -- Force game profile name to be the same as the player's name
        core.setGameProfileName(api.session.player.name)
        core.connectServer(host, port, password)
    else
        interface.dialog("ERROR", "LOCAL MAP NOT FOUND", "Map \"" .. desiredMap ..
                             "\" was not found on your game files.\nPlease download it from Mercury or map repositories.")
    end
end

local function unknownError(logs)
    if type(logs) ~= "string" then
        if type(logs) == "table" and logs.json then
            logs = tostring(inspect(logs)) .. "\n" .. tostring(inspect(logs.json()))
        else
            logs = tostring(inspect(logs))
            logger:error("Unknown error: " .. logs, "error")
        end
    end
    interface.dialog("ERROR", "UNKNOWN ERROR",
                     "An unknown error has ocurred, please check logs and try again later.")
    if logs then
        local log = Balltze.filesystem.readFile("insurrection.log") or ""
        -- Check if log is over 100,000 kilobytes and reset it
        if #log > 100000 then
            log = ""
        end
        log = log .. "\n" .. debug.traceback()
        log = log .. "\n" .. logs
        Balltze.filesystem.writeFile("insurrection.log", log)
    end
end

---Prevent players from getting stuck in the joining screen if the server connection fails
local function preventStuckLobby()
    -- Check after 30 seconds if we are still in the UI map
    utils.delay(30000, function()
        if map == "ui" then
            -- If we were trying to join a lobby and the widget is closed, delete the lobby
            if api.session.lobbyKey then
                console_out(
                    "It seems like there is a problem joining the server, deleting lobby...",
                    table.unpack(blam.consoleColors.warning))
                api.deleteLobby()
            end
        end
    end)
end

---Load Insurrection URL to be used by the API
---@param host? string
function api.loadUrl(host)
    api.version = "v1"
    api.host = Balltze.filesystem.readFile("insurrection_host") or host or "http://localhost:4343/"
    if DebugMode then
        api.host = "http://localhost:4343/"
    end
    api.url = api.host .. api.version
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

---@param response httpResponse<lobbyResponse | insurrectionLobby | requestResult>
---@return boolean
local function onLobbyResponse(response)
    logger:info("onLobbyResponse")
    loading(false)
    if response then
        if response.code == requests.codes.ok then
            ---@class lobbyResponse
            ---@field key string
            ---@field lobby insurrectionLobby

            local data = response.json()
            if data then
                -- We asked for a new lobby room
                if data.key then
                    api.session.lobbyKey = data.key
                    store:dispatch(actions.setLobby(data.key, data.lobby))
                else
                    -- We have to joined an existing lobby
                    local lobby = data --[[@as insurrectionLobby]]
                    store:dispatch(actions.setLobby(nil, lobby))
                    -- There is a server already running for this lobby, connect to it
                    if lobby.server then
                        local isPlayerLobbyOwner = api.session.player and
                                                       api.session.player.publicId == lobby.owner
                        if isPlayerLobbyOwner then
                            discord.setParty(lobby.server.lobbyKey, #lobby.players, 16, lobby.map,
                                             isPlayerLobbyOwner)
                        end
                        connect(lobby.server.map, lobby.server.host, lobby.server.port,
                                lobby.server.password)
                        return true
                    end
                end
                -- TODO BALLTZE MIGRATE
                --api.startLobbyRefresh()
                local state = getState()
                local isPlayerLobbyOwner = api.session.player and api.session.player.publicId ==
                                               state.lobby.owner
                if isPlayerLobbyOwner then
                    menus.lobby()
                    discord.setParty(api.session.lobbyKey, #state.lobby.players, 16,
                                     state.lobby.map, isPlayerLobbyOwner)
                    react.render("lobbyMenu")
                else
                    menus.lobby(true)
                    discord.clearParty()
                    react.render("lobbyMenuClient")
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
---Create or join a lobby
---@param lobbyKey? string
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

---@param response httpResponse<insurrectionLobby | requestResult>
---@return boolean
local function onLobbyRefreshResponse(response)
    dprint("onLobbyRefreshResponse", "info")
    loading(false)
    if response then
        if response.code == 200 then
            local lobby = response.json()
            if lobby then
                -- Update previously joined lobby data
                -- store:dispatch(actions.updateLobby(api.session.lobbyKey, lobby))
                store:dispatch(actions.setLobby(api.session.lobbyKey, lobby))
                local state = getState()
                local isPlayerLobbyOwner = api.session.player and api.session.player.publicId ==
                                               state.lobby.owner
                if isPlayerLobbyOwner then
                    react.render("lobbyMenu")
                    discord.setParty(api.session.lobbyKey, #lobby.players, 16, lobby.map,
                                     isPlayerLobbyOwner)
                else
                    discord.setParty(api.session.lobbyKey, #lobby.players, 16, lobby.map)
                    react.render("lobbyMenuClient")
                end
                -- Lobby alreadydeleteLobby
                if lobby.server and not blam.isGameDedicated() then
                    api.stopRefreshLobby()
                    connect(lobby.server.map, lobby.server.host, lobby.server.port,
                            lobby.server.password)
                    preventStuckLobby()
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

function api.startLobbyRefresh()
    -- Start a timer to pull lobby data every certain time
    if api.variables.refreshTimerId then
        api.stopRefreshLobby()
    end
    -- Create global function to be called by the timer
    RefreshLobby = function()
        if api.session.lobbyKey then
            api.refreshLobby()
        end
    end
    api.variables.refreshTimerId = set_timer(api.variables.refreshRate, "RefreshLobby")
end
function api.refreshLobby()
    loading(true, "Refreshing lobby...", false)
    if api.session.lobbyKey then
        logger:info("Refreshing lobby data...", "info")
        async(requests.get, function(result)

            onLobbyRefreshResponse(result[1])
        end, api.url .. "/lobby/" .. api.session.lobbyKey)
    end
end
function api.stopRefreshLobby()
    --TODO BALLTZE MIGRATE
    --if api.session.lobbyKey then
    --    pcall(stop_timer, api.variables.refreshTimerId)
    --end
end
function api.deleteLobby()
    if api.session.lobbyKey then
        logger:warning("DELETING lobby")
        --TODO BALLTZE MIGRATE
        --pcall(stop_timer, api.variables.refreshTimerId)
        store:dispatch(actions.setLobby(nil, nil))
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
                preventStuckLobby()
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
            -- Refresh player data
            api.session.player.bipeds = table.merge(api.session.player.bipeds, data.bipeds)
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

---@param response httpResponse<insurrectionLobby[]>
---@return boolean
local function onGetLobbiesResponse(response)
    loading(false)
    if response then
        if response.code == 200 then
            local jsonResponse = response.json()
            if jsonResponse then
                if #jsonResponse == 0 then
                    interface.dialog("ERROR", "NO LOBBIES FOUND",
                                     "There are no lobbies available at the moment.")
                    return false
                else
                    store:dispatch(actions.setLobbies(jsonResponse))
                    react.render("lobbyBrowserMenu")
                end
                return true
            end
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
function api.getLobbies()
    loading(true, "Loading lobbies...", false)
    async(requests.get, function(result)
        onGetLobbiesResponse(result[1])
    end, api.url .. "/lobbies")
end

return api
