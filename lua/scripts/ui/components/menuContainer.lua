---Menu container component, this is the first component that holds a screen
---@return invaderWidget
return function(childWidgets)
    return {
        bounds = "0, 0, 480, 856",
        background_bitmap = [[insurrection\ui\bitmaps\background_transparent.bitmap]],
        flags = {pass_unhandled_events_to_focused_child = true},
        childWidgets = childWidgets or {}
    }
end
