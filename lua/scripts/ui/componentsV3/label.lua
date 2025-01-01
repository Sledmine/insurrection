local constants = require "lua.scripts.ui.components.constants"
local widget = require "lua.scripts.widget"
local button = require "lua.scripts.ui.componentsV2.button"
local ustr = require "lua.scripts.modules.ustr"

---@class labelProps
---@field name string Name of the component
---@field text string | string[] Text to display
---@field variant? "title" | "subtitle" | "text" | "focus" | "error" | "warning"
---@field justify? "left" | "center" | "right"
---@field size? number
---@field width? number
---@field height? number
---@field [1]? invaderWidgetChildWidget[]
---@field childs? invaderWidgetChildWidget[]
---@field replace? invaderWidgetSearchAndReplaceFunctions[]

---Label component
---@param props labelProps
---@return string
return function(props)
    local name = props.name
    local text = props.text
    local size = props.size or 24

    local widgetPath = widget.path .. name .. "_label.ui_widget_definition"
    local stringsPath = widget.path .. "strings/" .. name .. "_label.unicode_string_list"
    if type(text) == "string" then
        ustr(stringsPath, {text})
    else
        ustr(stringsPath, text)
    end
    local textFont = constants.fonts.text
    local textColor = constants.color.text
    if props.variant == "title" then
        textFont = constants.fonts.title
    elseif props.variant == "subtitle" then
        textFont = constants.fonts.subtitle
        textColor = constants.color.subtitle
    elseif props.variant == "focus" then
        textColor = constants.color.focus
    elseif props.variant == "error" then
        textColor = constants.color.error
    elseif props.variant == "warning" then
        textColor = constants.color.warning
    end
    local bounds = widget.bounds(0, 0, size, constants.screen.width)
    if props.width or props.height then
        bounds = widget.bounds(0, 0, props.height or size, props.width or constants.screen.width)
    end
    ---@type invaderWidget
    local wid = {
        widget_type = "text_box",
        bounds = bounds,
        flags = {pass_unhandled_events_to_focused_child = true},
        text_font = textFont,
        text_color = textColor,
        justification = (props.justify or "left") .. "_justify",
        text_label_unicode_strings_list = stringsPath,
        string_list_index = 0,
        --horiz_offset = 10,
        horiz_offset = 0,
        vert_offset = 5,
        search_and_replace_functions = props.replace or {},
        child_widgets = props[1] or props.childs or {}
    }
    widget.createV2(widgetPath, wid)
    return widgetPath
end
