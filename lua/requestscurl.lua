local requests = {}

requests.headers = {}

---Perform a GET request
---@param url string
---@return integer
---@return string
function requests.get(url)
    local curl = require "lcurl.safe"
    local buffer = {}
    local request = curl.easy {
        url = url,
        httpheader = requests.headers,
        writefunction = function(input)
            table.insert(buffer, input)
        end
    }:perform()
    if request then
        local code = request:getinfo_response_code()
        local content = table.concat(buffer)
        request:close()
        return code, content
    end
end

---Perform a POST request
---@param url string
---@param params? table<string, string | number>
---@return integer
---@return string
function requests.post(url, params)
    -- TODO Implement different types of POST
    local curl = require "lcurl.safe"
    local buffer = {}
    local body = ""
    for k, v in pairs(params) do
        body = body .. k .. "=" .. v .. "&"
    end
    -- Remove last "&"
    body = body:sub(1, #body - 1)
    local request = curl.easy {
        url = url,
        httpheader = {"Content-Type: application/x-www-form-urlencoded"},
        writefunction = function(input)
            table.insert(buffer, input)
        end
    }:setopt_postfields(body):perform()
    if request then
        local code = request:getinfo_response_code()
        local content = table.concat(buffer)
        request:close()
        return code, content
    end
end

return requests
