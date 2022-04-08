local widget = require "lua.scripts.widget"
local ustr = require "lua.scripts.modules.ustr"
---Generic button component, recycled in multiple components
---@param justification '"left_justify"' | '"center_justify"' | '"right_justify"' Button text alignment
---@param name string? Name of the button component (also used for inner tags generation)
---@param text string? Auto generated unicode string inside this button
---@return invaderWidget
return function(justification, name, text, openTag, script, back, icon)
    local stringsTagPath
    if text then
        -- Generate strings tag
        stringsTagPath = [[insurrection/ui/shared/strings/buttons/]] .. name ..
                             [[.unicode_string_list]]
        ustr(stringsTagPath, {text})
    end
    ---@type invaderWidget
    local wid = {
        widget_type = "text_box",
        bounds = "0 0 110 120",
        flags = {pass_unhandled_events_to_focused_child = true},
        background_bitmap = [[insurrection\ui\bitmaps\complex_button.bitmap]],
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
        text_color = "1 1 1 1",
        justification = justification or "left_justify",
        horiz_offset = 10,
        vert_offset = 75
    }
    if justification == "center_justify" then
        -- Because of rescale stuff
        wid.horiz_offset = 0
    end
    if icon then
        local iconBitmapPath = [[insurrection/ui/bitmaps/]] .. icon .. [[.bitmap]]
        local iconPath = [[insurrection/ui/shared/icons/]] .. icon .. [[.ui_widget_definition]]
        widget.create(iconPath, {bounds = "-128 -128 128 128", background_bitmap = iconBitmapPath})
        wid.child_widgets = {{horizontal_offset = 1, vertical_offset = 1, widget_tag = iconPath}}
    end
    return wid
end
