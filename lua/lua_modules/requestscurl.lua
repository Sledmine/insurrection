local json = require "json"
local requests = {}

requests.headers = {}
requests.timeout = 300

---@class httpresponse
---@field url string
---@field code number
---@field text string
---@field headers table
---@field json fun() : table?

local function paramsToBodyString(params)
    local body = ""
    for k, v in pairs(params) do
        body = body .. k .. "=" .. v .. "&"
    end
    -- Remove last "&"
    body = body:sub(1, #body - 1)
    return body
end

-- Probably an alternative due to performance
-- https://gist.github.com/liukun/f9ce7d6d14fa45fe9b924a3eed5c3d99
local function urlencode(str)
    -- str = string.gsub(str, "([^0-9a-zA-Z !'()*._~-])", -- locale independent
    str = string.gsub(str, "([ '])", -- locale independent
    function(c)
        return string.format("%%%02X", string.byte(c))
    end)
    str = string.gsub(str, " ", "+")
    return str
end

---Perform a GET request
---@param url string
---@return integer
---@return string
function requests.get(url)
    local curl = require "lcurl.safe"
    local buffer = {}
    local request = curl.easy {
        url = urlencode(url),
        timeout = requests.timeout,
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
    local body = paramsToBodyString(params)
    local headers = {}
    for k, v in pairs(requests.headers) do
        headers[#headers + 1] = v
    end
    headers[#headers + 1] = "Content-Type: application/x-www-form-urlencoded"
    local request = curl.easy {
        url = urlencode(url),
        timeout = requests.timeout,
        httpheader = headers,
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

---Perform a PATCH request
---@param url string
---@param params? table<string, string | number>
---@return httpresponse
function requests.patch(url, params)
    local curl = require "lcurl.safe"
    local requestHeaders = {}
    for k, v in pairs(requests.headers) do
        requestHeaders[#requestHeaders + 1] = v
    end
    requestHeaders[#requestHeaders + 1] = "Content-Type: application/x-www-form-urlencoded"

    local responseBody = {}
    local responseHeaders = {}

    local request = curl.easy {
        url = urlencode(url),
        timeout = requests.timeout,
        httpheader = requestHeaders,
        writefunction = function(input)
            table.insert(responseBody, input)
        end,
        headerfunction = function(header)
            local key = header:match("^([^:]+):")
            if key then
                responseHeaders[key] = header:sub(#key + 2, #header - 2)
            end
        end,
        postfields = paramsToBodyString(params),
        customrequest = "PATCH"
    }:perform()

    if request then
        local url = request:getinfo_effective_url()
        local code = request:getinfo_response_code()
        local responseBody = table.concat(responseBody)
        request:close()
        return {
            url = url,
            code = code,
            text = responseBody,
            headers = responseHeaders,
            json = function()
                return json.decode(responseBody)
            end
        }
    end
end

return requests
