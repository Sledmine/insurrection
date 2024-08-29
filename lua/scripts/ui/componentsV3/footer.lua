local widget = require "lua.scripts.widget"
local ustr = require "lua.scripts.modules.ustr"
local constants = require "lua.scripts.ui.components.constants"

---@class footerProps
---@field name string
---@field title string
---@field text string
---@field justify? "left" | "center" | "right"

---@param props footerProps
---@return string
return function(props)
    local name = props.name
    local title = props.title
    local text = props.text
    -- Generate strings tag
    local stringsTagPath = widget.path .. "strings/" .. name .. "_footer.unicode_string_list"
    local titlePath = widget.path .. name .. [[_footer_title.ui_widget_definition]]
    local textPath = widget.path .. name .. [[_footer_text.ui_widget_definition]]
    ustr(stringsTagPath, {title, text})
    local widgetPath = widget.path .. name .. [[_footer.ui_widget_definition]]

    -- Generate title
    widget.create(titlePath, {
        widget_type = "text_box",
        bounds = "0, 0, 52, 346",
        text_label_unicode_strings_list = stringsTagPath,
        text_font = constants.fonts.text,
        text_color = constants.color.subtitle,
        string_list_index = 0,
        justification = (props.justify or "left") .. "_justify",
    })

    -- Generate subtitle
    widget.create(textPath, {
        widget_type = "text_box",
        bounds = "0, 0, 52, 346",
        text_label_unicode_strings_list = stringsTagPath,
        text_font = constants.fonts.subtitle,
        text_color = constants.color.text,
        string_list_index = 1,
        justification = (props.justify or "left") .. "_justify",
    })
    widget.create(widgetPath, {
        bounds = "0, 0, 40, 450",
        child_widgets = {
            {widget_tag = titlePath, vertical_offset = 0, horizontal_offset = 0},
            {widget_tag = textPath, vertical_offset = 15, horizontal_offset = 0}
        }
    })
    return widgetPath
end
