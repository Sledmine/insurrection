---Options list component, scroll trough elements using dpad, etc
---@param childWidgets invaderWidgetChildWidget
---@param horizontal? boolean
---@return invaderWidget
return function(childWidgets, horizontal)
    local horizontal = horizontal or false
    ---@type invaderWidget
    local options = {
        widget_type = "column_list",
        bounds = "0 0 480 856",
        flags = {
            pass_unhandled_events_to_focused_child = true,
            dpad_up_down_tabs_thru_children = not horizontal,
            dpad_left_right_tabs_thru_children = horizontal
        },
        child_widgets = childWidgets or {}
    }
    return options
end
