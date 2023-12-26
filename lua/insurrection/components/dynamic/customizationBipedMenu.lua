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

local dynamicRegions = staticRegions

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
local currentRegionIndex = 1

local getCustomizationObjectData = core.getCustomizationObjectData

local function setCamera(region)
    local command = "camera_set customization_{region}_generic {ticks}"

    local customizationObjectData = getCustomizationObjectData()
    if customizationObjectData.tag.path:find("keymind") then
        command = "camera_set customization_{region} {ticks}"
    end
    -- FIXME This is a hack to use the lobby cammera, find a better way to do this
    if region == "lobby" then
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

        dynamicRegions = table.map(customizationModel.regionList, function(region)
            local regionName = region.name:trim()
            if regionName:includes("+") then
                regionName = regionName:split("+")[2]
            end
            return regionName
        end)

        local regions = table.map(dynamicRegions, function(region)
            local regionName = utils.snakeCaseToUpperTitleCase(region)
            return {
                value = region,
                label = regionName,
                bitmap = function(uiComponent)
                    local icon = components.new(uiComponent:findChildWidgetTag("button_icon").id)
                    -- Default bitmap
                    icon.widgetDefinition.backgroundBitmap =
                        constants.bitmaps.customization.regions.id
                    -- Set bitmap index
                    icon:setWidgetValues({
                        background_bitmap_index = (table.indexof(staticRegions, region) or 1) - 1
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

        currentRegionIndex = table.indexof(dynamicRegions, region) --[[@as number]]

        -- TODO Check if region exists
        local lastPermutation = customizationModel.regionList[currentRegionIndex]
                                            .permutationCount - 1

        local permutations = {}
        for permutationIndex = 0, lastPermutation do
            local permutation =
                customizationModel.regionList[currentRegionIndex].permutationsList[permutationIndex +
                    1]
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
                    local index = (table.indexof(staticRegions, region) or 1) - 1
                    local permutationsBitmapTag = constants.bitmaps.customization[region]
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

        core.setObjectPermutationSafely(customizationBiped, currentRegionIndex, permutationIndex)
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
