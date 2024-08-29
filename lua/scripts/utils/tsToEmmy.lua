local luna = require "lua.modules.luna"
local ts = luna.file.read "json-to-ts.ts"
assert(ts, "Failed to read json-to-ts.ts")
-- local emmy = ts:gsub("interface", "---@class"):gsub(" {", ""):gsub("}\n", ""):gsub("}", ""):gsub(
--                 ";", ""):gsub("  ", "---@field "):gsub(":", "")
local emmy = ts:replace("interface", "---@class")
emmy = emmy:replace(" {", "")
emmy = emmy:replace("}\n", "")
emmy = emmy:replace("}","")
emmy = emmy:replace(";", "")
emmy = emmy:replace("  ", "---@field "):replace(":", "")

luna.file.write("emmy.lua", emmy)
