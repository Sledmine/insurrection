local json = require "json"
local requests = {}

requests.codes = {
    ok = 200,
    created = 201,
    accepted = 202,
    no_content = 204,
    moved_permanently = 301,
    found = 302,
    see_other = 303,
    not_modified = 304,
    temporary_redirect = 307,
    bad_request = 400,
    unauthorized = 401,
    forbidden = 403,
    not_found = 404,
    method_not_allowed = 405,
    not_acceptable = 406,
    request_timeout = 408,
    conflict = 409,
    gone = 410,
    length_required = 411,
    precondition_failed = 412,
    payload_too_large = 413,
    uri_too_long = 414,
    unsupported_media_type = 415,
    range_not_satisfiable = 416,
    expectation_failed = 417,
    im_a_teapot = 418,
    unprocessable_entity = 422,
    too_many_requests = 429,
    internal_server_error = 500,
    not_implemented = 501,
    bad_gateway = 502,
    service_unavailable = 503,
    gateway_timeout = 504
}

requests.headers = {}
requests.timeout = 300

---@class httpResponse<T> : { url: string, code: number, text: string, headers: table<string, string>, json : fun(): T }

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
---@return httpResponse?
function requests.get(url)
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
        httpheader = requests.headers,
        writefunction = function(input)
            table.insert(responseBody, input)
        end,
        headerfunction = function(header)
            local key = header:match("^([^:]+):")
            if key then
                responseHeaders[key] = header:sub(#key + 2, #header - 2)
            end
        end
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

---Perform a POST request
---@param url string
---@param params? table<string, string | number>
---@return httpResponse?
function requests.postform(url, params)
    -- TODO Implement different types of POST
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
        httpheader = headers,
        writefunction = function(input)
            table.insert(responseBody, input)
        end,
        headerfunction = function(header)
            local key = header:match("^([^:]+):")
            if key then
                responseHeaders[key] = header:sub(#key + 2, #header - 2)
            end
        end,
        postfields = paramsToBodyString(params)
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

---Perform a PATCH request
---@param url string
---@param params? table<string, string | number>
---@return httpResponse?
function requests.patch(url, params)
    local curl = require "lcurl.safe"
    
    local requestHeaders = {}
    for k, v in pairs(requests.headers) do
        requestHeaders[#requestHeaders + 1] = v
    end
    requestHeaders[#requestHeaders + 1] = "Content-Type: application/json"

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
        postfields = json.encode(params),
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
