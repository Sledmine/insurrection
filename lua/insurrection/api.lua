local lanes = require"lanes".configure()
local json = require "json"
local blam = require "blam"
local requests = require "requestscurl"
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

local function onLoginResponse(result)
    local code = result[1]
    local payload = result[2]
    if code then
        if code == 200 then
            local response = json.decode(payload)
            api.session.token = response.token
            blam.consoleOutput(inspect(response))
            return true
        elseif code == 401 then
            console_out("Wrong credentials, verify your data and try again")
            return false
        end
    end
    console_out("An error ocurred at attemping to login")
end

local requestLogin = function(url, username, password)
    return requests.post(url, {username = username, password = password})
end
function api.login(username, password)
    async(requestLogin, onLoginResponse, api.url .. "/login", username, password)
end

return api
