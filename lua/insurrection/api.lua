local lanes = require"lanes".configure()
local json = require "json"
local asyncLibs = "base, table, package, string"
local blam = require "blam"
local requests = require "requestscurl"
local interface = require "insurrection.interface"
local glue = require "glue"
local trim = glue.string.trim
local actions = require "insurrection.redux.actions"
local core = require "insurrection.core"
local harmony = require "mods.harmony"

local api = {}
api.host = read_file("insurrection_host") or "http://localhost:4343/"
api.version = "v1"
api.url = api.host .. api.version
api.variables = {refreshRate = 5000, refreshTimerId = nil}
api.session = {token = nil, lobbyKey = nil}

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

---@class lobbyRoom
---@field owner string
---@field members string[]
---@field maps string[]
---@field gametypes string[]
---@field templates string[]
---@field server serverInstance

function async(func, callback, ...)
    harmony.menu.block_input(true)
    if (#Lanes == 0) then
        Lanes[#Lanes + 1] = {thread = lanes.gen(asyncLibs, func)(...), callback = callback}
    else
        console_out("Error there is another thread in the queue!")
    end
end

-- Request login
local function onLoginResponse(result)
    local code = result[1]
    local payload = result[2]
    if code then
        if code == 200 then
            local response = json.decode(payload)
            api.session.token = response.token
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
    async(requests.post, onLoginResponse, api.url .. "/login",
          {username = username, password = password})
end

-- Request lobby
local function onLobbyResponse(result)
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
                    store:dispatch(actions.setLobby(api.session.lobbyKey, response))
                end
                ScreenCornerText = api.session.lobbyKey
                -- Start a timer to pill lobby data every certain time
                if api.variables.refreshTimerId then
                    pcall(stop_timer, api.variables.refreshTimerId)
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
    if lobbyKey then
        api.session.lobbyKey = lobbyKey
        async(requests.get, onLobbyResponse, api.url .. "/lobby/" .. lobbyKey)
    else
        async(requests.get, onLobbyResponse, api.url .. "/lobby")
    end
end

-- Request lobby refresh
local function onLobbyRefreshResponse(result)
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
                    core.connectServer(lobby.server.host, lobby.server.port, lobby.server.password)
                end
            end
            return true
        else
            -- TODO Add a generic error handling function for this
            -- local response = json.decode(payload)
            -- interface.dialog("ATTENTION", "ERROR " .. code, response.message)
            -- return false
        end
    end
    console_out("An error has ocurred at refreshing lobby.")
    pcall(stop_timer, api.variables.refreshTimerId)
end
function api.refreshLobby()
    if api.session.lobbyKey then
        async(requests.get, onLobbyRefreshResponse, api.url .. "/lobby/" .. api.session.lobbyKey)
    end
end

-- Request instanced server
local function onBorrowResponse(result)
    local code = result[1]
    local payload = result[2]
    if code then
        if code == 200 then
            ---@class serverBorrowResponse
            ---@field password string
            ---@field message string
            ---@field port number
            ---@field host string

            ---@type serverBorrowResponse
            local response = json.decode(payload)
            core.connectServer(response.host, response.port, response.password)
            return true
        elseif code == 500 then
            interface.dialog("ATTENTION", "ERROR " .. code, "Internal Server Error")
            return false
        else
            local response = json.decode(payload)
            interface.dialog("ATTENTION", "ERROR " .. code, response.message)
            return false
        end
    end
    interface.dialog("ERROR", "UNKNOWN ERROR",
                     "An unknown error has ocurred, please try again later.")
end
function api.borrow(template, map, gametype)
    async(requests.get, onBorrowResponse, api.url .. "/borrow/" .. template .. "/" .. map .. "/" ..
              gametype .. "/" .. api.session.lobbyKey)
end

return api
