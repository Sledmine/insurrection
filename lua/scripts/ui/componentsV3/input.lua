local widget = require "lua.scripts.widget"
local ustr = require "lua.scripts.modules.ustr"
local constants = require "lua.scripts.ui.components.constants"
local image = require "lua.scripts.ui.componentsV2.image"

---@class inputProps
---@field name string
---@field text? string
---@field password? boolean
---@field editable? boolean
---@field icon? string
---@field variant? '"small"' | '"normal"'

---Input text component with optional icon
---@param props inputProps
---@return string
return function(props)
    local name = props.name
    local text = props.text
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
