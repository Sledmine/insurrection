local ustr = require "lua.scripts.modules.ustr"
local widget = require "lua.scripts.widget"
local constants = require "lua.scripts.ui.components.constants"
local image = require "lua.scripts.ui.componentsV2.image"

---Input text component with optional icon
---@param name string? Name of the button component (also used for inner tags generation)
---@param text string? Auto generated unicode string inside this button
---@param props {password: boolean?, editable: boolean?, icon: string?, variant: '"small"' | '"normal"'}? Properties of the input component
---@return string
return function(name, text, props)
    local props = props or {}
    local variant = props.variant or "normal"
    local stringsTagPath
    if text then
        -- Generate strings tag
        stringsTagPath = widget.path .. "strings/" .. name .. "_input.unicode_string_list"
        ustr(stringsTagPath, {text})
    end
    local widgetPath = widget.path .. "buttons/" .. name .. "_input.ui_widget_definition"
    local width, height = constants.components.input[variant].width,
                          constants.components.input[variant].height
    ---@type invaderWidget
    local wid = {
        widget_type = "text_box",
        name = name .. "_input",
        bounds = widget.bounds(0, 0, height, width),
        flags = {pass_unhandled_events_to_focused_child = true},
        background_bitmap = constants.components.input[variant].bitmap,
        event_handlers = {
            {event_type = "a_button"},
            {
                flags = {run_function = true},
                event_type = "left_mouse",
                ["function"] = "mouse_emit_accept_event"
            }
        },
        text_label_unicode_strings_list = stringsTagPath,
        text_font = constants.fonts.button,
        text_color = constants.color.text,
        justification = "left_justify",
        flags_1 = {password = props.password or false, editable = props.editable or true},
        string_list_index = 0,
        horiz_offset = 40,
        vert_offset = 9
    }
    if props.icon then
        if props.variant == "small" then
            wid.child_widgets = {{image(name .. "_icon", props.icon, 64, 64, 0.28), 3, 3}}
        else
            wid.child_widgets = {{image(name .. "_icon", props.icon, 64, 64, 0.34), 6, 6}}
        end
    end
    if props.variant == "small" then
        wid.horiz_offset = 30
        wid.vert_offset = 4
    end
    widget.createV2(widgetPath, wid)
    return widgetPath
end
