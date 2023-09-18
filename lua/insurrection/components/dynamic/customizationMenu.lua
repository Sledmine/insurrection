local blam = require "blam"
local tagClasses = blam.tagClasses
local findTag = blam.findTag
local color = require "color"
local components = require "insurrection.components"
local constants = require "insurrection.constants"
local button = require "insurrection.components.button"
local list = require "insurrection.components.list"
local utils = require "insurrection.utils"
local menus = require "insurrection.menus"
local core = require "insurrection.core"
local getState = require "insurrection.redux.getState"

return function()
    -- Get customization widget menu
    local customization = components.new(constants.widgets.customization.id)

    -- Get nameplate preview widget
    local nameplatePreview = components.new(findTag("nameplate_preview",
                                                    tagClasses.uiWidgetDefinition).id)
    nameplatePreview:animate()

    -- Get nameplate list widget
    local nameplatesList = list.new(customization:findChildWidgetTag("nameplates_options").id, 1, 9)

    -- Get select bipeds widget
    local selectBipedsWrapper = components.new(findTag("select_bipeds",
                                                       tagClasses.uiWidgetDefinition).id)
    local selectProjectsList = list.new(selectBipedsWrapper:findChildWidgetTag("select_project").id)
    local bipedsList = list.new(selectBipedsWrapper:findChildWidgetTag("select_project_biped").id)

    local customizationTypesList = components.new(customization:findChildWidgetTag("types").id)
    local selectNameplateButton = button.new(
                                      customizationTypesList:findChildWidgetTag("nameplates").id)

    local selectBipedButton = button.new(customizationTypesList:findChildWidgetTag("bipeds").id)

    local currentBipedLabel = components.new(
                                  customization:findChildWidgetTag("current_biped_label").id)
    -- Get save customization button
    local saveCustomizationButton = button.new(
                                        customization:findChildWidgetTag("save_customization").id)

    nameplatesList:onSelect(function(item)
        nameplatePreview.widgetDefinition.backgroundBitmap = item.bitmap --[[@as number]]
    end)
    local sortedNameplates = table.keys(constants.nameplates)
    table.sort(sortedNameplates)
    sortedNameplates = table.map(sortedNameplates, function(nameplateId)
        return {value = nameplateId, bitmap = constants.nameplates[nameplateId].id}
    end)
    nameplatesList:setItems(sortedNameplates)

    local handleSelectBiped = function(path)
        local bipedPath = path:replace(".biped", "")
        local bipedName = utils.snakeCaseToUpperTitleCase(utils.path(bipedPath).name)
        currentBipedLabel:setText(bipedName)
        local scenario = blam.scenario(0)
        assert(scenario)
        for k, objectIndex in pairs(blam.getObjects()) do
            local object = blam.object(get_object(objectIndex))
            if object and scenario.objectNames[object.nameIndex + 1] == "customization_biped" then
                object.isNotCastingShadow = false
                local customBipedTag = findTag(bipedPath, tagClasses.biped)
                assert(customBipedTag, "biped tag " .. bipedPath .. " not found")
                if customBipedTag then
                    for _, scenery in pairs(scenario.sceneries) do
                        local sceneryName = scenario.objectNames[scenery.nameIndex + 1]
                        if sceneryName == "customization_biped" then
                            local newPaletteList = scenario.sceneryPaletteList
                            -- Replace the biped tag with the custom biped tag
                            newPaletteList[scenery.typeIndex + 1] = customBipedTag.id
                            scenario.sceneryPaletteList = newPaletteList
                            execute_script "object_destroy customization_biped"
                            break
                        end
                    end
                    execute_script "object_create_anew customization_biped"
                    local customizationObjectId = core.getCustomizationObjectId()
                    if customizationObjectId then
                        local menuBiped = blam.biped(get_object(customizationObjectId))
                        local r, g, b = color.hexToDec("#b50003")
                        menuBiped.colorCLowerRed = r
                        menuBiped.colorCLowerGreen = g
                        menuBiped.colorCLowerBlue = b
                    end
                end
            end
        end
    end

    local function handleLoadNameplates()
        execute_script("set_ui_background")
        currentBipedLabel:setText("")
        selectBipedsWrapper:replace(nameplatesList.tagId)
    end

    local function handleLoadBipeds()
        execute_script("object_create customization_biped")
        nameplatesList:replace(selectBipedsWrapper.tagId)
        local state = getState()
        local projects = table.keys(state.available.customization)
        selectProjectsList:onSelect(function(item)
            local bipeds = table.map(item.value, function(bipedPath)
                return {
                    -- label = utils.snakeCaseToUpperTitleCase(utils.path(bipedPath).name),
                    label = "CUSTOMIZE",
                    value = bipedPath
                }
            end)
            bipeds = utils.sortTableAlphabetically(bipeds)
            bipedsList:setItems(bipeds)
            handleSelectBiped(item.value[1])
        end)
        selectProjectsList:setItems(table.map(projects, function(map)
            return {
                label = utils.snakeCaseToTitleCase(map),
                value = state.available.customization[map].tags
            }
        end))

        bipedsList:onScroll(function(item)
            handleSelectBiped(item.value)
        end)

        bipedsList:onSelect(function(item)
            -- TODO Save selected biped
            menus.biped()
        end)
    end

    selectBipedButton:onClick(function()
        execute_script("set_customization_background")
        handleLoadBipeds()
    end)

    selectNameplateButton:onClick(function()
        handleLoadNameplates()
    end)

    saveCustomizationButton:onClick(function()
        local selectedProjectItem = selectProjectsList:getSelectedItem()
        local selectedBipedItem = bipedsList:getCurrentItem()
        local currentNameplateId
        if settings and settings.nameplate then
            currentNameplateId = settings.nameplate
        end
        local selectedNameplateItem = nameplatesList:getSelectedItem() or
                                          {value = currentNameplateId}
        dprint("saveCustomizationButton:onClick")
        dprint(selectedProjectItem)
        dprint(selectedBipedItem)
        local nameplate = selectedNameplateItem.value
        local bipeds
        if selectedNameplateItem then
            nameplate = selectedNameplateItem.value
        end
        if selectedProjectItem and selectedBipedItem then
            bipeds = {[selectedProjectItem.label] = selectedBipedItem.value}
        end
        api.playerProfileEdit({nameplate = nameplate, bipeds = bipeds})
    end)

    customization:onOpen(function(previousWidgetTag)
        if previousWidgetTag then
            if previousWidgetTag.id == constants.widgets.biped.id then
                handleLoadBipeds()
                return
            end
        end
        handleLoadNameplates()
    end)
end
