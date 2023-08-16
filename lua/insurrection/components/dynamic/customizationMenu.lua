local components = require "insurrection.components"
local constants = require "insurrection.constants"
local button = require "insurrection.components.button"
local list = require "insurrection.components.list"
local utils = require "insurrection.utils"
local blam = require "blam"
local tagClasses = blam.tagClasses
local findTag = blam.findTag

return function()
    local customization = components.new(constants.widgets.customization.id)

    local nameplatePreview = components.new(findTag("nameplate_preview",
                                                    tagClasses.uiWidgetDefinition).id)
    nameplatePreview:animate()

    local nameplatesList = list.new(customization:findChildWidgetTag("nameplates_options").id, 1, 9)
    nameplatesList:onSelect(function(item)
        nameplatePreview.widgetDefinition.backgroundBitmap = item.bitmap --[[@as number]]
    end)
    local sortedNameplates = table.map(table.keys(constants.nameplates), function(nameplateId)
        return {value = nameplateId, bitmap = constants.nameplates[nameplateId].id}
    end)
    table.sort(sortedNameplates, function(a, b)
        return a.value < b.value
    end)
    nameplatesList:setItems(sortedNameplates)

    local selectBipedsWrapper = components.new(findTag("select_bipeds",
                                                       tagClasses.uiWidgetDefinition).id)
    local selectProjectsList = list.new(selectBipedsWrapper:findChildWidgetTag("select_project").id)
    local bipedsList = list.new(selectBipedsWrapper:findChildWidgetTag("select_project_biped").id)

    local customizationTypesList = components.new(customization:findChildWidgetTag("types").id)
    local customizationNameplatesButton = button.new(
                                              customizationTypesList:findChildWidgetTag("nameplates").id)
    customizationNameplatesButton:onClick(function()
        execute_script("set_ui_background")
        selectBipedsWrapper:replace(nameplatesList.tagId)
    end)
    local customizationBipedsButton = button.new(
                                          customizationTypesList:findChildWidgetTag("bipeds").id)

    local selectBipedAction = function(path)
        local bipedPath = path:replace(".biped", "")
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
                end
            end
        end
    end

    customizationBipedsButton:onClick(function()
        execute_script("set_customization_background")
        nameplatesList:replace(selectBipedsWrapper.tagId)
        ---@type interfaceState
        local state = store:getState()
        local projects = table.keys(state.available.customization)
        selectProjectsList:onSelect(function(item)
            local bipeds = table.map(item.value, function(bipedPath)
                return {
                    label = utils.snakeCaseToUpperTitleCase(utils.path(bipedPath).name),
                    value = bipedPath
                }
            end)
            bipeds = utils.sortTableAlphabetically(bipeds)
            bipedsList:setItems(bipeds)
            selectBipedAction(item.value[1])
        end)
        selectProjectsList:setItems(table.map(projects, function(map)
            return {
                label = utils.snakeCaseToTitleCase(map),
                value = state.available.customization[map]
            }
        end))

        bipedsList:onScroll(function(item)
            selectBipedAction(item.value)
        end)
    end)

    local saveCustomizationButton = button.new(
                                        customization:findChildWidgetTag("save_customization").id)
    saveCustomizationButton:onClick(function()
        local selectedMapItem = selectProjectsList:getSelectedItem()
        local selectedBipedItem = bipedsList:getSelectedItem()
        local currentNameplateId
        if settings and settings.nameplate then
            currentNameplateId = settings.nameplate
        end
        local selectedNameplateItem = nameplatesList:getSelectedItem() or
                                          {value = currentNameplateId}
        dprint("saveCustomizationButton:onClick")
        dprint(selectedMapItem)
        dprint(selectedBipedItem)
        local nameplate = selectedNameplateItem.value
        local bipeds
        if selectedNameplateItem then
            nameplate = selectedNameplateItem.value
        end
        if selectedMapItem and selectedBipedItem then
            bipeds = {[selectedMapItem.label] = selectedBipedItem.value}
        end
        api.playerProfileEdit({nameplate = nameplate, bipeds = bipeds})
    end)
end
