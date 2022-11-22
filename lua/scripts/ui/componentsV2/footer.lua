local widget = require "lua.scripts.widget"
local ustr = require "lua.scripts.modules.ustr"
local constants = require "lua.scripts.ui.components.constants"

---@param name string
---@param title string
---@param text string
---@return string
return function(name, title, text)
    -- Generate strings tag
    local stringsTagPath = widget.path .. "strings/" .. name .. ".unicode_string_list"
    local titlePath = widget.path .. name .. [[_footer_title.ui_widget_definition]]
    local textPath = widget.path .. name .. [[_footer_text.ui_widget_definition]]

    ustr(stringsTagPath, {title, text})

    -- Generate title
    widget.create(titlePath, {
        widget_type = "text_box",
        bounds = "0, 0, 52, 346",
        text_label_unicode_strings_list = stringsTagPath,
        text_font = constants.fonts.text,
        text_color = constants.color.subtitle,
        string_list_index = 0
    })

    -- Generate subtitle
    widget.create(textPath, {
        widget_type = "text_box",
        bounds = "0, 0, 52, 346",
        text_label_unicode_strings_list = stringsTagPath,
        text_font = constants.fonts.subtitle,
        text_color = constants.color.text,
        string_list_index = 1
    })
    local widgetPath = widget.path .. name .. [[_footer.ui_widget_definition]]
    widget.create(widgetPath, {
        bounds = "0, 0, 40, 450",
        child_widgets = {
            {widget_tag = titlePath, vertical_offset = 0, horizontal_offset = 0},
            {widget_tag = textPath, vertical_offset = 15, horizontal_offset = 0}
        }
    })
    return widgetPath
end
