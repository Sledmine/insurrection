--- Convert any lua table to a ui_widget_definition
local fs = require "fs"
local tag = require "lua.scripts.modules.tag"

local bitmapTemplate = tag.runner .. [[invader-bitmap -F 32-bit -T interface_bitmaps %s]]

local nameplatesCollection = {tags = {}}
fs.cd("data")
for name, d in fs.dir([[insurrection/ui/shared/bitmaps/nameplates]]) do
    if not name then
        print("error: ", d)
        break
    end
    local type = d:attr "type"
    if (type == "file") then
        local filePath = d:path()
        print(filePath)
        nameplatesCollection.tags[#nameplatesCollection.tags + 1] = {
            reference = filePath:gsub("%.png", ".bitmap")
        }

        local bitmapPath = filePath:gsub("%.png", "")
        os.execute(bitmapTemplate:format(bitmapPath))
    end
end
tag.create([[insurrection/ui/shared/nameplates.tag_collection]], nameplatesCollection)
