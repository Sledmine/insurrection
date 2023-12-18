-- Create unicode string list tag, given a string list
-- Sledmine
-- Full string length and UTF-16 support
package.path = package.path .. ";lua/scripts/modules/?.lua"
require "lua.scripts.modules.compat53.init"
local utf8string = require "lua.scripts.modules.utf8string"
require "lua.scripts.modules.unicode"
-- local crc32 = require "lua.scripts.modules.crc32"

local function padding(length)
    return string.rep("\0", length)
end

local function byte(value)
    return string.char(value)
end

---Map a value as a dword
---@param value any
---@return string
local function dword(value)
    return string.pack(">I", value)
end

---Create unicode string list tag
---@param strings string[]
---@return string?
local function ustr(tagPath, strings)
    local outputTagPath = "tags/" .. tagPath
    local stringTag = io.open(outputTagPath, "wb")
    print("Creating USTR: " .. tagPath)
    if stringTag then

        stringTag:write(padding(36))
        -- Tag class/group
        stringTag:write("ustr")
        -- CRC32 checksum
        stringTag:write("\xFF\xFF\xFF\xFF")
        stringTag:write(padding(3))
        -- Unknown
        stringTag:write(byte(0x40))
        stringTag:write(padding(9))
        -- Unknown
        stringTag:write(byte(0x1))
        stringTag:write(padding(1))
        -- Unknown
        stringTag:write(byte(0xFF))
        -- Engine target
        stringTag:write("blam")
        -- Strings quantity
        stringTag:write(dword(#strings))
        stringTag:write(padding(8))
        -- Tag body

        -- Generate string indexes
        for _, str in ipairs(strings) do
            local ustring = utf8string(str)
            local unicodeStringSize = (#ustring * 2) + 2
            stringTag:write(dword(unicodeStringSize))
            stringTag:write(padding(16))
        end
        -- Generate unicode strings
        for _, str in ipairs(strings) do
            local ustring = utf8string(str)
            stringTag:write(utf8to16(tostring(ustring)))
            stringTag:write(padding(2))
        end
        -- TODO Add real tag checksum calculation
        -- local tagBody = table.concat(tag, "", 10)
        -- local crc = crc32(tagBody)
        -- print(crc)
        -- tag[3] = string.fromhex(tostring(crc))

        stringTag:close()
        return tagPath
    end
    error("Could not create USTR tag")
end

return ustr
