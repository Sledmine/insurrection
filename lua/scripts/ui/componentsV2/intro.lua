local constants = require "lua.scripts.ui.components.constants"
local widget = require "lua.scripts.widget"

---Intro component (for main menu)
---@param name string Component name
---@param childWidgets invaderWidgetChildWidget[] Child widgets for this component
---@return string
return function(name, childWidgets)
    local widgetPath = widget.path .. name .. ".ui_widget_definition"
    local wid = {
        bounds = constants.getScreenBounds(),
        background_bitmap = [[insurrection/ui/bitmaps/background_transparent.bitmap]],
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
                widget_tag = [[insurrection/ui/menus/intro/intro_menu_creating_profile.ui_widget_definition]],
                name = "multiplayer_creating_profile",
                flags = {load_if_event_handler_function_fails = true}
            }
        },
        child_widgets = childWidgets or {}
    }
    widget.createV2(widgetPath, wid)
    return widgetPath
end
