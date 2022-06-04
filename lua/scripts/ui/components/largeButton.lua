---@param justification '"left_justify"' | '"center_justify"' | '"right_justify"'
---@return invaderWidget
return function(justification, select)
    ---@type invaderWidget
    local wid = {
        bounds = "0 0 24 389",
        background_bitmap = [[insurrection\ui\bitmaps\large_button.bitmap]],
        text_font = [[ui\large_ui.font]],
        text_color = "1 1 1 1",
        justification = justification or "left_justify",
        horiz_offset = 10,
        vert_offset = 5
    }
    if select then
        wid.background_bitmap = [[insurrection\ui\bitmaps\large_button_select.bitmap]]
    end
    return wid
end