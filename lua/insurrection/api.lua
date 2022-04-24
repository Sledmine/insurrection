local lanes = require"lanes".configure()
local json = require "json"
local blam = require "blam"
local requests = require "requestscurl"
local interface = require "insurrection.interface"
local glue = require "glue"
local trim = glue.string.trim
local actions = require "insurrection.redux.actions"
local asyncLibs = "base, table, package, string"

local api = {}
api.host = "http://localhost:4343/"
api.version = "v1"
api.url = api.host .. api.version
api.session = {}

function async(func, callback, ...)
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
            api.lobby()
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
    async(requests.post, onLoginResponse, api.url .. "/login", {username = username, password = password})
end

-- Request lobby
local function onLobbyResponse(result)
    local code = result[1]
    local payload = result[2]
    if code then
        if code == 200 then
            local response = json.decode(payload)
            blam.consoleOutput(inspect(response))
            store:dispatch(actions.setLobby(response.key, response.lobby))
            api.session.lobbyKey = response.key
            interface.lobby()
            return true
        else
            local response = json.decode(payload)
            interface.dialog("ATTENTION", "ERROR " .. code, response.message)
            return false
        end
    end
    interface.dialog("ERROR", "UNKNOWN ERROR",
                     "An unknown error has ocurred, please try again later.")
end
function api.lobby()
    async(requests.get, onLobbyResponse, api.url .. "/lobby")
end

-- Request instanced server
local function onBorrowResponse(result)
    local code = result[1]
    local payload = result[2]
    if code then
        if code == 200 then
            local response = json.decode(payload)
            local host = response.host
            local port = response.port
            local password = response.password
            local command = "connect %s:%s %s"
            execute_script(command:format(host, port, password))
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
    async(requests.get, onBorrowResponse,
          api.url .. "/borrow/" .. template .. "/" .. map .. "/" .. gametype .. "/" .. api.session.lobbyKey)
end

return api
