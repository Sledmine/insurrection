local widget = require "lua.scripts.widget"
local ustr = require "lua.scripts.modules.ustr"
local constants = require "lua.scripts.ui.components.constants"
local image = require "lua.scripts.ui.componentsV2.image"
local floor = math.floor

---@class buttonTableProps
---@field name string
---@field text? string
---@field justification? "left_justify" | "center_justify" | "right_justify"
---@field variant? "header" | "row"
---@field childs? invaderWidgetChildWidget[]
---@field isClickable? boolean

---Generic table button for table usage
---@param props buttonTableProps
---@return string
return function(props)
    local name = props.name
    local text = props.text
    local variant = props.variant or "header"
    local justification = props.justification or "center_justify"
    local isClickable = props.isClickable

    local stringsTagPath
    if text then
        -- Generate strings tag
        stringsTagPath = widget.path .. "strings/" .. name .. "_table_button.unicode_string_list"
        ustr(stringsTagPath, {text})
    end

    local widgetPath = widget.path .. "buttons/" .. name .. "_table_button.ui_widget_definition"
    ---@type invaderWidget
    local wid = {
        -- widget_type = isClickable and "text_box" or "container",
        widget_type = "text_box",
        bounds = widget.bounds(0, 0, 19, 104),
        background_bitmap = [[insurrection/ui/bitmaps/browser_upper_button.bitmap]],
        flags = {pass_unhandled_events_to_focused_child = true},
        text_label_unicode_strings_list = stringsTagPath,
        string_list_index = 0,
        text_font = constants.fonts.button,
        text_color = constants.color.text,
        justification = justification,
        vert_offset = 2,
        child_widgets = props.childs or {}
    }
    if variant == "row" then
        wid.background_bitmap = [[insurrection/ui/bitmaps/browser_table_button.bitmap]]
        wid.bounds = widget.bounds(0, 0, 19, 528)
    end

        if isClickable then
        wid.flags.pass_unhandled_events_to_focused_child = false
        wid.event_handlers = {
            {event_type = "a_button"},
            {
                event_type = "left_mouse",
                flags = {run_function = true},
                ["function"] = "mouse_emit_accept_event"
            }
        }
    end

    widget.createV2(widgetPath, wid)
    return widgetPath
end
