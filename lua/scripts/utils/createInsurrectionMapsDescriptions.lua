local fs = require "fs"
local tag = require "lua.scripts.modules.tag"

local images = {
    -- Stock maps
    "beavercreek",
    "sidewinder",
    "damnation",
    "ratrace",
    "prisoner",
    "hangemhigh",
    "chillout",
    "carousel", -- derelict
    "boardingaction",
    "bloodgulch",
    "wizard",
    "putput", -- chirontl34
    "longest",
    "icefields",
    "deathisland",
    "dangercanyon",
    "infinity",
    "timberland",
    "gephyrophobia",
    -- Custom maps
    -- "gridiron",
    "ascetic",
    "augurer",
    "bigass",
    "blamite_mines",
    "blood_covenantv3",
    "cold_shoulder",
    "delta_ruined",
    "disconnect_beta2",
    "fissurefall",
    "forge_island",
    "frigid_keep",
    "gothra-mp",
    "hk-bowser",
    "hk-koopa",
    "hk-peach",
    "hk-wario",
    "hk-yoshi",
    "h3 foundry",
    "immure",
    "intensity-plus",
    "metrobyte",
    "nitra",
    "ruins_of_alph",
    "sali_creek",
    "sympathy",
    "warren",
    -- Keymind maps
    "treason"
}

local existingImages = {}

for _, image in ipairs(images) do
    local image = image:lower()
    local imageFolderPath =
        [[data/insurrection/ui/bitmaps/descriptions/insurrection_maps_description_source/]] .. image
    local imageDataFolderPath =
        [[data/insurrection/ui/bitmaps/descriptions/insurrection_maps_description/]] .. image
    local bitmapFolderPath = [[data/insurrection/ui/bitmaps/insurrection_maps/]] .. image
    local bitmapPath = [[insurrection/ui/bitmaps/insurrection_maps/]] .. image
    if fs.is(imageDataFolderPath) then
        print("Skipping " .. image .. " because it already exists")
        existingImages[#existingImages + 1] = image
        goto continue
    end
    fs.mkdir(imageFolderPath)
    fs.mkdir(imageDataFolderPath)
    for name, d in fs.dir(imageFolderPath) do
        if not name then
            print("error: ", d)
            break
        end
        local type = d:attr "type"
        if type == "file" then
            -- Use image magick convert to resize image to 534x300 and save it to the new directory
            os.execute(
                [[convert "]] .. d:path() .. [[" -resize 534x300 "]] .. imageDataFolderPath .. [[/]] ..
                    name .. [["]])
        end
    end
    -- Merge images with each other and save it to the new directory
    os.execute([[cd "]] .. imageDataFolderPath ..
                   [[" && convert -bordercolor blue -border 1 +append $(ls -1v) "../../../insurrection_maps/]] ..
                   image .. [[.png"]])
    os.execute([[invader-bitmap -F 32-bit -T interface_bitmaps "]] .. bitmapPath .. [["]])
    ::continue::
end

local bitmapsTagCollection = {tags = {}}
for _, image in ipairs(existingImages) do
    local image = image:lower()
    local tagPath = [[insurrection/ui/bitmaps/insurrection_maps/]] .. image .. [[.bitmap]]
    if fs.is("tags/" .. tagPath) then
        bitmapsTagCollection.tags[#bitmapsTagCollection.tags + 1] = {reference = tagPath}
    end
end
tag.create([[insurrection/ui/shared/insurrection_maps.tag_collection]], bitmapsTagCollection)
