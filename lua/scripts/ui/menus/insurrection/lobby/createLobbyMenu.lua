local widget = require "lua.scripts.widget"
local menuContainer = require "lua.scripts.ui.components.menuContainer"
local menuHeader = require "lua.scripts.ui.components.menuHeader"
local complexButton = require "lua.scripts.ui.components.complexButton"
local optionsList = require "lua.scripts.ui.components.optionsList"

local menuPath = [[insurrection/ui/menus/lobby/]]
local currentProfilePath = [[insurrection\ui\shared\current_profile.ui_widget_definition]]
local containerPath = menuPath .. [[lobby_menu.ui_widget_definition]]
local headerPath = menuPath .. [[lobby_header.ui_widget_definition]]
local buttonsPath = menuPath .. [[buttons/]]
local definitionButtonPath = buttonsPath .. [[lobby_definition_button_%s.ui_widget_definition]]
local elementButtonPath = buttonsPath .. [[lobby_element_button_%s.ui_widget_definition]]
local definitionsPath = menuPath .. [[lobby_definitions.ui_widget_definition]]
local elementsPath = menuPath .. [[lobby_elements.ui_widget_definition]]

widget.create(headerPath, menuHeader("lobby", "MY LOBBY",
                                     "INVITE FRIENDS TO YOUR LOBBY, CHOOSE YOUR SERVER TYPE, SET YOUR RULES AND HAVE FUN!"))

local optionsNames = {
    "$SERVER_TYPE_PLACEHOLDER",
    "$MAP_NAME_PLACEHOLDER",
    "$GAME_TYPE_PLACEHOLDER",
    "PLAY"
}
local definitions = optionsList(nil, true)
local elements = optionsList(nil, true)
for i = 1, 4 do
    local definitionButtonPath = definitionButtonPath:format(i)
    local elementButtonPath = elementButtonPath:format(i)
    definitions.child_widgets[i] = {
        horizontal_offset = widget.offset(40, 120, 4, i),
        vertical_offset = 55,
        widget_tag = definitionButtonPath
    }
    elements.child_widgets[i] = {
        horizontal_offset = widget.offset(50, 120, 4, i),
        vertical_offset = 205,
        widget_tag = elementButtonPath
    }
    widget.create(definitionButtonPath, complexButton("left_justify",
                                                      ("lobby_definition_button_%s"):format(i),
                                                      optionsNames[i]))
    widget.create(elementButtonPath, complexButton("left_justify",
                                                   ("lobby_element_button_%s"):format(i),
                                                   "$ELEMENT_PLACE_HOLDER"))
end
widget.create(definitionsPath, definitions)
widget.create(elementsPath, elements)
local container = menuContainer()
local containerWithButtons = {
    child_widgets = {
        {horizontal_offset = 40, vertical_offset = 20, widget_tag = headerPath},
        {horizontal_offset = 0, vertical_offset = 0, widget_tag = definitionsPath},
        {horizontal_offset = 0, vertical_offset = 0, widget_tag = elementsPath}
    }
}
local lastContainerElement = #containerWithButtons.child_widgets + 1
for i = lastContainerElement, 19 do
    containerWithButtons.child_widgets[i] = {
        horizontal_offset = 624,
        vertical_offset = 12 + (28 * (i - lastContainerElement)),
        widget_tag = currentProfilePath
    }
end
widget.create(containerPath, widget.update(container, containerWithButtons))
