local components = require "insurrection.components"
local constants = require "insurrection.constants"
local button = require "insurrection.components.button"
local list = require "insurrection.components.list"
local utils = require "insurrection.utils"
local blam = require "blam"
local core = require "insurrection.core"

local staticRegions = {
    "body",
    "chest",
    "left_shoulder",
    "right_shoulder",
    "arms",
    "left_leg",
    "right_leg",
    "helmet"
}

local specificRegionCameras = {
    left_shoulder = "shoulders",
    right_shoulder = "shoulders",
    left_leg = "legs",
    right_leg = "legs",
    arms = "body"
}

local interpolationTicks = 30
---@type "regions"|"permutations"
local editing = "regions"
local regionIndex = 1

local function getCustomizationObjectData()
    local customizationObjectId = core.getCustomizationObjectId()
    assert(customizationObjectId, "No customization biped found")
    local customizationBiped = blam.biped(get_object(customizationObjectId))
    assert(customizationBiped, "No customization biped found")
    local customizationBipedTag = blam.bipedTag(customizationBiped.tagId)
    assert(customizationBipedTag, "No customization biped tag found")
    local customizationModel = blam.model(customizationBipedTag.model)
    assert(customizationModel, "No customization biped model found")
    return {
        id = customizationObjectId,
        biped = customizationBiped,
        bipedTag = customizationBipedTag,
        tag = blam.getTag(customizationBiped.tagId),
        model = customizationModel
    }
end

local function setCamera(region)
    local command = "camera_set customization_{region}_generic {ticks}"

    local customizationObjectData = getCustomizationObjectData()
    if customizationObjectData.tag.path:find("keymind") then
        command = "camera_set customization_{region} {ticks}"
    end

    execute_script(command:template{
        region = specificRegionCameras[region] or region,
        ticks = interpolationTicks
    })
end

local function setEditingGeometry(region)
    local customizationObjectId = core.getCustomizationObjectId()
    assert(customizationObjectId, "No customization biped found")
    local object = blam.getObject(customizationObjectId)
    if object then
        blam.rotateObject(object, constants.customization.rotation.default, 0, 0)
    end

    -- Set camera
    setCamera(region)

    BipedRotation = constants.customization.rotation[region] or
                        constants.customization.rotation.default
    if BipedRotation and object then
        blam.rotateObject(object, BipedRotation, 0, 0)
    end
end

return function()
    -- Get customization widget menu
    local customization = components.new(constants.widgets.biped.id)
    local options = list.new(customization:findChildWidgetTag("geometry_list").id, 1, 8)
    local back = button.new(options:findChildWidgetTag("back").id)

    local function loadRegions()
        local customizationObjectData = getCustomizationObjectData()
        local customizationModel = customizationObjectData.model

        staticRegions = table.map(customizationModel.regionList, function(region)
            local regionName = region.name:trim()
            if regionName:includes("+") then
                regionName = regionName:split("+")[2]
            end
            return regionName
        end)

        local regions = table.map(staticRegions, function(region)
            local regionName = utils.snakeCaseToUpperTitleCase(region)
            return {
                value = region,
                label = regionName,
                bitmap = function(uiComponent)
                    local icon = components.new(uiComponent:findChildWidgetTag("button_icon").id)
                    icon.widgetDefinition.backgroundBitmap =
                        constants.bitmaps.customization.regions.id
                    icon:setWidgetValues({
                        background_bitmap_index = table.indexof(staticRegions, region) - 1
                    })
                end
            }
        end)

        editing = "regions"
        options:setItems(regions)
    end

    local function loadPermutations(region)
        local customizationObjectData = getCustomizationObjectData()
        local customizationModel = customizationObjectData.model

        regionIndex = table.indexof(staticRegions, region) --[[@as number]]

        -- TODO Check if region exists
        local maximumPermutationCount =
            customizationModel.regionList[regionIndex].permutationCount - 1

        local permutations = {}
        for permutationIndex = 0, maximumPermutationCount do
            local permutation =
                customizationModel.regionList[regionIndex].permutationsList[permutationIndex + 1]
            local permutationName = permutation.name
            if permutationName:includes("+") then
                permutationName = permutationName:split("+")[4]
            end
            permutationName = utils.snakeCaseToUpperTitleCase(permutationName):upper()
            table.insert(permutations, {
                value = permutationIndex,
                label = permutationName,
                bitmap = function(uiComponent)
                    local icon = components.new(uiComponent:findChildWidgetTag("button_icon").id)
                    local permutationsBitmapTag = constants.bitmaps.customization[region]
                    local index = regionIndex - 1
                    if customizationObjectData.tag.path:find("keymind") and permutationsBitmapTag then
                        icon.widgetDefinition.backgroundBitmap = permutationsBitmapTag.id
                        index = permutationIndex
                    end
                    icon:setWidgetValues({background_bitmap_index = index})
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
        customizationBiped["regionPermutation" .. regionIndex] = permutationIndex
    end

    options:onSelect(function(item)
        if editing == "regions" then
            setEditingGeometry(item.value)
            loadPermutations(item.value)
        else
            setPermutation(item.value)
        end
    end)

    local function onClose()
        if editing == "permutations" then
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
    end)
    customization:onClose(function()
        return onClose()
    end)
end
