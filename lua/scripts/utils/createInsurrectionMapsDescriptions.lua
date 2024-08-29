local fs = require "fs"
local tag = require "lua.scripts.modules.tag"
local luna = require "lua.modules.luna"
local base64 = require "lua.modules.base64"
local json = require "lua.modules.json"
local inspect = require "lua.modules.inspect"
local argparse = require "lua.modules.argparse"
local curl = require "lua.scripts.modules.curl-cli"
curl.json = json

---@class CreateInsurrectionMapsDescriptionsArguments
---@field debug boolean
---@field presence boolean
---@field delete boolean

local parser = argparse("createInsurrectionMapsDescriptions",
                        "Create Insurrection maps descriptions")
parser:flag("-d --debug", "Print debug information")
parser:flag("--presence", "Upload rich presence images")
parser:flag("--delete", "Delete previous rich presence images")

---@type CreateInsurrectionMapsDescriptionsArguments
local args = parser:parse()

local function printd(...)
    if args.debug then
        print(...)
    end
end

local DISCORD_TOKEN = os.getenv("DISCORD_TOKEN") or ""
local DISCORD_CLIENT_ID = os.getenv("DISCORD_CLIENT_ID") or ""

local maps = {
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
    -- "blood_covenantv3", -- "blood_covenant",
    "cold_shoulder",
    "delta_ruined",
    "forge_island",
    "frigid_keep",
    "gothra-mp",
    "hk-moo",
    "hk-fort",
    "hk-donut",
    "hk-koopa",
    "hk-peach",
    "hk-wario",
    "hk-yoshi",
    "hk-bowser",
    "hk-banshee",
    "hk-sherbert",
    "h3 foundry",
    "immure",
    "metrobyte",
    "nitra",
    "ruins_of_alph",
    "sali_creek",
    "warren",
    -- Keymind maps
    "treason",
    "bleed_it_out",
    "last_voyage",
    "impasse",
    "aqueduct",
    "penance",
    -- Coop Evolved maps
    "a30_coop_evolved",
    "a50_coop_evolved",
    "b30_coop_evolved",
    "b40_coop_evolved",
    "c10_coop_evolved",
    "c20_coop_evolved",
    "d40_coop_evolved"
}

local existingImages = {}

local descriptionsPath = [[data/insurrection/ui/bitmaps/descriptions]]

local function getCurrentRichPresenceImages()
    if fs.is("assets.json") then
        print("Using CACHED rich presence images...")
        return json.decode(luna.file.read("assets.json"))
    end
    print("Getting rich presence images...")

    printd("DISCORD_TOKEN", DISCORD_TOKEN)
    printd("DISCORD_CLIENT_ID", DISCORD_CLIENT_ID)

    local request = curl.get {
        url = "https://discord.com/api/v9/oauth2/applications/" .. DISCORD_CLIENT_ID .. "/assets",
        headers = {Authorization = DISCORD_TOKEN}
    }
    if not request.ok then
        error("Failed to get rich presence images: " .. request.text)
    end
    local assets = request.json()
    assert(assets, "Failed to parse rich presence images")
    luna.file.write("assets.json", request.text)
    return assets
end

---@type {id: string, name: string, type: number}[]
local assets = getCurrentRichPresenceImages()
printd(inspect(assets))

local function deleteRichPresenceImage(image)
    printd("Deleting rich presence " .. image .. "...")
    local asset = table.find(assets, function(asset)
        return asset.name == image
    end)
    if not asset then
        print("Asset not found")
        return
    end
    local id = asset.id
    -- local response = io.popen("curl -X DELETE -H \" Authorization: " .. DISCORD_TOKEN ..
    --                              "\" -H \"Content-Type: application/json\" https://discord.com/api/v9/oauth2/applications/" ..
    --                              DISCORD_CLIENT_ID .. "/assets/" .. id):read("*a")
    local request = curl.delete {
        url = "https://discord.com/api/v9/oauth2/applications/" .. DISCORD_CLIENT_ID .. "/assets/" ..
            id,
        headers = {Authorization = DISCORD_TOKEN}
    }
    if request.statusCode == 204 then
        print("Deleted rich presence image", image)
    elseif request.statusCode == 404 then
        print("Rich presence image not found")
    else
        error("Failed to delete rich presence image: " .. request.text)
    end
    assets = table.filter(assets, function(asset)
        return asset.name ~= image
    end)
    luna.file.write("assets.json", json.encode(assets))
