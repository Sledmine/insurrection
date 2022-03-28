---Menu container component, this is the first component that holds a screen
---@return invaderWidget
return function(childWidgets)
    ---@type invaderWidget
    local wid = {
        widget_type ="column_list",
        bounds = "0 0 480 856",
        flags = {pass_unhandled_events_to_focused_child = true, dpad_up_down_tabs_thru_children = true},
        child_widgets = childWidgets
    }
    return wid
end
