--- Convert any lua table to a ui_widget_definition
local fs = require "fs"
local tag = require "lua.scripts.modules.tag"

local bitmapTemplate = tag.runner .. [[invader-bitmap -F 16-bit -T interface_bitmaps %s]]

local descriptions = {
    "By Unknown",
    "By Unknown\nEdit by Sledmine",
    "By Dan Brindley Johnson (https://www.artstation.com/artwork/R3G4aE)\nEdit by Sledmine",
    "By Dan Brindley Johnson (https://www.artstation.com/artwork/d853AW)\nEdit by Sledmine",
    "By Sherning",
    "By Sherning",
    "By Halo Legends (Origins II)\nEdit by Sledmine",
    "By Unknown",
    "By Unknown",
    "By Unknown",
    "By Unknown",
    "By Unknown (https://wall.alphacoders.com/big.php?i=240616)\nEdit by Sledmine",
    "By Unknown (https://p4.wallpaperbetter.com/wallpaper/14/471/737/halo-wars-new-game-wallpaper-preview.jpg)\nEdit by Sledmine",
    "By Isaac Hannaford (https://www.artstation.com/artwork/4Nd2q)\nEdit by Sledmine",
    "By Ruvilax",
    "By Michelle Sellers (https://cutewallpaper.org/21/halo-odst-wallpaper-hd/view-page-21.html)\nEdit by Ruvilax",
    "By Halo Legends (Odd One Out)\nEdit by Mark Mc'Fuzz",
    "Edit by Mizushina",
    "By Hakobe20 (https://twitter.com/Hakobe20/status/1554227481896370176/photo/1)\nEdit by Sledmine",
    "By XxQs",
    "By Yissus",
    "By Bungie\nEdit by Mark Mc'Fuzz",
    "By Gabriel Lopes (https://wall.alphacoders.com/big.php?i=1151373)\nEdit by Mark Mc'Fuzz",
    "By 343\nEdit by Mark Mc'Fuzz"
}

local nameplatesCollection = {tags = {}}
fs.cd("data")
for name, d in fs.dir([[insurrection/ui/shared/bitmaps/nameplates]]) do
    if not name then
        print("error: ", d)
        break
    end
    local type = d:attr "type"
    if type == "file" then
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
