--- Convert any lua table to a ui_widget_definition
local fs = require "fs"
local tag = require "lua.scripts.modules.tag"

local bitmapTemplate = [[invader-bitmap -F 32-bit -T interface_bitmaps %s]]

local nameplatesCollection = {tags = {}}
fs.cd("data")
for name, d in fs.dir([[insurrection/ui/bitmaps/icons]]) do
    if not name then
        print("error: ", d)
        break
    end
    local type = d:attr "type"
    if (type == "file") then
        local filePath = d:path()
        print(filePath)

        local bitmapPath = filePath:gsub("%.png", "")
        os.execute(bitmapTemplate:format(bitmapPath))
    end
end
