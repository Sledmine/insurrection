local widget = require "lua.scripts.widget"
local menuContainer = require "lua.scripts.ui.components.menuContainer"
local menuHeader = require "lua.scripts.ui.components.menuHeader"
local button = require "lua.scripts.ui.components.button"

local menuPath = [[insurrection\ui\menus\insurrection_login\]]
local buttonPath = menuPath .. [[buttons\]]
local containerPath = menuPath .. [[insurrection_login_menu.ui_widget_definition]]
local headerPath = menuPath .. [[insurrection_login_menu_header.ui_widget_definition]]
local optionsPath = menuPath .. [[insurrection_login_menu_options.ui_widget_definition]]

-- Create menu header
widget.create(headerPath, menuHeader("insurrection_login", "INSURRECTION LOGIN",
                                     "LOG INTO YOUR INSURRECTION ACCOUNT, GET ACCESS TO MULTIPLAYER LOBBIES"))
-- Crate options elements
local loginButtonPath = buttonPath .. [[login_button.ui_widget_definition]]
widget.create(loginButtonPath, button("center_justify", "login_button", "LOGIN"))
local registerButtonPath = buttonPath .. [[register_button.ui_widget_definition]]
widget.create(registerButtonPath, button("center_justify", "register_button", "REGISTER"))

---@type invaderWidget
local options = {
    widget_type = "column_list",
    bounds = "0 0 480 856",
    flags = {pass_unhandled_events_to_focused_child = true, dpad_up_down_tabs_thru_children = true},
    child_widgets = {
        {horizontal_offset = 328, vertical_offset = 280, widget_tag = loginButtonPath},
        {horizontal_offset = 328, vertical_offset = 344, widget_tag = registerButtonPath}
    }
}
widget.create(optionsPath, options)

---@type invaderWidget
local menu = menuContainer()
widget.merge(menu, {
    child_widgets = {
        {horizontal_offset = 40, vertical_offset = 20, widget_tag = headerPath},
        {horizontal_offset = 0, vertical_offset = 0, widget_tag = optionsPath}
    }
})
widget.create(containerPath, menu)
