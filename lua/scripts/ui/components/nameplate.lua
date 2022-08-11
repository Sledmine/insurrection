local ustr = require "lua.scripts.modules.ustr"
---Nameplate widget
---@return invaderWidget
return function(name, text)
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
        bounds = "-26 -192 26 192",
        --flags = {pass_unhandled_events_to_focused_child = true},
        background_bitmap = [[insurrection/ui/bitmaps/default_nameplate.bitmap]],
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
        text_font = [[ui/large_ui.font]],
        text_color = "1 1 1 1",
        justification = "left_justify",
        horiz_offset = 225,
        vert_offset = 31,
        child_widgets = {
            {
                widget_tag = [[insurrection/ui/shared/nameplate_overlay.ui_widget_definition]]
            }
        }
    }
    return widget
end
