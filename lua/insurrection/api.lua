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
local harmony = require "mods.harmony"
local menus = require "insurrection.menus"
local shared = interface.shared
local constants = require "insurrection.constants"
local loading = core.loading
local luna = require "luna"

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

---Load Insurrection URL to be used by the API
---@param host? string
function api.loadUrl(host)
    api.version = "v1"
    api.host = read_file("insurrection_host") or host or "http://localhost:4343/"
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
            if DebugMode then
                jsonResponse.customization = json.decode([[{
                    "the_flood_mp": {
                        "maps": [
                            "treason",
                            "bleed_it_out",
                            "impasse",
                            "last_voyage"
                        ],
                        "tags": [
                            "keymind\\halo_infinite\\characters\\unsc\\odst\\mirage_core\\mirage_mp.biped"
                        ]
                    },
                    "forge_island": {
                        "maps": [
                            "forge_island_dev",
                            "forge_island"
                        ],
                        "tags": [
                            "[shm]\\halo_4\\characters\\mjolnir_gen2\\mjolnir_gen2_mp.biped"
                        ]
                    },
                    "coop_evolved": {
                        "maps": [
                            "b30_coop_evolved_dev",
                            "a50_coop_evolved",
                            "b30_coop_evolved",
                            "c10_coop_evolved",
                            "c20_coop_evolved",
                            "d40_coop_evolved"
                        ],
                        "tags": [
                            "[shm]\\halo_1\\characters\\mjolnir_gen_1\\mjolnir_gen_1_mp.biped",
                            "characters\\elite_mp\\elite_mp.biped",
                            "characters\\grunt\\yapyap\\yapyap_mp.biped",
                            "characters\\marine_armored_mp\\marine_mp.biped"
                        ]
                    }
                }]])
            end
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
    dprint("onLobbyResponse", "info")
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
                api.startLobbyRefresh()
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
        dprint("Refreshing lobby data...", "info")
        async(requests.get, function(result)
            onLobbyRefreshResponse(result[1])
        end, api.url .. "/lobby/" .. api.session.lobbyKey)
    end
end
function api.stopRefreshLobby()
    if api.session.lobbyKey then
        pcall(stop_timer, api.variables.refreshTimerId)
    end
end
function api.deleteLobby()
    if api.session.lobbyKey then
        dprint("DELETING lobby", "warning")
        pcall(stop_timer, api.variables.refreshTimerId)
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

api.loadUrl()

return api
