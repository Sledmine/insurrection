local isJsonModuleAvailable, json = pcall(require, "json")

local curl = {
    _VERSION = "0.0.3",
    -- JSON backend module, you can replace it with any other JSON module
    ---@type {encode: fun(t: table): string; decode: fun(s: string): table} | nil
    json = isJsonModuleAvailable and json or nil
}

local HTTP_PROTOCOL_VERSION_PATTERN = "^HTTP/[1-9]* (%d+)"
local HEADER_PATTERN = "^([%w-]+):%s*(.+)"
local CURL_ERROR_PATTERN = "^curl: "

---@class httpResponse
---@field cookies? table<string, string>
---@field headers table<string, string>
---@field json fun(): table
---@field ok boolean
---@field statusCode number
---@field text string
---@field url string
---@field error string?

---@class requestArgsOptional
---@field params? table<string, string | number>
---@field data? string | table
---@field json? table
---@field headers? table<string, string>
---@field cookies? table<string, string>
---@field auth? string | string[] | table
---@field timeout? number
---@field form? boolean
---@field allowRedirects? boolean
---@field verify? boolean
---@field cert? string

---@class requestArgs : requestArgsOptional
---@field url string

curl.debug = false

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

-- Useful global functions
-- Most of them are already provided in my Luna module: https://github.com/Sledmine/luna
-- If you are not using Luna, you can use these functions to keep the module as standalone as possible

---@param s string
---@return string
local function trim(s)
    return s:match("^%s*(.-)%s*$")
end
if not string["trim"] then
    string.trim = trim
end

--- Parse the output of a curl command
---@param output file*
---@return httpResponse
local function parseCurlOutput(output)
    local code
    local text = ""
    local responseHeaders = {}
    local error

    local line = output:read("l")
    if not line then
        error("curl failed to execute")
    end

    if line:match(CURL_ERROR_PATTERN) then
        error = line
        return {headers = responseHeaders, statusCode = 0, error = error, ok = false}
    end

    while line do
        -- Get http status code, ignore HTTP version
        if line:match(HTTP_PROTOCOL_VERSION_PATTERN) then
            code = tonumber(line:match(HTTP_PROTOCOL_VERSION_PATTERN))
        elseif line:match(HEADER_PATTERN) then
            -- Get response headers
            local key, value = line:match(HEADER_PATTERN)
            responseHeaders[key:lower()] = value
        else
            -- Get response body
            text = text .. line
        end

        ---@type string?
        line = output:read("l")
        if line then
            line = line:trim()
        end
    end

    return {
        text = text,
        headers = responseHeaders,
        statusCode = code,
        json = function()
            if not curl.json then
                _G.error("JSON backend module not found")
            end
            local success, json = pcall(curl.json.decode, text)
            if success then
                return json
            end
            return nil
        end,
        error = error,
        ok = not error and code and code < 400
    }
end

--- Convert a table of parameters to a query string
---@param params table<string, string | number | boolean>
---@return string
local function queryParametersToString(params)
    local query = {}
    for key, value in pairs(params) do
        table.insert(query, string.format("%s=%s", key, value))
    end
    return table.concat(query, "&")
end

--- Prepare a curl command from a request arguments table
---@param args requestArgs | requestArgsOptional
---@param method "GET" | "POST" | "PUT" | "DELETE" | "PATCH" | "HEAD" | "OPTIONS"
---@return string
local function prepareCurlCommand(args, method)
    local curlArgs = {}
    if args.params then
        local query = queryParametersToString(args.params)
        args.url = args.url .. "?" .. query
        args.url = urlencode(args.url)
    end
    if args.auth then
        local auth = args.auth
        if type(auth) == "table" then
            auth = table.concat(auth, ":")
        end
        table.insert(curlArgs, string.format("-u '%s'", auth))
    end
    if args.data then
        if type(args.data) == "table" then
            args.json = args.data --[[@as table]]
        else
            table.insert(curlArgs, "-d '" .. args.data .. "'")
        end
    end
    if args.json then
        args.headers = args.headers or {}
        args.headers["Content-Type"] = "application/json"
        table.insert(curlArgs, "-d '" .. curl.json.encode(args.json) .. "'")
    end
    if args.headers then
        for key, value in pairs(args.headers) do
            table.insert(curlArgs, string.format("-H '%s: %s'", key, value))
        end
    end
    if args.cookies then
        local cookies = {}
        for key, value in pairs(args.cookies) do
            table.insert(cookies, string.format("%s=%s", key, value))
        end
        table.insert(curlArgs, string.format("-b '%s'", table.concat(cookies, "; ")))
    end
    if args.timeout then
        table.insert(curlArgs, string.format("--max-time %d", args.timeout))
    end
    if args.allowRedirects then
        table.insert(curlArgs, "-L")
    end
    if args.verify then
        table.insert(curlArgs, "-k")
    end
    if args.cert then
        table.insert(curlArgs, string.format("--cert %s", args.cert))
    end
    local cmd = string.format("curl -i -sS -X %s '%s' %s 2>&1", method, args.url,
                              table.concat(curlArgs, " "))
    if curl.debug then
        print(cmd)
    end
    return cmd
