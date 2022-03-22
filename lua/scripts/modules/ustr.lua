-- Create unicode string list tag, given a string table
-- Sledmine
-- Only ASCII text is supported by now (ironically), implementation is experimental be careful
local glue = require "lua.glue"
local append = glue.append
--local crc32 = require "lua.scripts.modules.crc32"

local function padding(length)
    return string.rep("\0", length)
end

local function byte(value)
    return string.char(value)
end

---Map a value as a dword
---@param value any
---@return any
local function dword(value)
    if value > 255 then
        error("Invalid DWORD value")
    end
    -- TODO Add a real DWORD implementation of this
    return string.rep("\0", 3) .. byte(value)
end

---Create unicode string list tag
---@param strings string[]
---@return string
local function ustr(tagPath, strings)
    print("Creating USTR: " .. tagPath)
    local tag = {
        padding(36),
        -- Tag class/group
        "ustr",
        -- CRC32 checksum
        padding(4),
        padding(3),
        byte(0x40),
        padding(9),
        byte(0x1),
        -- Some kind of type identifers
        padding(1),
        byte(0xFF),
        -- Engine target
        "blam",
        -- Strings quantity
        dword(#strings),
        padding(8)
        -- Tag body
    }
    -- Generate string indexes
    for _, str in ipairs(strings) do
        local unicodeStringSize = (#str * 2) + 2
        append(tag, dword(unicodeStringSize))
        append(tag, padding(16))
    end
    -- Generate unicode strings
    for _, str in ipairs(strings) do
        for i = 1, #str do
            local char = str:sub(i, i)
            append(tag, char)
            append(tag, padding(1))
        end
        append(tag, padding(2))
    end
    -- TODO Add real tag checksum calculation
    --local tagBody = table.concat(tag, "", 10)
    --local crc = crc32(tagBody)
    --print(crc)
    --tag[3] = glue.string.fromhex(tostring(crc))
    local bin = table.concat(tag, "")
    if glue.writefile("tags/" .. tagPath, bin, "b") then
        return true
    end
    error("Could not create USTR tag")
end

return ustr