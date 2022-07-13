local glue = require "glue"
local ts = glue.readfile("json-to-ts.ts", "t")
local emmy = ts:gsub("interface", "---@class"):gsub(" {", ""):gsub("}\n", ""):gsub("}", ""):gsub(";", ""):gsub("  ", "---@field "):gsub(":", "")
glue.writefile("emmy.lua", emmy, "t")