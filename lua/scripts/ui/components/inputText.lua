local ustr = require "lua.scripts.modules.ustr"
---Input text component with optional icon
---@param name string? Name of the button component (also used for inner tags generation)
---@param text string? Auto generated unicode string inside this button
---@return invaderWidget
return function(name, text, isPassword)
    local stringsTagPath
    if text then
        -- Generate strings tag
        stringsTagPath = [[insurrection/ui/shared/strings/buttons/]] .. name ..
                             [[.unicode_string_list]]
        ustr(stringsTagPath, {text})
    end
    ---@type invaderWidget
    local widget = {
        widget_type = "text_box",
        bounds = "0 0 32 185",
        flags = {pass_unhandled_events_to_focused_child = true},
        background_bitmap = [[insurrection\ui\bitmaps\input.bitmap]],
        event_handlers = {
            {
                event_type = "a_button",
                widget_tag = ".ui_widget_definition",
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
        text_font = [[ui\large_ui.font]],
        text_color = "1 1 1 1",
        justification = "left_justify",
        flags_1 = {editable = true, password = isPassword or false},
        string_list_index = 0,
        horiz_offset = 40,
        vert_offset = 9
    }
    return widget
end
