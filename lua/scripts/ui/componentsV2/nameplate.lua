local ustr = require "lua.scripts.modules.ustr"
local widget = require "lua.scripts.widget"
local constants = require "lua.scripts.ui.components.constants"

---Nameplate component
---@param name string
---@param text? string
---@param props? {preview?: boolean, profile?: boolean}
---@return string
return function(name, text, props)
    local props = props or {}
    local bounds = "-26, -192, 26, 192"
    if props.preview then
        bounds = "0, 0, 52, 384"
    end
    local stringsTagPath
    if text then
        -- Generate strings tag
        stringsTagPath = widget.path .. "strings/nameplate_" .. name .. ".unicode_string_list"
        ustr(stringsTagPath, {text})
    end
    local widgetPath = widget.path .. "buttons/nameplate_" .. name .. ".ui_widget_definition"
    local overlayPath = widget.path .. "buttons/" .. name ..
                            "_nameplate_overlay.ui_widget_definition"

    ---@type invaderWidget
    local overlay = {
        widget_type = "text_box",
        bounds = bounds,
        background_bitmap = [[insurrection/ui/shared/bitmaps/nameplate_overlay.bitmap]],
        text_label_unicode_strings_list = stringsTagPath,
        string_list_index = 0,
        text_font = constants.fonts.button,
        text_color = constants.color.nameplate,
        justification = "left_justify",
        horiz_offset = 225,
        vert_offset = 32
    }
    if props.profile then
        overlay.game_data_inputs = {{["function"] = "get_active_plyr_profile_name"}}
    end
    widget.createV2(overlayPath, overlay)

    ---@type invaderWidget
    local wid = {
        widget_type = "container",
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
    if props.preview then
        wid.child_widgets = {}
    end
    widget.createV2(widgetPath, wid)
    return widgetPath
end
