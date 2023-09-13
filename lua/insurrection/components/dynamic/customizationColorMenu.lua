local color = require "color"
local components = require "insurrection.components"
local constants = require "insurrection.constants"
local list = require "insurrection.components.list"
local button = require "insurrection.components.button"
local blam = require "blam"
local core = require "insurrection.core"
local getWidgetValues = core.getWidgetValues
local setWidgetValues = core.setWidgetValues
local glue = require "glue"
local menus = require "insurrection.menus"
local delay = require "insurrection.utils".delay

return function()
    local customizationColor = components.new(constants.widgets.color.id)

    local optionsId = customizationColor:findChildWidgetTag("options").id
    local customizationColorListOptions = list.new(optionsId)

    local actionsId = customizationColor:findChildWidgetTag("actions").id
    local customizationColorListActions = list.new(actionsId)

    local saveId = customizationColorListActions:findChildWidgetTag("save").id
    local customizationColorSaveButton = button.new(saveId)
    openSettingsMenu = function()
        menus.open(constants.widgets.settings.id)
        return false
    end
    customizationColorSaveButton:onClick(function()
        set_timer(30, "openSettingsMenu")
    end)
    local colorButtons = customizationColorListOptions:getChildWidgetTags()
    updateColorMenu = function()
        local currentColorDescription = components.new(
                                            blam.findTag("current_color_label",
                                                         blam.tagClasses.uiWidgetDefinition).id)
        -- TODO Get this from memory, not from the UI
        -- It seems like this widget is not found by harmony.menu.find_widgets
        -- local currentColorName = blam.readUnicodeString(core.getWidgetValues(
        --                                                    currentColorDescription.tag.id)
        --                                                    .text, true):lower()
        local scenario = blam.scenario(0)
        assert(scenario)
        local colorValue = constants.color[currentColorName]
        local menuBiped
        for k, objectIndex in pairs(blam.getObjects()) do
            local object = blam.object(get_object(objectIndex))
            if object and scenario.objectNames[object.nameIndex + 1] == "customization_biped" then
                menuBiped = object
                local tag = blam.getTag(menuBiped.tagId)
                if tag and tag.path:find "cyborg" then
                    if colorValue then
                        local r, g, b = color.hexToDec(colorValue)
                        menuBiped.colorCLowerRed = r
                        menuBiped.colorCLowerGreen = g
                        menuBiped.colorCLowerBlue = b
                    end
                    break
                end
            end
        end
        

        for buttonIndex, tag in pairs(colorButtons) do
            if buttonIndex > 1 and buttonIndex < #colorButtons - 1 then
                local colorButton = button.new(tag.id)
                local colorButtonText = button.new(colorButton:findChildWidgetTag("_text").id)
                local colorIcon = button.new(colorButton:findChildWidgetTag("_icon").id)
                local colorName = blam.readUnicodeString(
                                      getWidgetValues(colorButtonText.tag.id).text, true):lower()
                local colorValue = constants.color[colorName]
                if colorValue then
                    local colorIndex = table.flip(constants.colors)[colorValue] - 1
                    setWidgetValues(colorIcon.tag.id, {background_bitmap_index = colorIndex})
                    colorButton:onClick(function()
                        local r, g, b = color.hexToDec(colorValue)
                        menuBiped.colorCLowerRed = r
                        menuBiped.colorCLowerGreen = g
                        menuBiped.colorCLowerBlue = b
                    end)
                end
            else
                local scrollButton = button.new(tag.id)
                scrollButton:onClick(function()
                    delay(45, updateColorMenu)
                end)
            end
        end
        return false
    end
    customizationColor:onOpen(function()
        delay(45, updateColorMenu)
    end)
end
