local components = require "insurrection.components"
local constants = require "insurrection.constants"
local button = require "insurrection.components.button"
local list = require "insurrection.components.list"
local utils = require "insurrection.utils"
local blam = require "blam"
local core = require "insurrection.core"
local color = require "color"
local bar = require "insurrection.components.bar"
local menus = require "insurrection.menus"
local t = utils.snakeCaseToUpperTitleCase

local staticRegions = {
    "body",
    "chest",
    "left_shoulder",
    "right_shoulder",
    "arms",
    "knees",
    "helmet",
    "visor",
    "color",
    "gear",
    "legs",
    "bundle"
}

local staticVisors = {
    "Sulfur",
    "Silver",
    "Blue",
    "Green",
    "Purple",
    "Golden",
    "Red",
    "Orange",
    "Black",
    "White",
    "Cyanotic",
    "Nightfall",
    "Matrix",
    "Sunshine",
    "Chimera",
    "Iridescent",
    "Coalescence",
    "Hologram",
    "Blizzard",
    "Legend",
    "Frostbite",
    "Scattered",
    "Pink Pop",
    "Moonlight",
    "Gilver"
}

local dynamicRegions = staticRegions

local specificRegionCameras = {
    left_shoulder = "shoulders",
    right_shoulder = "shoulders",
    left_leg = "legs",
    right_leg = "legs"
}

local interpolationTicks = 30
---@type "regions"|"permutations"|"visor"
local editing = "regions"
local currentRegionIndex = 1

local getCustomizationObjectData = core.getCustomizationObjectData

---@param biped biped
---@param colorInHex string
local function setBipedColor(biped, colorInHex)
    local r, g, b = color.hexToDec(colorInHex)
    biped.colorCLowerRed = r
    biped.colorCLowerGreen = g
    biped.colorCLowerBlue = b

    biped.colorDLowerRed = r
    biped.colorDLowerGreen = g
    biped.colorDLowerBlue = b
end

local function setCamera(region, ticks)
    local command = "camera_set customization_{region}_generic {ticks}"

    local customizationObjectData = getCustomizationObjectData()
    if customizationObjectData.tag.path:find("keymind") then
        command = "camera_set customization_{region} {ticks}"
    end
    -- FIXME This is a hack to use the lobby cammera, find a better way to do this
    if region == "lobby" then
        command = "camera_set customization_{region} {ticks}"
    elseif region == "visor" then
        command = "camera_set customization_helmet {ticks}"
    end

    execute_script(command:template{
        region = specificRegionCameras[region] or region,
        ticks = ticks or interpolationTicks
    })
end

local function setEditingGeometry(region, ticks)
    local customizationObjectId = core.getCustomizationObjectId()
    assert(customizationObjectId, "No customization biped found")
    local object = blam.getObject(customizationObjectId)
    if object then
        blam.rotateObject(object, constants.customization.rotation.default, 0, 0)
    end

    -- Set camera
    setCamera(region, ticks)

    BipedRotation = constants.customization.rotation[region] or
                        constants.customization.rotation.default
    if BipedRotation and object then
        blam.rotateObject(object, BipedRotation, 0, 0)
    end
end

local function getBipedName(tagPath)
    local name = utils.path(tagPath).name
    return name:replace("_mp", "")
end

local function getBitmapIndexForRegion(region)
    return (table.indexof(staticRegions, region) or 12) - 1
end

