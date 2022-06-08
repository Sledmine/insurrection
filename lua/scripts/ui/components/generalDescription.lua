local widget = require "lua.scripts.widget"
---General description component used across multiple stock game menus
---@param variant '"maps"' | '"gametypes"'
---@return invaderWidget
return function(variant)
    ---@type invaderWidget
    local wid = {
        widget_type = "container",
        bounds = "0 0 480 856",
        background_bitmap = ".bitmap",
        justification = "left_justify",
        child_widgets = {{widget_tag = [[insurrection\ui\shared\void.ui_widget_definition]]}}
    }
    local nameStringsPath
    local imagePath
    local dataStringsPath
    if variant == "maps" then
        nameStringsPath = [[ui\shell\main_menu\mp_map_list.unicode_string_list]]
        imagePath = [[ui\shell\bitmaps\mp_map_grafix.bitmap]]
        dataStringsPath =
            [[ui\shell\main_menu\multiplayer_type_select\mp_map_select\map_data.unicode_string_list]]
    elseif variant == "gametypes" then
        -- TODO add correct strings path
        -- stringsListPath = [[ui\shell\main_menu\mp_map_list]]
    end
    local contentDescriptionPath = [[insurrection\ui\shared\descriptions\]] .. variant ..
                                       [[_content.ui_widget_definition]]
    local dataDescriptionPath = [[insurrection\ui\shared\descriptions\]] .. variant ..
                                    [[_data.ui_widget_definition]]
    local imageDescriptionPath = [[insurrection\ui\shared\descriptions\]] .. variant ..
                                     [[_image.ui_widget_definition]]
    local nameDescriptionPath = [[insurrection\ui\shared\descriptions\]] .. variant ..
                                    [[_name.ui_widget_definition]]
    widget.create(nameDescriptionPath, {
        widget_type = "text_box",
        bounds = "0 0 300 300",
        text_label_unicode_strings_list = nameStringsPath,
        text_font = [[ui\large_ui.font]],
        text_color = "1 1 1 1",
        justification = "center_justify"
    })
    widget.create(imageDescriptionPath, {bounds = "0 0 128 256", background_bitmap = imagePath})
    widget.create(dataDescriptionPath, {
        widget_type = "text_box",
        bounds = "0 0 300 300",
        text_label_unicode_strings_list = dataStringsPath,
        text_font = [[ui\large_ui.font]],
        text_color = "1 1 1 1"
    })
    widget.create(contentDescriptionPath, {
        bounds = "0 0 480 856",
        child_widgets = {
            {widget_tag = nameDescriptionPath},
            {widget_tag = imageDescriptionPath},
            {widget_tag = dataDescriptionPath}
        }
    })
    wid.child_widgets[2] = {widget_tag = contentDescriptionPath}
    return wid
end