end

--- Execute a request to a URL using curl
---@param method "GET" | "POST" | "PUT" | "DELETE" | "PATCH" | "HEAD" | "OPTIONS"
---@param args requestArgs | requestArgsOptional
---@return httpResponse
local function request(method, args)
    local cmd = prepareCurlCommand(args, method)
    local process = assert(io.popen(cmd, "r"))
    local response = parseCurlOutput(process)
    process:close()
    return response
end

--- Create and execute a request to a URL using curl
---@param method "GET" | "POST" | "PUT" | "DELETE" | "PATCH" | "HEAD" | "OPTIONS"
---@param url string
---@param args requestArgsOptional
---@return httpResponse
function curl.request(method, url, args)
    args = args or {}
    ---@diagnostic disable-next-line: inject-field
    args.url = url
    return request(method, args)
end

--- Execute a GET request to a URL using curl
---@overload fun(args: requestArgs): httpResponse
---@overload fun(url: string, args?: requestArgsOptional): httpResponse
---@return httpResponse
function curl.get(...)
    local varargs = {...}
    ---@type requestArgsOptional
    local args = varargs[1]
    if type(varargs[1]) == "string" then
        args = varargs[2] or {}
        args.url = varargs[1]
    end
    return request("GET", args)
end

--- Execute a POST request to a URL using curl
---@overload fun(args: requestArgs): httpResponse
---@overload fun(url: string, args?: requestArgsOptional): httpResponse
---@return httpResponse
function curl.post(...)
    local varargs = {...}
    ---@type requestArgsOptional
    local args = varargs[1]
    if type(varargs[1]) == "string" then
        args = varargs[2] or {}
        args.url = varargs[1]
    end
    return request("POST", args)
end

--- Execute a PUT request to a URL using curl
---@overload fun(args: requestArgs): httpResponse
---@overload fun(url: string, args?: requestArgsOptional): httpResponse
---@return httpResponse
function curl.put(...)
    local varargs = {...}
    ---@type requestArgsOptional
    local args = varargs[1]
    if type(varargs[1]) == "string" then
        args = varargs[2] or {}
        args.url = varargs[1]
    end
    return request("PUT", args)
end

--- Execute a DELETE request to a URL using curl
---@overload fun(args: requestArgs): httpResponse
---@overload fun(url: string, args?: requestArgsOptional): httpResponse
---@return httpResponse
function curl.delete(...)
    local varargs = {...}
    ---@type requestArgsOptional
    local args = varargs[1]
    if type(varargs[1]) == "string" then
        args = varargs[2] or {}
        args.url = varargs[1]
    end
    return request("DELETE", args)
end

--- Execute a PATCH request to a URL using curl
---@overload fun(args: requestArgs): httpResponse
---@overload fun(url: string, args?: requestArgsOptional): httpResponse
---@return httpResponse
function curl.patch(...)
    local varargs = {...}
    ---@type requestArgsOptional
    local args = varargs[1]
    if type(varargs[1]) == "string" then
        args = varargs[2] or {}
        args.url = varargs[1]
    end
    return request("PATCH", args)
end

--- Execute a HEAD request to a URL using curl
---@overload fun(args: requestArgs): httpResponse
---@overload fun(url: string, args?: requestArgsOptional): httpResponse
---@return httpResponse
function curl.head(...)
    local varargs = {...}
    ---@type requestArgsOptional
    local args = varargs[1]
    if type(varargs[1]) == "string" then
        args = varargs[2] or {}
        args.url = varargs[1]
    end
    return request("HEAD", args)
end

--- Execute an OPTIONS request to a URL using curl
---@overload fun(args: requestArgs): httpResponse
---@overload fun(url: string, args?: requestArgsOptional): httpResponse
---@return httpResponse
function curl.options(...)
    local varargs = {...}
    ---@type requestArgsOptional
    local args = varargs[1]
    if type(varargs[1]) == "string" then
        args = varargs[2] or {}
        args.url = varargs[1]
    end
    return request("OPTIONS", args)
end

return curl
