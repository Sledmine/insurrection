local constants = require "lua.scripts.ui.components.constants"
local widget = require "lua.scripts.widget"
local button = require "lua.scripts.ui.componentsV2.button"
local ustr = require "lua.scripts.modules.ustr"

---Label component
---@param name string Name of the component
---@param text string | string[] Text to display
---@param props? {childs: invaderWidgetChildWidget[], variant?: '"title"' | '"subtitle"' | '"text"'} Properties of the component
---@return string
return function(name, text, props)
    local props = props or {}
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
    end
    ---@type invaderWidget
    local wid = {
        widget_type = "text_box",
        bounds = "0, 0, 24, 184",
        flags = {pass_unhandled_events_to_focused_child = true},
        text_font = textFont,
        text_color = textColor,
        text_label_unicode_strings_list = stringsPath,
        string_list_index = 0,
        horiz_offset = 10,
        vert_offset = 5,
        child_widgets = props.childs or {}
    }
    widget.createV2(widgetPath, wid)
    return widgetPath
end
