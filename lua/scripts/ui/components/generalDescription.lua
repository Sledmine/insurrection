return function(variant)
    ---@type invaderWidget
    local wid = {
        widget_type ="container",
        bounds = "0 0 480 854",
        background_bitmap = ".bitmap",
        justification = "left_justify",
        child_widgets = {
            [[insurrection\ui\shared\void.ui_widget_definition]]
        }
    }
    local imageDescription = [[insurrection\ui\shared\descriptions\]] .. variant .. [[_image.ui_widget_definition]]
    local textDescription = [[insurrection\ui\shared\descriptions\]] .. variant .. [[_text.ui_widget_definition]]
    return wid
end