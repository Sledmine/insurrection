local glue = require "glue"
local utils = {}

---Returns the path, filename or name, and extension of a path
---@param path string
---@return {path: string, name: string, extension?: string}
function utils.path(path)
    local split = glue.string.split(path, "\\")
    local pathElements = glue.deepcopy(split --[[@as table]])
    table.remove(pathElements, #pathElements)
    local path = table.concat(pathElements, "\\")
    local name = split[#split]
    local extension
    if name:find(".", 1, true) then
        local split = glue.string.split(name, ".")
        name = split[1]
        extension = split[#split]
    end
    return {path = path, name = name, extension = extension}
end

---Executes a function after a delay
---@param delay number
---@param callback function
function utils.delay(delay, callback)
    _G[tostring(callback)] = function ()
        callback()
        return false
    end
    local timerId = set_timer(delay, tostring(callback))
end


return utils
