local fs = require "fs"

local images = {
    "ascetic",
    "augurer",
    "bigassv2,104",
    "blamitemines",
    "blood_covenant_classic",
    "blood_covenantv3",
    "cold_shoulder",
    "delta_ruined",
    "disconnect_beta2",
    "fissurefall",
    "frigid_keep",
    "gothra-mp",
    "gridiron",
    "hk-bowser",
    "hk-koopa",
    "hk-peach",
    "hk-wario",
    "hk-yoshi",
    "immure",
    "intensity-plus",
    "metrobyte",
    "nitra",
    "Ruins_of_alph",
    "sali_creek",
    "sympathy_mp",
    "warren"
}

for _, image in ipairs(images) do
    local imageFolderPath = [[images/design/descriptions/insurrection_maps_description/]] .. image
    local imageDataFolderPath = [[data/insurrection/ui/bitmaps/descriptions/insurrection_maps_description/]] .. image
    local bitmapFolderPath = [[data/insurrection/ui/bitmaps/insurrection_maps/]] .. image
    local bitmapPath = [[insurrection/ui/bitmaps/insurrection_maps/]] .. image
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
            os.execute([[convert "]] .. d:path() .. [[" -resize 534x300 "]] .. imageDataFolderPath .. [[/]] .. name .. [["]])
        end
    end
    -- Merge images with each other and save it to the new directory
    os.execute([[cd ]] .. imageDataFolderPath .. [[ && convert -bordercolor blue -border 1 +append $(ls -1v) "../../../insurrection_maps/]] .. image .. [[.png"]])
    os.execute([[invader-bitmap -F 32-bit -T interface_bitmaps "]] .. bitmapPath .. [["]])
end