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
        imagePath = [[insurrection\ui\bitmaps\map_previews.bitmap]]
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
    local overlayImageDescriptionPath =
        [[insurrection\ui\shared\descriptions\overlay.ui_widget_definition]]
    local nameDescriptionPath = [[insurrection\ui\shared\descriptions\]] .. variant ..
                                    [[_name.ui_widget_definition]]
    widget.create(nameDescriptionPath, {
        widget_type = "text_box",
        bounds = "0 0 50 300",
        text_label_unicode_strings_list = nameStringsPath,
        text_font = [[ui\large_ui.font]],
        text_color = "1 1 1 1",
        justification = "left_justify"
    })
    widget.create(overlayImageDescriptionPath, {
        bounds = "0 0 263 467",
        background_bitmap = [[insurrection\ui\bitmaps\description_overlay.bitmap]]
    })
    widget.create(imageDescriptionPath, {
        bounds = "0 0 263 467",
        background_bitmap = imagePath,
        child_widgets = {{widget_tag = overlayImageDescriptionPath}}
    })
    widget.create(dataDescriptionPath, {
        widget_type = "text_box",
        bounds = "0 0 50 300",
        text_label_unicode_strings_list = dataStringsPath,
        text_font = [[ui\gamespy.font]],
        text_color = "1 1 1 1",
        justification = "left_justify"
    })
    widget.create(contentDescriptionPath, {
        bounds = "0 0 480 854",
        child_widgets = {
            {widget_tag = nameDescriptionPath, horizontal_offset = 360, vertical_offset = 287},
            {widget_tag = imageDescriptionPath, horizontal_offset = 344, vertical_offset = 77},
            {widget_tag = dataDescriptionPath, horizontal_offset = 360, vertical_offset = 290}
        }
    })
    wid.child_widgets[2] = {
        widget_tag = contentDescriptionPath,
        vertical_offset = 0,
        horizontal_offset = 0
    }
    return wid
end
