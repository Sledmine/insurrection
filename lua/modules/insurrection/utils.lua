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
    local timer
    timer = Balltze.misc.setTimer(milliseconds, function()
        -- Prevent the entire game from crashing as Balltze does not handle errors in timers lol
        local success, message = pcall(callback)
        if not success then
            logger:error("Error in delay callback: %s", message)
        end
        timer.stop()
    end)
end

---Returns an upper sentence case string from a snake case string
---@param s string
function utils.snakeCaseToUpperTitleCase(s)
    local str = s:upper():replace("_", " ")
    return str
end

---Returns a tile case string from a snake case string
---@param s string
function utils.snakeCaseToTitleCase(s)
    local str = s:replace("_", " "):gsub("(%l)(%w*)", function(a, b)
        return a:upper() .. b
    end)
    return str
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

---Returns a snake case string from a camel case string
---@param s string
---@return string
function utils.camelCaseToSnakeCase(s)
    -- Convert camelCase to snake_case but keep numbers
    s = s:sub(1, 1):lower() .. s:sub(2)
    local new = s:gsub("([A-Z])", function(c)
        return "_" .. c:lower()
    end)
    if new:sub(1, 1) == "_" then
        new = new:sub(2)
    end
    return new
end

return utils
