local widget = require "lua.scripts.widget"
local ustr = require "lua.scripts.modules.ustr"
local constants = require "lua.scripts.ui.components.constants"
local image = require "lua.scripts.ui.componentsV2.image"
local floor = math.floor

---@class buttonSquareProps
---@field name string
---@field text? string
---@field justification? "left_justify" | "center_justify" | "right_justify"
---@field childs? invaderWidgetChildWidget[]

---Square Button for skulls
---@param props buttonSquareProps
---@return string
return function(props)
    local name = props.name
    local text = props.text
    local justification = props.justification or "left_justify"
    local widgetPath = widget.path .. "buttons/" .. name .. "_square_button.ui_widget_definition"

    local size = {width = 80, height = 80, scale = 1}

    local stringsTagPath
    if text then
        -- Generate strings tag
        stringsTagPath = widget.path .. "strings/" .. name .. "_square_button.unicode_string_list"
        ustr(stringsTagPath, {text})
    end

    ---@type invaderWidget
    local wid = {
        widget_type = "text_box",
        bounds = widget.scale(size.width, size.height, size.scale),
        background_bitmap = [[insurrection/ui/bitmaps/square_button.bitmap]],
        event_handlers = {
            {event_type = "a_button"},
            {
                flags = {run_function = true},
                event_type = "left_mouse",
                ["function"] = "mouse_emit_accept_event"
            }
        },
        flags = {
            pass_handled_events_to_all_children = true,
            pass_unhandled_events_to_all_children = true,
            dont_focus_a_specific_child_widget = true
        },
        text_label_unicode_strings_list = stringsTagPath,
        string_list_index = 0,
        text_font = constants.fonts.title,
        text_color = constants.color.text,
        justification = justification,
        horiz_offset = 16,
        vert_offset = 16,
        child_widgets = props.childs or {}
    }

    widget.createV2(widgetPath, wid)
    return widgetPath
end
