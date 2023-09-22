local fs = require "fs"
local tag = require "lua.scripts.modules.tag"

local paths = {
    "data/insurrection/ui/bitmaps/icons/customization_icons",
    "data/insurrection/ui/bitmaps/icons/customization_icons/regions/customization_chest_icons",
    "data/insurrection/ui/bitmaps/icons/customization_icons/regions/customization_helmet_icons",
    "data/insurrection/ui/bitmaps/icons/customization_icons/regions/customization_left_shoulder_icons",
    "data/insurrection/ui/bitmaps/icons/customization_icons/regions/customization_right_shoulder_icons"
}

for _, path in pairs(paths) do
    local name = path:match("([^/]+)$")
    local files = ("$(/usr/bin/ls -1v %s/*.png)"):format(path)
    local output = ("data/insurrection/ui/bitmaps/%s.png"):format(name)
    local command = "convert -bordercolor blue -compose copy -border 1 +append %s %s"
    print(command:format(files, output))

    os.execute(command:format(files, output))

    local bitmapDataPath = output:gsub(".png", ""):gsub("data/", "")
    print(bitmapDataPath)
    command = ("invader-bitmap -F 32-bit -T interface_bitmaps \"%s\""):format(bitmapDataPath)
    os.execute(command)
end
