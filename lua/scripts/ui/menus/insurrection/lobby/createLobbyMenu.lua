local widget = require "lua.scripts.widget"
local menuContainer = require "lua.scripts.ui.components.menuContainer"
local menuHeader = require "lua.scripts.ui.components.menuHeader"
local complexButton = require "lua.scripts.ui.components.complexButton"

local menuPath = [[insurrection/ui/menus/lobby/]]
local containerPath = menuPath .. [[lobby_menu.ui_widget_definition]]
local headerPath = menuPath .. [[lobby_header.ui_widget_definition]]
local buttonsPath = menuPath .. [[buttons/]]
local serverTypeButtonPath = buttonsPath .. [[lobby_server_type_button_1.ui_widget_definition]]
local currentProfilePath = [[insurrection\ui\shared\current_profile.ui_widget_definition]]

widget.create(headerPath, menuHeader("lobby", "LOBBY ",
                                     "LOG INTO YOUR INSURRECTION ACCOUNT, GET ACCESS TO MULTIPLAYER LOBBIES"))

widget.create(serverTypeButtonPath, complexButton("left_justify", "server_type_button_1", "CLASSIC"))
local container = menuContainer()
local containerWithButtons = {
    child_widgets = {
        {horizontal_offset = 40, vertical_offset = 20, widget_tag = headerPath},
        {horizontal_offset = 40, vertical_offset = 55, widget_tag = serverTypeButtonPath}
    }
}
for i = 3, 18 do
    containerWithButtons.child_widgets[i] = {
        horizontal_offset = 624,
        vertical_offset = 12 + (28 * (i - 3)),
        widget_tag = currentProfilePath
    }

end
widget.create(containerPath, widget.update(container, containerWithButtons))
