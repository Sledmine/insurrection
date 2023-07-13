local components = require "insurrection.components"
local constants = require "insurrection.constants"
local button = require "insurrection.components.button"
local list = require "insurrection.components.list"
local utils = require "insurrection.utils"
local glue = require "glue"
local blam = require "blam"

return function()
    local customization = components.new(constants.widgets.customization.id)

    local nameplatesList = list.new(customization:findChildWidgetTag("nameplates_options").id, 1, 9)
    local nameplatePreview = components.new(blam.findTag("nameplate_preview",
                                                         blam.tagClasses.uiWidgetDefinition).id)
    nameplatePreview:animate()
    local saveCustomizationButton = button.new(
                                        customization:findChildWidgetTag("save_customization").id)
    nameplatesList:onSelect(function(item)
        nameplatePreview.widgetDefinition.backgroundBitmap = item.bitmap
    end)
    local sortedNameplates = glue.map(glue.keys(constants.nameplates), function(nameplateId)
        return {value = nameplateId, bitmap = constants.nameplates[nameplateId].id}
    end)
    table.sort(sortedNameplates, function(a, b)
        return a.value < b.value
    end)
    nameplatesList:setItems(sortedNameplates)

    local selectBipedsList = list.new(blam.findTag("select_bipeds",
                                                   blam.tagClasses.uiWidgetDefinition).id)
    local mapsList = list.new(selectBipedsList:findChildWidgetTag("select_map_biped").id)
    --local bipedsList = list.new(selectBipedsList:findChildWidgetTag("select_custom_biped").id)
    local customizationTypesList = components.new(customization:findChildWidgetTag("types").id)
    local customizationNameplatesButton = button.new(
                                              customizationTypesList:findChildWidgetTag("nameplates").id)
    customizationNameplatesButton:onClick(function()
        execute_script("set_ui_background")
        selectBipedsList:replace(nameplatesList.tagId)
    end)
    local customizationBipedsButton = button.new(
                                          customizationTypesList:findChildWidgetTag("bipeds").id)

    customizationBipedsButton:onClick(function()
        execute_script("set_customization_background")
        --local scenario = blam.scenario(0)
        --assert(scenario)
        --for k,v in pairs(blam.getObjects()) do
        --    local object = blam.object(get_object(v))
        --    if object and scenario.objectNames[object.nameIndex + 1] == "customization_biped" then
        --        local scenery = blam.scenery(object.tagId)
        --        scenery.model = blam.findTag("haunted", blam.tagClasses.gbxmodel).id
        --    end
        --end
        nameplatesList:replace(selectBipedsList.tagId)
        ---@type interfaceState
        local state = store:getState()
        local maps = glue.keys(state.available.customization)
        mapsList:onSelect(function(item)
            dprint("mapsList:onSelect")
            bipedsList:setItems(glue.map(item.value, function(bipedPath)
                return {label = utils.path(bipedPath).name, value = bipedPath}
            end))
        end)
        mapsList:setItems(glue.map(maps, function(map)
            return {label = map, value = state.available.customization[map]}
        end))
        --bipedsList:setItems(glue.map(state.available.customization[maps[1]], function(bipedPath)
        --    return {label = utils.path(bipedPath).name, value = bipedPath}
        --end))
        --bipedsList:onSelect(function(item)
        --    dprint("bipedsList:onSelect")
        --end)
    end)

    saveCustomizationButton:onClick(function()
        local selectedMapItem = mapsList:getSelectedItem()
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
