local widget = require "lua.scripts.widget"
local ustr = require "lua.scripts.modules.ustr"
local constants = require "lua.scripts.ui.components.constants"

---@param name string
---@param title string
---@param subtitle string
---@return string
return function(name, title, subtitle)
    -- Generate strings tag
    local stringsTagPath = widget.path .. "strings/" .. name .. ".unicode_string_list"
    local titlePath = widget.path .. name .. [[_title.ui_widget_definition]]
    local subtitlePath = widget.path .. name .. [[_subtitle.ui_widget_definition]]

    ustr(stringsTagPath, {title, subtitle})

    -- Generate title
    widget.create(titlePath, {
        widget_type = "text_box",
        bounds = "0, 0, 20, 343",
        text_label_unicode_strings_list = stringsTagPath,
        text_font = constants.fonts.title,
        text_color = constants.color.title,
        string_list_index = 0
    })
    
    -- Generate subtitle
    widget.create(subtitlePath, {
        widget_type = "text_box",
        bounds = "0, 0, 20, 343",
        text_label_unicode_strings_list = stringsTagPath,
        text_font = [[ui/gamespy.font]],
        text_color = constants.color.subtitle,
        string_list_index = 1
    })
    local widgetPath = widget.path .. name .. [[_header.ui_widget_definition]]
    widget.create(widgetPath, {
        bounds = "0, 0, 40, 450",
        child_widgets = {
            {widget_tag = titlePath, vertical_offset = 0, horizontal_offset = 0},
            {widget_tag = subtitlePath, vertical_offset = 15, horizontal_offset = 0}
        }
    })
    return widgetPath
end
