local widget = require "lua.scripts.widget"
local menuContainer = require "lua.scripts.ui.components.menuContainer"
local menuHeader = require "lua.scripts.ui.components.menuHeader"
local complexButton = require "lua.scripts.ui.components.complexButton"
local optionsList = require "lua.scripts.ui.components.optionsList"
local arrowButton = require "lua.scripts.ui.components.arrowButton"
local nameplate = require "lua.scripts.ui.components.nameplate"

local menuPath = [[insurrection/ui/menus/lobby/]]
local buttonsPath = menuPath .. [[buttons/]]

local currentProfilePath = [[insurrection\ui\shared\current_profile.ui_widget_definition]]
local containerPath = menuPath .. [[lobby_menu.ui_widget_definition]]
local headerPath = menuPath .. [[lobby_header.ui_widget_definition]]
local optionsPath = menuPath .. [[lobby_options.ui_widget_definition]]

local definitionButtonPath = buttonsPath .. [[lobby_definition_button_%s.ui_widget_definition]]
local elementButtonPath = buttonsPath .. [[lobby_element_button_%s.ui_widget_definition]]
local nameplateButtonPath = buttonsPath .. [[lobby_nameplate_%s.ui_widget_definition]]
local definitionsPath = menuPath .. [[lobby_definitions.ui_widget_definition]]
local elementsPath = menuPath .. [[lobby_elements.ui_widget_definition]]
local backButtonPath = [[insurrection/ui/shared/common_back.ui_widget_definition]]

widget.create(headerPath, menuHeader("lobby", "MY LOBBY",
                                     "INVITE FRIENDS TO YOUR LOBBY, CHOOSE YOUR SERVER TYPE, SET YOUR RULES AND HAVE FUN!"))

local optionsNames = {
    {text = "$SERVER_TYPE_PLACEHOLDER", subtitle = "TEMPLATE", icon = "server_template_icons"},
    {text = "$MAP_NAME_PLACEHOLDER", subtitle = "MAP"},
    {text = "$GAME_TYPE_PLACEHOLDER", subtitle = "GAMETYPE"},
    {text = "PLAY"}
}
local definitions = optionsList(nil, true)
local elements = optionsList(nil, true)
for i = 1, 4 do
    local text = optionsNames[i].text
    local subtitle = optionsNames[i].subtitle
    local icon = optionsNames[i].icon

    local definitionButtonPath = definitionButtonPath:format(i)
    definitions.child_widgets[i] = {
        horizontal_offset = widget.offset(40, 120, 4, i),
        vertical_offset = 55,
        widget_tag = definitionButtonPath
    }
    widget.create(definitionButtonPath,
                  complexButton("left_justify", ("lobby_definition_button_%s"):format(i), text, nil,
                                nil, nil, subtitle, icon))
end

local arrowButtonLeftPath = elementButtonPath:format(1)
widget.create(arrowButtonLeftPath, arrowButton(nil, nil, nil))
elements.child_widgets[1] = {
    horizontal_offset = 40,
    vertical_offset = 205,
    widget_tag = arrowButtonLeftPath
}
local arrowButtonRightPath = elementButtonPath:format(6)
widget.create(arrowButtonRightPath, arrowButton(nil, nil, nil, true))
elements.child_widgets[6] = {
    horizontal_offset = 555,
    vertical_offset = 205,
    widget_tag = arrowButtonRightPath
}
for i = 2, 5 do
    local elementButtonPath = elementButtonPath:format(i)
    elements.child_widgets[i] = {
        horizontal_offset = widget.offset(59, 120, 4, i - 1),
        vertical_offset = 205,
        widget_tag = elementButtonPath
    }
    widget.create(elementButtonPath, complexButton("left_justify",
                                                   ("lobby_element_button_%s"):format(i),
                                                   "$ELEMENT_PLACE_HOLDER"))
end
widget.create(optionsPath, optionsList({
    {horizontal_offset = 0, vertical_offset = 0, widget_tag = definitionsPath},
    {horizontal_offset = 0, vertical_offset = 0, widget_tag = elementsPath},
    {horizontal_offset = 630, vertical_offset = 415, widget_tag = backButtonPath}
}))
widget.create(definitionsPath, definitions)
widget.create(elementsPath, elements)
local container = menuContainer()
local containerWithButtons = {
    child_widgets = {
        {horizontal_offset = 40, vertical_offset = 20, widget_tag = headerPath},
        {horizontal_offset = 0, vertical_offset = 0, widget_tag = optionsPath}
    }
}
local lastContainerElement = #containerWithButtons.child_widgets + 1
for childWidgetIndex = lastContainerElement, lastContainerElement + 15 do
    local nameplateIndex = childWidgetIndex - (lastContainerElement - 1)
    local nameplatePath = nameplateButtonPath:format(nameplateIndex)
    local nameplateWidgetName = ("lobby_nameplate_button_%s"):format(nameplateIndex)
    widget.create(nameplatePath, nameplate(nameplateWidgetName, "$PLAYER_NAMEPLATE_PLACEHOLDER"))
    containerWithButtons.child_widgets[childWidgetIndex] = {
        horizontal_offset = 624,
        vertical_offset = widget.offset(12, 26, 3, nameplateIndex),
        widget_tag = nameplatePath
    }
end
widget.create(containerPath, widget.update(container, containerWithButtons))
