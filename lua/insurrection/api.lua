local lanes = require"lanes".configure()
local json = require "json"
local asyncLibs = "base, table, package, string"
local blam = require "blam"
local requests = require "requestscurl"
local interface = require "insurrection.interface"
local glue = require "glue"
local exists = glue.canopen
local trim = glue.string.trim
local actions = require "insurrection.redux.actions"
local core = require "insurrection.core"
local harmony = require "mods.harmony"

local api = {}
api.host = read_file("insurrection_host") or "http://localhost:4343/"
api.version = "v1"
api.url = api.host .. api.version
api.variables = {refreshRate = 5000, refreshTimerId = nil}
api.session = {token = nil, lobbyKey = nil, username = nil}

-- Models

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

---@class availableParameters
---@field maps string[]
---@field gametypes string[]
---@field templates string[]

---@class lobbyRoom
---@field owner string
---@field members string[]
---@field map string
---@field gametype string
---@field template string
---@field available availableParameters
---@field server serverInstance

---Set game in loading state
---@param isLoading boolean
---@param text? string
---@param blockInput? boolean
local function loading(isLoading, text, blockInput)
    if isLoading then
        if blockInput then
            harmony.menu.block_input(true)
        end
        LoadingText = text or "Loading..."
    else
        harmony.menu.block_input(false)
        LoadingText = nil
    end
end

function async(func, callback, ...)
    if (#Lanes == 0) then
        Lanes[#Lanes + 1] = {thread = lanes.gen(asyncLibs, func)(...), callback = callback}
    else
        dprint("Warning! An async function is trying to add another thread!", "warning")
    end
end

local function connect(map, host, port, password)
    --if exists("maps\\" .. map .. ".map") then
        core.connectServer(host, port, password)
    --else
    --    interface.dialog("ERROR", "LOCAL MAP NOT FOUND",
    --                     "Map \"" .. map .. "\" was not found on your game files.")
    --end
end

-- Request login
local function onLoginResponse(result)
    loading(false)
    local code = result[1]
    local payload = result[2]
    if code then
        if code == 200 then
            local response = json.decode(payload)
            api.session.token = response.token
            api.session.username = response.username
            requests.headers = {"Authorization: Bearer " .. api.session.token}
            interface.dashboard()
            return true
        elseif code == 401 then
            local response = json.decode(payload)
            interface.dialog("ATTENTION", "ERROR " .. code, response.message)
            return false
        end
    end
    interface.dialog("ERROR", "UNKNOWN ERROR",
                     "An unknown error has ocurred, please try again later.")
end
function api.login(username, password)
    loading(true, "Logging in...")
    async(requests.post, onLoginResponse, api.url .. "/login",
          {username = username, password = password})
end

-- Request lobby
local function onLobbyResponse(result)
    dprint("onLobbyResponse", "info")
    loading(false)
    local code = result[1]
    local payload = result[2]
    if code then
        if code == 200 then
            ---@class lobbyResponse
            ---@field key string
            ---@field lobby lobbyRoom

            ---@type lobbyResponse
            local response = json.decode(payload)
            if response then
                interface.lobby()
                -- We asked for a new lobby room
                if response.key then
                    api.session.lobbyKey = response.key
                    store:dispatch(actions.setLobby(response.key, response.lobby))
                else
                    -- We have to joined an existing lobby
                    ---@type lobbyRoom
                    local lobby = response
                    store:dispatch(actions.setLobby(api.session.lobbyKey, response))
                    -- There is a server already running for this lobby, connect to it
                    if lobby.server then
                        connect(lobby.server.map, lobby.server.host, lobby.server.port,
                                lobby.server.password)
                        return true
                    end
                end
                ScreenCornerText = api.session.lobbyKey
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
            end
            return true
        else
            api.session.lobbyKey = nil
            local response = json.decode(payload)
            interface.dialog("ATTENTION", "ERROR " .. code, response.message)
            return false
        end
    end
    interface.dialog("ERROR", "UNKNOWN ERROR",
                     "An unknown error has ocurred, please try again later.")
end
function api.lobby(lobbyKey)
    loading(true, "Loading lobby...")
    if lobbyKey then
        api.session.lobbyKey = lobbyKey
        async(requests.get, onLobbyResponse, api.url .. "/lobby/" .. lobbyKey)
    else
        async(requests.get, onLobbyResponse, api.url .. "/lobby")
    end
end

-- Request lobby refresh
local function onLobbyRefreshResponse(result)
    dprint("onLobbyRefreshResponse", "info")
    loading(false)
    local code = result[1]
    local payload = result[2]
    if code then
        if code == 200 then
            ---@type lobbyRoom
            local lobby = json.decode(payload)
            if lobby then
                -- Update previously joined lobby data
                store:dispatch(actions.updateLobby(api.session.lobbyKey, lobby))
                -- Lobby already started, join the server
                if lobby.server then
                    connect(lobby.server.map, lobby.server.host, lobby.server.port,
                            lobby.server.password)
                end
            end
            return true
        else
            api.stopRefreshLobby()
            -- TODO Add a generic error handling function for this
            local response = json.decode(payload)
            interface.dialog("ATTENTION", "ERROR " .. code, response.message)
            return false
        end
    end
    api.stopRefreshLobby()
    interface.dialog("ERROR", "UNKNOWN ERROR", "An error has ocurred, at refreshing lobby data.")
    return false
end
function api.refreshLobby()
    loading(true, "Refreshing lobby...", false)
    if api.session.lobbyKey then
        dprint("Refreshing lobby data...", "info")
        async(requests.get, onLobbyRefreshResponse, api.url .. "/lobby/" .. api.session.lobbyKey)
    end
end
function api.stopRefreshLobby()
    if api.session.lobbyKey then
        dprint("Stopping lobby refresh...", "warning")
        pcall(stop_timer, api.variables.refreshTimerId)
        api.variables.refreshTimerId = nil
        api.session.lobbyKey = nil
    end
end

-- Request instanced server
local function onBorrowResponse(result)
    loading(false)
    local code = result[1]
    local payload = result[2]
    if code then
        if code == 200 then
            -- Prevent lobby from refreshing while we are waiting for the server to start
            -- This is critical to avoid crashing the game due to multitasking stuff
            api.stopRefreshLobby()
            ---@class serverBorrowResponse
            ---@field password string
            ---@field message string
            ---@field port number
            ---@field host string
            ---@field map string

            ---@type serverBorrowResponse
            local response = json.decode(payload)
            connect(response.map, response.host, response.port, response.password)
            return true
        elseif code == 404 then
            local response = json.decode(payload)
            interface.dialog("ATTENTION", "ERROR " .. code, response.message)
            return false
        else
            api.stopRefreshLobby()
            if code == 500 then
                interface.dialog("ATTENTION", "ERROR " .. code, "Internal Server Error")
                return false
            else
                local response = json.decode(payload)
                interface.dialog("ATTENTION", "ERROR " .. code, response.message)
                return false
            end
        end
    end
    api.stopRefreshLobby()
    interface.dialog("ERROR", "UNKNOWN ERROR",
                     "An unknown error has ocurred, please try again later.")
end
function api.borrow(template, map, gametype)
    loading(true, "Borrowing game server...", false)
    async(requests.get, onBorrowResponse, api.url .. "/borrow/" .. template .. "/" .. map .. "/" ..
              gametype .. "/" .. api.session.lobbyKey)
end

return api
