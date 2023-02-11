local widget = require "lua.scripts.widget"
local ustr = require "lua.scripts.modules.ustr"

local constants = require "lua.scripts.ui.components.constants"

---Version footer component
---@param name string Component name
---@param text string Text to display
---@return string
return function(name, text)
    local widgetPath = widget.path .. name .. "_version_footer.ui_widget_definition"
    local stringsTagPath = widget.path .. "strings/" .. name .. "_version_footer.unicode_string_list"
    widget.createV2(widgetPath, {
        widget_type = "text_box",
        --flags = {pass_unhandled_events_to_focused_child = true},
        bounds = "0, 0, 20, " .. constants.screen.width,
        text_label_unicode_strings_list = ustr(stringsTagPath, {text}) or ".unicode_string_list",
        string_list_index = 0,
        justification = "center_justify",
        text_font = constants.fonts.subtitle,
        text_color = constants.color.text,
        vert_offset = 0
    })
    return widgetPath
end
