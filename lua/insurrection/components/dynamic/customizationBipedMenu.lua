local components = require "insurrection.components"
local constants = require "insurrection.constants"
local button = require "insurrection.components.button"
local list = require "insurrection.components.list"
local utils = require "insurrection.utils"
local blam = require "blam"
local core = require "insurrection.core"
local tagClasses = blam.tagClasses
local findTag = blam.findTag

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

local specificCameras = {
    left_shoulder = "shoulders",
    right_shoulder = "shoulders",
    left_leg = "legs",
    right_leg = "legs",
    arms = "body"
}

local interpolationTicks = 30
local bipedRotationByRegion = {left_shoulder = 80, right_shoulder = 190}
---@type "regions"|"permutations"
local editing = "regions"
local regionIndex = 1

local function setCamera(region)
    local command = "camera_set customization_{region} {ticks}"
    execute_script(command:template{
        region = specificCameras[region] or region,
        ticks = interpolationTicks
    })
end

local function setEditingGeometry(region)
    local customizationObjectId = core.getCustomizationObjectId()
    assert(customizationObjectId, "No customization biped found")
    blam.rotateObject(customizationObjectId, 133.144, 0, 0)

    local command = "camera_set customization_{region} {ticks}"

    -- Set camera
    setCamera(region)

    local rotation = bipedRotationByRegion[region]
    if rotation then
        blam.rotateObject(customizationObjectId, rotation, 0, 0)
        -- local command = "custom_animation (unit {object}) \"{tag}\" \"{animation}\" {interpolate}"
        -- command = command:template{
        --    object = "customization_biped",
        --    tag = blam.findTag("odst_nova", blam.tagClasses.modelAnimations).path,
        --    animation = "stand unarmed turn-left",
        --    interpolate = "true"
        -- }
    end
end

local regions = table.map(staticRegions, function(region)
    local regionName = utils.snakeCaseToUpperTitleCase(region)
    return {value = region, label = regionName}
end)

return function()

    -- Get customization widget menu
    local customization = components.new(constants.widgets.biped.id)
    local options = list.new(customization:findChildWidgetTag("geometry_list").id, 1, 8)
    local back = button.new(options:findChildWidgetTag("back").id)

    local function loadRegions()
        editing = "regions"
        options:setItems(regions)
    end

    local function loadPermutations(region)
        regionIndex = table.indexof(staticRegions, region) --[[@as number]]
        local customizationObjectId = core.getCustomizationObjectId()
        assert(customizationObjectId, "No customization biped found")
        local customizationBiped = blam.biped(get_object(customizationObjectId))
        assert(customizationBiped, "No customization biped found")
        local customizationBipedTag = blam.bipedTag(customizationBiped.tagId)
        assert(customizationBipedTag, "No customization biped tag found")
        local customizationModel = blam.model(customizationBipedTag.model)
        assert(customizationModel, "No customization biped model found")
        -- TODO Check if region exists
        local maximumPermutationCount =
            customizationModel.regionList[regionIndex].permutationCount - 1

        local permutations = {}
        for i = 0, maximumPermutationCount do
            table.insert(permutations, {value = i, label = tostring(i)})
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
