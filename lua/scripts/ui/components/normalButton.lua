---@param justification '"left_justify"' | '"center_justify"' | '"right_justify"'
---@param horiz_offset number
---@param vertical_offset number
---@return invaderWidget
return function(justification, horiz_offset, vertical_offset)
    return {
        bounds = "0 0 24 184",
        background_bitmap = [[insurrection\ui\bitmaps\normal_button.bitmap]],
        text_font = [[ui\large_ui.font]],
        text_color = "1 1 1 1",
        justification = justification or "left_justify",
        horiz_offset = horiz_offset or 10,
        vert_offset = vertical_offset or 5
    }
end