end

local function uploadRichPresenceImage(richPresencePath)
    local image = richPresencePath:match("([^/]+)%.jpg$")
    print("Uploading rich presence image " .. image .. "...")
    -- local asset = table.find(assets, function(asset)
    --    return asset.name == image
    -- end)
    -- if asset then
    --    print("Rich presence image already exists")
    --    return
    -- end    
    local base64Image = base64.encode(luna.binary.read(richPresencePath))
    -- print("base64Image", base64Image)
    local data = {name = image, type = 1, image = "data:image/jpeg;base64," .. base64Image}
    luna.file.write("data.json", json.encode(data))
    --local response = io.popen("curl -X POST -H \"Authorization: " .. DISCORD_TOKEN ..
    --                              "\" -H \"Content-Type: application/json\" -d @data.json https://discord.com/api/v9/oauth2/applications/" ..
    --                              DISCORD_CLIENT_ID .. "/assets"):read("*a")
    --local ok, data = pcall(json.decode, response)
    local request = curl.post {
        url = "https://discord.com/api/v9/oauth2/applications/" .. DISCORD_CLIENT_ID .. "/assets",
        headers = {Authorization = DISCORD_TOKEN, ["Content-Type"] = "application/json"},
        --data = luna.file.read("data.json")
        data = "@data.json"
    }
    os.remove("data.json")
    if not request.ok then
        error("Failed to upload rich presence image: " .. request.text)
    end
    local asset = request.json()
    print("Uploaded rich presence image " .. image .. " with id " .. asset.id)
    assets[#assets + 1] = {id = asset.id, name = image, type = 1}
    luna.file.write("assets.json", json.encode(assets))
end

for _, mapName in ipairs(maps) do
    local image = mapName:lower():replace(" ", "_")
    local imageFolderPath = descriptionsPath .. [[/insurrection_maps_description_source/]] .. image
    if not fs.is(imageFolderPath) then
        print("\27[31m" .. "Skipping " .. image .. " because source folder does not exist" ..
                  "\27[0m")
        goto continue
    end
    local imageDataFolderPath = descriptionsPath .. [[/insurrection_maps_description/]] .. image

    local bitmapFolderPath = [[data/insurrection/ui/bitmaps/insurrection_maps/]] .. image
    local bitmapPath = [[insurrection/ui/bitmaps/insurrection_maps/]] .. image
    local richPresencePath = descriptionsPath .. [[/insurrection_rich_presence/]] .. image .. ".jpg"

    if fs.is(imageDataFolderPath) then
        printd("Skipping " .. image .. " because it already exists")
        existingImages[#existingImages + 1] = image
        goto continue
    end

    if args.presence then
        -- Create Rich Presence image
        for name, d in fs.dir(imageFolderPath) do
            if not name then
                print("error: ", d)
                break
            end
            local type = d:attr "type"
            if type == "file" then
                local convertedPath = "\"" .. d:path() .. "\" \"" .. richPresencePath .. "\""
                print("Creating rich presence image for " .. image)
                os.execute("convert -resize 1820x1024 -crop 1024x1024+455-0 " .. convertedPath)
                local imageDoesNotExist = not table.find(assets, function(asset)
                    return asset.name == image
                end)
                if imageDoesNotExist then
                    uploadRichPresenceImage(richPresencePath)
                    break
                end
                if args.delete then
                    deleteRichPresenceImage(image)
                    uploadRichPresenceImage(richPresencePath)
                    break
                end
            end
            break
        end
    end

    -- Create insurrection preview
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
            printd("Creating insurrection preview for " .. image)
            os.execute(
                [[convert "]] .. d:path() .. [[" -resize 534x300 "]] .. imageDataFolderPath .. [[/]] ..
                    name .. [["]])
        end
        break
    end
    -- Merge images with each other and save it to the new directory
    os.execute([[cd "]] .. imageDataFolderPath ..
                   [[" && convert -bordercolor blue -border 1 +append $(ls -1v) "../../../insurrection_maps/]] ..
                   image .. [[.png"]])
    os.execute([[invader-bitmap -F 16-bit -T interface_bitmaps "]] .. bitmapPath .. [["]])
    existingImages[#existingImages + 1] = image
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
