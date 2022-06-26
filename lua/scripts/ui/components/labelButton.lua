---@param justification '"left_justify"' | '"center_justify"' | '"right_justify"'
---@param horizontal_offset number?
---@param vertical_offset number?
---@return invaderWidget
return function(justification, horizontal_offset, vertical_offset)
    return {
        bounds = "0 0 24 190",
        background_bitmap = [[.bitmap]],
        text_font = [[ui\large_ui.font]],
        text_color = "1 1 1 1",
        justification = justification or "left_justify",
        horiz_offset = horizontal_offset or 10,
        vert_offset = vertical_offset or 5
    }
end