---Generic buttons arrow handled by the game
---@param variant "up" | "down"
---@return invaderWidget
return function(variant)
    ---@type invaderWidget
    local wid = {
        bounds = "0 0 32 32",
        background_bitmap = [[insurrection\ui\bitmaps\scroll_arrow_up.bitmap]],
        child_widgets = {}
    }
    if variant == "down" then
        wid.background_bitmap = [[insurrection\ui\bitmaps\scroll_arrow_down.bitmap]]
    end
    return wid
end
