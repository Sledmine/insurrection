local widget = require "lua.scripts.widget"
local menuContainer = require "lua.scripts.ui.components.menuContainer"
local normalButton = require "lua.scripts.ui.components.normalButton"
local optionsList = require "lua.scripts.ui.components.optionsList"
local button = require "lua.scripts.ui.components.button"
local glue = require "lua.lua_modules.glue"

local menuPath = [[ui\shell\main_menu\]]
local containerPath = menuPath .. [[main_menu.ui_widget_definition]]
local optionsPath = menuPath .. [[intro_menu_options.ui_widget_definition]]
local logoPath = [[insurrection\ui\main_menu\insurrection_logo.ui_widget_definition]]
local pressStartToContinuePath =
    [[insurrection\ui\main_menu\press_start_to_continue.ui_widget_definition]]
local currentVersionPath = [[insurrection\ui\main_menu\version.ui_widget_definition]]

widget.create(optionsPath, optionsList(options))
widget.create(containerPath, widget.merge(menuContainer(), {
    event_handlers = {
        {event_type = "b_button", ["function"] = "null"},
        {event_type = "back_button", ["function"] = "null"},
        {
            event_type = "a_button",
            flags = {open_widget = true, run_function = true, try_to_branch_on_failure = true},
            widget_tag = [[insurrection\ui\menus\main\main_menu.ui_widget_definition]],
            ["function"] = "new_game_if_no_plyr_profiles"
        },
        {
            event_type = "start_button",
            flags = {run_function = true},
            ["function"] = "mouse_emit_accept_event"
        },
        {
            event_type = "left_mouse",
            flags = {run_function = true},
            ["function"] = "mouse_emit_accept_event"
        }
    },
    conditional_widgets = {
        {
            widget_tag = [[ui\shell\main_menu\profile_manager\multiplayer_creating_profile.ui_widget_definition]],
            name = "multiplayer_creating_profile",
            flags = {load_if_event_handler_function_fails = true}
        }
    },
    child_widgets = {
        {horizontal_offset = 202, vertical_offset = 160, widget_tag = logoPath},
        {horizontal_offset = 0, vertical_offset = 300, widget_tag = pressStartToContinuePath},
        {horizontal_offset = 0, vertical_offset = 460, widget_tag = currentVersionPath}
    }
}))
