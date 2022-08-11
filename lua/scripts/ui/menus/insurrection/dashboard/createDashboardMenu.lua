local widget = require "lua.scripts.widget"
local menuContainer = require "lua.scripts.ui.components.menuContainer"
local menuHeader = require "lua.scripts.ui.components.menuHeader"
local button = require "lua.scripts.ui.components.button"
local inputText = require "lua.scripts.ui.components.inputText"

local menuName = "dashboard"
local menuPath = [[insurrection\ui\menus\]] .. menuName .. [[\]]
local buttonPath = menuPath .. [[buttons\]]
local containerPath = menuPath .. menuName .. [[_menu.ui_widget_definition]]
local headerPath = menuPath .. menuName .. [[_header.ui_widget_definition]]
local optionsPath = menuPath .. menuName .. [[_options.ui_widget_definition]]
local backButtonPath = [[insurrection/ui/shared/common_back.ui_widget_definition]]
local currentVersionPath = [[insurrection\ui\main_menu\version.ui_widget_definition]]

-- Create menu header
widget.create(headerPath, menuHeader("insurrection_dashboard", "INSURRECTION DASHBOARD",
                                     "CHOOSE FROM DIFFERENT ACTIONS THAT INSURRECTION SERVICES OFFER YOU"))
-- Crate options elements
local createLobbyButtonPath = buttonPath .. [[create_lobby_button.ui_widget_definition]]
widget.create(createLobbyButtonPath, button("left_justify", "create_lobby_button", "CREATE LOBBY"))

local joinLobbyButtonPath = buttonPath .. [[join_lobby_button.ui_widget_definition]]
widget.create(joinLobbyButtonPath, button("left_justify", "join_lobby_button", "JOIN LOBBY"))

local lobbyKeyInputPath = buttonPath .. [[lobby_key_input.ui_widget_definition]]
widget.create(lobbyKeyInputPath,
              inputText("lobby_key_input", "LOBBY_KEY_PLACEHOLDER", false, true, "key_icon"))

local customizationButtonPath = buttonPath .. [[customization_button.ui_widget_definition]]
widget.create(customizationButtonPath,
              button("left_justify", "customization_button", "CUSTOMIZATION",
                     [[insurrection/ui/menus/customization/customization_menu.ui_widget_definition]]))

local initialPosition = 86
---@type invaderWidget
local options = {
    widget_type = "column_list",
    bounds = "0 0 480 856",
    flags = {pass_unhandled_events_to_focused_child = true, dpad_up_down_tabs_thru_children = true},
    child_widgets = {
        {
            horizontal_offset = 40,
            vertical_offset = widget.offset(initialPosition, 24, 4, 1),
            widget_tag = createLobbyButtonPath
        },
        {
            horizontal_offset = 40,
            vertical_offset = widget.offset(initialPosition, 24, 4, 2),
            widget_tag = joinLobbyButtonPath
        },
        {
            horizontal_offset = 40,
            vertical_offset = widget.offset(initialPosition, 24, 4, 3),
            widget_tag = lobbyKeyInputPath
        },
        {
            horizontal_offset = 40,
            vertical_offset = widget.offset(initialPosition, 24, 4, 6),
            widget_tag = customizationButtonPath
        },
        {horizontal_offset = 630, vertical_offset = 415, widget_tag = backButtonPath}
    }
}
widget.create(optionsPath, options)

---@type invaderWidget
local menu = menuContainer()
widget.merge(menu, {
    child_widgets = {
        {horizontal_offset = 40, vertical_offset = 20, widget_tag = headerPath},
        {horizontal_offset = 253, vertical_offset = 78, widget_tag = dialogPath},
        {horizontal_offset = 0, vertical_offset = 0, widget_tag = optionsPath},
        {horizontal_offset = 0, vertical_offset = 460, widget_tag = currentVersionPath}
    }
})
widget.create(containerPath, menu)