return function(props)
    props = props or {}
    local isBipedPreviewGenEnabled = props.isBipedPreviewGenEnabled
    -- Get customization widget menu
    local customization = components.new(constants.widgets.biped.id)
    local geometryName = components.new(customization:findChildWidgetTag("geometry_name").id)
    local options = list.new(customization:findChildWidgetTag("geometry_list").id, 1, 8)
    local scrollOptionsBar = bar.new(customization:findChildWidgetTag("geometry_scroll").id,
                                     "scroll")
    options:setScrollBar(scrollOptionsBar)
    local back = button.new(options:findChildWidgetTag("back").id)

    local function loadRegions()
        local customizationObjectData = getCustomizationObjectData()
        local customizationModel = customizationObjectData.model

        local bipedName = getBipedName(customizationObjectData.tag.path)
        geometryName:setText(t(bipedName))

        dynamicRegions = table.map(customizationModel.regionList, function(region)
            local regionName = region.name:trim()
            if regionName:includes("+") then
                regionName = regionName:split("+")[2]
            end
            return regionName
        end)

        local regions = table.map(dynamicRegions, function(region)
            local regionName = t(region)
            return {
                value = region,
                label = regionName,
                bitmap = function(uiComponent)
                    local icon = components.new(uiComponent:findChildWidgetTag("button_icon").id)
                    -- Default bitmap
                    icon.widgetDefinition.backgroundBitmap =
                        constants.bitmaps.customization.regions.id
                    -- Set bitmap index
                    icon:setWidgetValues({bitmapIndex = getBitmapIndexForRegion(region)})
                end
            }
        end)

        local isTheFloodProject = customizationObjectData.tag.path:includes("keymind")
        if isTheFloodProject then
            table.insert(regions, 1, {
                value = "visor",
                label = t("visor"),
                bitmap = function(uiComponent)
                    local icon = components.new(uiComponent:findChildWidgetTag("button_icon").id)
                    icon.widgetDefinition.backgroundBitmap =
                        constants.bitmaps.customization.regions.id
                    icon:setWidgetValues({bitmapIndex = getBitmapIndexForRegion("visor")})
                end
            })
        end
        table.insert(regions, 1, {
            value = "color",
            label = t("color"),
            bitmap = function(uiComponent)
                local icon = components.new(uiComponent:findChildWidgetTag("button_icon").id)
                icon.widgetDefinition.backgroundBitmap = constants.bitmaps.customization.regions.id
                icon:setWidgetValues({bitmapIndex = getBitmapIndexForRegion("color")})
            end
        })

        editing = "regions"
        options:setItems(regions)
    end

    local function loadPermutations(region)
        geometryName:setText(t(region))
        if region == "visor" then
            local visors = {}
            -- TODO Add visor permutations dynamically
            for _, visorName in ipairs(staticVisors) do
                table.insert(visors, {
                    value = table.indexof(staticVisors, visorName) - 1,
                    label = visorName:upper(),
                    bitmap = function(uiComponent)
                        local icon =
                            components.new(uiComponent:findChildWidgetTag("button_icon").id)
                        icon.widgetDefinition.backgroundBitmap =
                            constants.bitmaps.customization.regions.id
                        icon:setWidgetValues({bitmapIndex = getBitmapIndexForRegion("visor")})
                    end
                })
            end
            editing = "visor"
            options:setItems(visors)
            return
        end
        if region == "color" then
            menus.bipedColor()
            return
        end

        local customizationObjectData = getCustomizationObjectData()
        local customizationModel = customizationObjectData.model

        currentRegionIndex = table.indexof(dynamicRegions, region) --[[@as number]]

        -- TODO Check if region exists
        local lastPermutation = customizationModel.regionList[currentRegionIndex].permutationCount -
                                    1

        local permutations = {}
        for permutationIndex = 0, lastPermutation do
            local permutation =
                customizationModel.regionList[currentRegionIndex].permutationsList[permutationIndex +
                    1]
            local permutationName = permutation.name
            if permutationName:includes("+") then
                permutationName = permutationName:split("+")[4]
            end
            permutationName = t(permutationName):upper()
            local isTheFloodProject = customizationObjectData.tag.path:includes("keymind")
            table.insert(permutations, {
                value = permutationIndex,
                label = permutationName,
                bitmap = function(uiComponent)
                    local icon = components.new(uiComponent:findChildWidgetTag("button_icon").id)
                    local index = getBitmapIndexForRegion(region)
                    local permutationsBitmapTag = constants.bitmaps.customization[region]
                    if isTheFloodProject and permutationsBitmapTag then
                        icon.widgetDefinition.backgroundBitmap = permutationsBitmapTag.id
                        index = permutationIndex
                    end
                    icon:setWidgetValues({bitmapIndex = index})
                end
            })
        end
        editing = "permutations"
        options:setItems(permutations)
    end

    local function setPermutation(permutationIndex)
        local customizationObjectId = core.getCustomizationObjectId()
        assert(customizationObjectId, "No customization biped found")
        local customizationBiped = blam.biped(get_object(customizationObjectId))
        assert(customizationBiped, "No customization biped found")

        core.setObjectPermutationSafely(customizationBiped, currentRegionIndex, permutationIndex)
    end

    local function setVisor(visorIndex)
        local customizationBiped = getCustomizationObjectData().biped
        assert(customizationBiped, "No customization biped found")

        customizationBiped.shaderPermutationIndex = visorIndex
    end

    local function generateBipedPreviews()
        IsUIPhotoSessionRunning = true
        log("object_create green_screen")
        log("Generating biped previews")
        execute_script("cls")
        -- core.setWidgetValues(core.getCurrentUIWidgetTag().id, {opacity = 0.04})
        core.setWidgetValues(core.getCurrentUIWidgetTag().id, {opacity = 0})

        local customizationObjectData = getCustomizationObjectData()
        local customizationModel = customizationObjectData.model
        local customizationBiped = customizationObjectData.biped
        assert(customizationBiped, "No customization biped found")
        customizationBiped.animationFrame = 0
        setBipedColor(customizationBiped, "#A6B0B5")

        local delay = 600
        for regionIndex, region in ipairs(customizationModel.regionList) do
            local currentRegionName = region.name:split("+")[2] or region.name
            utils.delay(delay, function()
                for i = 1, 8 do
                    customizationBiped["regionPermutation" .. i] = 0
                end
                setEditingGeometry(currentRegionName, 1)
                if currentRegionName == "helmet" then
                    customizationBiped["regionPermutation" .. regionIndex] = blam.null
                end

                local screenShotName = region.name .. "+00.png"
                local screenShotPath = "/home/sledmine/Pictures/CaptureCustomization/" ..
                                           screenShotName
                os.execute(("cmd /c start /unix /usr/bin/gnome-screenshot -w -f %s"):format(
                               screenShotPath))
                -- os.execute("convert *.png -fuzz 5% -transparent 'rgb(0, 255, 0)' -set filename:base "%[basename]" "%[filename:base]_transparent.png"")
            end)
            delay = delay + 600
        end

        for regionIndex, region in ipairs(customizationModel.regionList) do
            local currentRegionName = region.name:split("+")[2] or region.name
            for permutationIndex, permutation in ipairs(region.permutationsList) do
                utils.delay(delay, function()
                    -- Hide all non editing regions
                    for otherRegionIndex, region in ipairs(customizationModel.regionList) do
                        local otherRegionName = region.name:split("+")[2] or region.name
                        if currentRegionName ~= otherRegionName then
                            customizationBiped["regionPermutation" .. otherRegionIndex] = blam.null
                        end
                    end

                    setEditingGeometry(currentRegionName, 1)
                    core.setObjectPermutationSafely(customizationBiped, regionIndex,
                                                    permutationIndex - 1)
                    -- log("Generating biped preview for " .. regionName .. " " .. permutation.name)
                    customizationBiped.animationFrame = 0
                    local screenShotName = region.name .. "+" ..
                                               string.format("%02d", permutationIndex) .. ".png"
                    local screenShotPath = "/home/sledmine/Pictures/CaptureCustomization/" ..
                                               screenShotName
                    os.execute(("cmd /c start /unix /usr/bin/gnome-screenshot -w -f %s"):format(
                                   screenShotPath))
                end)
                delay = delay + 600
            end
        end

        utils.delay(delay, function()
            log("Finished generating biped previews")
            execute_script("object_destroy green_screen")
            IsUIPhotoSessionRunning = false
            core.setWidgetValues(core.getCurrentUIWidgetTag().id, {opacity = 1})
            for i = 1, 8 do
                customizationBiped["regionPermutation" .. i] = 0
            end
        end)
    end

    options:onSelect(function(item)
        if editing == "regions" then
            local geometry = item.value
            setEditingGeometry(geometry)
            loadPermutations(geometry)
        elseif editing == "permutations" then
            local permutation = item.value
            setPermutation(permutation)
        elseif editing == "visor" then
            local visor = item.value
            setVisor(visor)
        else
            menus.bipedColor()
        end
    end)

    local function onClose()
        local customizationBiped = core.getCustomizationObjectData().biped
        if customizationBiped then
            BipedRotation = constants.customization.rotation.default
            blam.rotateObject(customizationBiped, BipedRotation, 0, 0)
        end
        --- TODO Mix permutations and visor in one concept
        if editing == "permutations" or editing == "visor" then
            customization.events.onOpen()
            return false
        end
        setCamera("lobby")
    end

    back:onClick(function()
        return onClose()
    end)

    customization:onOpen(function()
        setEditingGeometry("body")
        loadRegions()
        if isBipedPreviewGenEnabled then
            generateBipedPreviews()
        end
    end)
    customization:onClose(function()
        return onClose()
    end)
end
