-------------------------------------------------------------------------------
--- INI Module
--- Dynodzzo, Sledmine
--- It has never been that simple to use ini files with Lua
----------------------------------------------------------------------------------
local ini = {
    _VERSION = 1.0,
    _LICENSE = [[
	Copyright (c) 2012 Carreras Nicolas
	
	Permission is hereby granted, free of charge, to any person obtaining a copy
	of this software and associated documentation files (the "Software"), to deal
	in the Software without restriction, including without limitation the rights
	to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
	copies of the Software, and to permit persons to whom the Software is
	furnished to do so, subject to the following conditions:
	
	The above copyright notice and this permission notice shall be included in all
	copies or substantial portions of the Software.
	
	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER G
	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
	OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
	SOFTWARE.
]]
}

--- Returns a table containing all the data from an ini string
---@param fileString string Ini encoded string
---@return table Table containing all data from the ini string
function ini.decode(fileString)
    local position, lines = 0, {}
    for st, sp in function()
        return string.find(fileString, "\n", position, true)
    end do
        table.insert(lines, string.sub(fileString, position, st - 1))
        position = sp + 1
    end
    table.insert(lines, string.sub(fileString, position))
    local data = {}
    local section
    for lineNumber, line in pairs(lines) do
        if string.sub(line, 1, 1) == "[" then
            section = string.sub(line, 2, string.find(line, "]") - 1)
            data[section] = {}
        elseif section then
            --local key, value = string.match(line, "([^=]*)=(.*)")
            local key, value = string.match(line, "^([%w|_]+)%s-=%s-(.+)$")
            if key and value then
                value = value:gsub("\r", "")
                if (tonumber(value)) then
                    value = tonumber(value)
                elseif (value == "true") then
                    value = true
                elseif (value == "false") then
                    value = false
                end
                if (tonumber(key)) then
                    key = tonumber(key)
                end
                data[section][key] = value
            end
        end
    end
    return data
end

--- Returns a ini encoded string given data
---@param data table Table containing all data from the ini file
---@return string String encoded as an ini file
function ini.encode(data)
    local content = ""
    for section, param in pairs(data) do
        content = content .. ("[%s]\n"):format(section)
        for key, value in pairs(param) do
            content = content .. ("%s=%s\n"):format(key, tostring(value))
        end
        content = content .. "\n"
    end
    return content
end

--- Returns a table containing all the data from an ini file
---@param fileName string Path to the file to load
---@return table Table containing all data from the ini file
function ini.load(fileName)
    assert(type(fileName) == "string", "Parameter \"fileName\" must be a string.")
    local file = assert(io.open(fileName, "r"), "Error loading file : " .. fileName)
    local data = ini.decode(file:read("*"))
    file:close()
    return data
end

--- Saves all the data from a table to an ini file
---@param fileName string The name of the ini file to fill
---@param data table The table containing all the data to store
function ini.save(fileName, data)
    assert(type(fileName) == "string", "Parameter \"fileName\" must be a string.")
    assert(type(data) == "table", "Parameter \"data\" must be a table.")
    local file = assert(io.open(fileName, "w+b"), "Error loading file :" .. fileName)
    file:write(ini.encode(data))
    file:close()
end

return ini
