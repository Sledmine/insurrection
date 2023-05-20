local constants = require "lua.scripts.ui.components.constants"
local widget = require "lua.scripts.widget"
local button = require "lua.scripts.ui.componentsV2.button"
local ustr = require "lua.scripts.modules.ustr"

---@class labelProps
---@field name string Name of the component
---@field text string | string[] Text to display
---@field variant? '"title"' | '"subtitle"' | '"text"'
---@field justify? "left" | "center" | "right"
---@field size? number
---@field [1]? invaderWidgetChildWidget[]
---@field childs? invaderWidgetChildWidget[]

---Label component
---@param props labelProps
---@return string
return function(props)
    local name = props.name
    local text = props.text

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
        -- bounds = widget.bounds(0, 0, 20, 184),
        bounds = widget.bounds(0, 0, props.size or 20, constants.screen.width),
        flags = {pass_unhandled_events_to_focused_child = true},
        text_font = textFont,
        text_color = textColor,
        justification = (props.justify or "left") .. "_justify",
        text_label_unicode_strings_list = stringsPath,
        string_list_index = 0,
        horiz_offset = 10,
        vert_offset = 5,
        child_widgets = props[1] or props.childs or {}
    }
    widget.createV2(widgetPath, wid)
    return widgetPath
end
