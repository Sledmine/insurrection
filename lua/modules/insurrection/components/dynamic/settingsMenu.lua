local component = require "ui.component"
local constants = require "insurrection.constants"
local list = require "ui.list"
local button = require "ui.button"
local blam = require "blam"
local engine = Engine

return function()
    -- Hard code settings description text change, because the game doesn't support it
    local settings = component.new(constants.widgets.settings.handle.value)
    ---@type UiWidgetDefinition
    local settingsOptions = engine.tag.getTagData(settings:get("settings_menu_options"), "ui_widget_definition")
    assert(settingsOptions, "Could not create uiWidgetDefinition for settings_menu_options")
    -- BALLTZE MIGRATE: no direct v2 equivalent was found for the legacy settings description widget lookup path; this still depends on the legacy tag search while the v2 API exposes only tag filtering.
    local settingsDescription = component.new(engine.tag.filterTags("ui_widget_definition",
                                                                    "settings_elements_description")[1].handle.value)
    local settingsDescriptionText = component.new(settingsDescription:get(
                                                       "settings_elements_description_data"))
    for i = 1, #settingsOptions.childWidgets do
        local childWidget = settingsOptions.childWidgets[i]
        local button = button.new(childWidget.widgetTag.tagHandle.value)
        button:onFocus(function()
            settingsDescriptionText.widgetDefinition.stringListIndex = i - 1
        end)
    end
end
