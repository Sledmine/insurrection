local widget = require "lua.scripts.widget"
local ustr = require "lua.scripts.modules.ustr"
---@param title string
---@param subtitle string
---@return invaderWidget
return function(name, title, subtitle)
    -- Generate strings tag
    local stringsTagPath = [[insurrection/ui/shared/strings/headers/]] .. name ..
                               [[.unicode_string_list]]
    ustr(stringsTagPath, {title, subtitle})
    -- Generate title
    local titlePath = [[insurrection/ui/shared/headers/titles/]] .. name ..
                          [[.ui_widget_definition]]
    widget.create(titlePath, {
        widget_type = "text_box",
        bounds = "0 0 40 856",
        text_label_unicode_strings_list = stringsTagPath,
        text_font = [[ui/ticker.font]],
        text_color = "1 1 1 1",
        justification = "center_justify",
        string_list_index = 0,
        vert_offset = 12
    })
    -- Generate subtitle
    local subtitlePath = [[insurrection/ui/shared/headers/subtitles/]] .. name ..
                             [[.ui_widget_definition]]
    widget.create(subtitlePath, {
        widget_type = "text_box",
        bounds = "0 0 20 856",
        text_label_unicode_strings_list = stringsTagPath,
        text_font = [[ui/ticker.font]],
        text_color = "1 1 1 1",
        justification = "center_justify",
        string_list_index = 1
    })
    return {
        bounds = "0 0 110 856",
        child_widgets = {
            {widget_tag = titlePath, vertical_offset = 0, horizontal_offset = 0},
            {widget_tag = subtitlePath, vertical_offset = 75, horizontal_offset = 0}
        }
    }
end
