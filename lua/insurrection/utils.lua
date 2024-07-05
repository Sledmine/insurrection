local utils = {}

---Returns the path, filename or name, and extension of a path
---@param path string
---@return {path: string, name: string, extension?: string}
function utils.path(path)
    local split = path:split("\\")
    local pathElements = table.copy(split)
    table.remove(pathElements, #pathElements)
    local path = table.concat(pathElements, "\\")
    local name = split[#split]
    local extension
    if name:includes "." then
        split = name:split "."
        name = split[1]
        extension = split[#split]
    end
    return {path = path, name = name, extension = extension}
end

---Executes a function after a delay
---@param milliseconds number
---@param callback function
function utils.delay(milliseconds, callback)
    --TODO BALLZTE MIGRATE
    --_G[tostring(callback)] = function()
    --    callback()
    --    return false
    --end
    --local timerId = set_timer(milliseconds, tostring(callback))
end

---Returns an upper sentence case string from a snake case string
---@param s string
function utils.snakeCaseToUpperTitleCase(s)
    return s:upper():replace("_", " ")
end

---Returns a tile case string from a snake case string
---@param s string
function utils.snakeCaseToTitleCase(s)
    return s:replace("_", " "):gsub("(%l)(%w*)", function(a, b)
        return a:upper() .. b
    end)
end

---Returns a table sorted alphabetically by key
---@generic K,V
---@param t table<K,V>
---@return table<K,V>
function utils.sortTableAlphabetically(t)
    local sorted = table.copy(t)
    table.sort(sorted, function(a, b)
        return a.label < b.label
    end)
    return sorted
end

return utils
