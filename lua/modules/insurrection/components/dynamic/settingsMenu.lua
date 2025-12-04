local components = require "insurrection.components"
local constants = require "insurrection.constants"
local list = require "insurrection.components.list"
local button = require "insurrection.components.button"
local blam = require "blam"

return function()
    -- Hard code settings description text change, because the game doesn't support it
    local settings = components.new(constants.widgets.settings.id)
    local settingsOptions = blam.uiWidgetDefinition(settings:get("settings_menu_options"))
    assert(settingsOptions, "Could not create uiWidgetDefinition for settings_menu_options")
    -- TODO Add extended description widget support to lua-blam
    local settingsDescription = components.new(blam.findTag("settings_elements_description",
                                                            blam.tagClasses.uiWidgetDefinition).id)
    local settingsDescriptionText = components.new(settingsDescription:get(
                                                       "settings_elements_description_data"))
    for i = 1, settingsOptions.childWidgetsCount - 1 do
        local childWidget = settingsOptions.childWidgets[i]
        local button = button.new(childWidget.widgetTag)
        button:onFocus(function()
            settingsDescriptionText.widgetDefinition.stringListIndex = i - 1
        end)
    end
end
