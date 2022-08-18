local ustr = require "lua.scripts.modules.ustr"
local widget = require "lua.scripts.widget"
---Nameplate widget
---@return invaderWidget
return function(name, text, asPreview)
    local bounds = "-26 -192 26 192"
    if asPreview then
        bounds = "0 0 52 384"
    end
    local stringsTagPath
    if text then
        -- Generate strings tag
        stringsTagPath = [[insurrection/ui/shared/strings/buttons/]] .. name ..
                             [[.unicode_string_list]]
        ustr(stringsTagPath, {text})
    end
    local overlayPath = "insurrection/ui/menus/lobby/buttons/" .. name ..
                            "_overlay.ui_widget_definition"
    widget.create(overlayPath, {
        widget_type = "text_box",
        bounds = bounds,
        background_bitmap = [[insurrection/ui/shared/bitmaps/nameplate_overlay.bitmap]],
        -- game_data_inputs = {{["function"] = "get_active_plyr_profile_name"}},
        text_label_unicode_strings_list = stringsTagPath,
        string_list_index = 0,
        text_font = [[ui/large_ui.font]],
        text_color = "1 0.8 0.8 0.8",
        justification = "left_justify",
        horiz_offset = 225,
        vert_offset = 31
    })
    ---@type invaderWidget
    local widget = {
        widget_type = "container",
        flags = {pass_unhandled_events_to_focused_child = true},
        event_handlers = {
            {event_type = "a_button"},
            {
                flags = {run_function = true},
                event_type = "left_mouse",
                ["function"] = "mouse_emit_accept_event"
            }
        },
        name = name,
        bounds = bounds,
        background_bitmap = [[insurrection/ui/bitmaps/default_nameplate.bitmap]],
        child_widgets = {{widget_tag = overlayPath}}
    }
    if asPreview then
        widget.child_widgets = {}
    end
    return widget
end
