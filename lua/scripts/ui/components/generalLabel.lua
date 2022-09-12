local ustr = require "lua.scripts.modules.ustr"
---@param name string
---@param text string
---@param variant? '"title"' | '"subtitle"' | '"paragraph"'
---@param color? string
---@param width? string
---@return invaderWidget
return function(name, text, variant, color, width)
    -- Generate strings tag
    local stringsTagPath = [[insurrection/ui/shared/strings/labels/]] .. name ..
                               [[.unicode_string_list]]
    ustr(stringsTagPath, {text})
    local wid = {
        widget_type = "text_box",
        bounds = "0 0 20 " .. (width or "300"),
        text_label_unicode_strings_list = stringsTagPath,
        text_font = [[ui/gamespy.font]],
        text_color = color or "1 1 1 1",
        string_list_index = 0
    }
    if variant == "title" then
        wid.text_font = [[ui/ticker.font]]
    elseif variant == "subtitle" then
        wid.text_font = [[ui/gamespy.font]]
    end
    return wid
end
