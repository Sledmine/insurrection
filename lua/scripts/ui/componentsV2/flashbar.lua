local widget = require "lua.scripts.widget"
local ustr = require "lua.scripts.modules.ustr"

local constants = require "lua.scripts.ui.components.constants"

---Flash bar component
---@param name string Component name
---@param text string Text to display
---@return string
return function(name, text)
    local widgetPath = widget.path .. name .. "_flashbar.ui_widget_definition"
    local stringsTagPath = widget.path .. "strings/" .. name .. "_flashbar.unicode_string_list"
    widget.createV2(widgetPath, {
        widget_type = "text_box",
        flags = {flash_background_bitmap = true},
        flags_1 = {flashing = true, dont_do_that_weird_focus_test = true},
        background_bitmap = [[ui/shell/bitmaps/white.bitmap]],
        bounds = "0, 0, 20, " .. constants.screen.width,
        text_label_unicode_strings_list = ustr(stringsTagPath, {text}) or ".unicode_string_list",
        string_list_index = 0,
        justification = "center_justify",
        text_font = constants.fonts.shadow,
        text_color = "1, 0, 0, 0",
        vert_offset = 5
    })
    return widgetPath
end
