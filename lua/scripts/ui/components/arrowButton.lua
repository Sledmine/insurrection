---Arrow vertical button
---@return invaderWidget
return function(openTag, script, back, rightArrow)
    ---@type invaderWidget
    local wid = {
        widget_type = "text_box",
        bounds = "0, 0, 97, 15",
        flags = {pass_unhandled_events_to_focused_child = true},
        background_bitmap = [[insurrection\ui\bitmaps\arrow_button_left.bitmap]],
        event_handlers = {
            {
                flags = {
                    open_widget = true,
                    run_function = true,
                    go_back_to_previous_widget = back or false
                },
                event_type = "a_button",
                widget_tag = openTag or ".ui_widget_definition",
                script = script or ""
            },
            {
                flags = {run_function = true},
                event_type = "left_mouse",
                ["function"] = "mouse_emit_accept_event",
                widget_tag = openTag or ".ui_widget_definition"
            }
        },
        text_label_unicode_strings_list = stringsTagPath,
        string_list_index = 0,
        text_font = [[ui\large_ui.font]],
        text_color = "1, 1, 1, 1",
        justification = justification or "left_justify",
        horiz_offset = 10,
        vert_offset = 5
    }
    if rightArrow then
        wid.background_bitmap = [[insurrection\ui\bitmaps\arrow_button_right.bitmap]]
    end
    return wid
end
