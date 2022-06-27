local ustr = require "lua.scripts.modules.ustr"
---Normal button component, recycled in multiple components
---@param justification? '"left_justify"' | '"center_justify"' | '"right_justify"' Button text alignment
---@param horiz_offset number? Has default alignment of 10
---@param vertical_offset number? Has default alignment of 5
---@param name string? Name of the button component (also used for inner tags generation)
---@param text string? Auto generated unicode string inside this button
---@param select boolean? Use select bitmap version instead
---@return invaderWidget
return function(justification, horiz_offset, vertical_offset, name, text, select)
    local stringsTagPath
    if text then
        -- Generate strings tag
        stringsTagPath = [[insurrection/ui/shared/strings/buttons/]] .. name ..
                             [[.unicode_string_list]]
        ustr(stringsTagPath, {text})
    end
    ---@type invaderWidget
    local widget = {
        widget_type = "text_box",
        bounds = "0 0 24 184",
        background_bitmap = [[insurrection\ui\bitmaps\normal_button.bitmap]],
        text_label_unicode_strings_list = stringsTagPath,
        text_font = [[ui\large_ui.font]],
        text_color = "1 1 1 1",
        justification = justification or "left_justify",
        horiz_offset = horiz_offset or 10,
        vert_offset = vertical_offset or 5
    }
    if text then
        widget.string_list_index = 0
    end
    if select then
        widget.background_bitmap = [[insurrection\ui\bitmaps\normal_button_select.bitmap]]
    end
    return widget
end
