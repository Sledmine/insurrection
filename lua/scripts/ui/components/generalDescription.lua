local widget = require "lua.scripts.widget"
local constants = require "lua.scripts.ui.components.constants"
local ustr = require "lua.scripts.modules.ustr"
---General description component used across multiple stock game menus
---@param variant '"maps"' | '"gametypes"'
---@return invaderWidget
return function(variant)
    ---@type invaderWidget
    local wid = {
        widget_type = "container",
        bounds = "0 0 " .. constants.screen.height .. " " .. constants.screen.width,
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
        --dataStringsPath =
        --    [[ui\shell\main_menu\multiplayer_type_select\mp_map_select\map_data.unicode_string_list]]
        dataStringsPath = [[insurrection/ui/shared/strings/content/map_descriptions.unicode_string_list]]
        ustr(dataStringsPath, {
            "Battle Creek - Splash Splash, Bang Bang (2-8 players)",
            "Sidewinder - Red Blood, White Snow (4-16 players, supports vehicles)",
            "Damnation - Covenant Hydro-Processing Center (4-8 players)",
            "Rat Race - Up the Ramps, Down the Tubes (2-6 players)",
            "Prisoner - Get on Top (2-8 players)",
            "Hang'Em High - Tombstones for Everybody (4-16 players)",
            "Chill Out - Dude, you really need to... (2-8 players)",
            "Derelict - Deep-Space Anomaly #0198 (4-8 players)",
            "Boarding Action - Ship-to-Ship Combat (4-16 players)",
            "Blood Gulch - The Quick and the Dead (4-16 players, supports vehicles)",
            "Wizard - You spin my head right round, right round (2-8 players)",
            "Chiron TL34 - Spartan Clone Training Complex (2-16 players)",
            "Longest - A long walk down a short hall... (2-8 players)",
            "Ice Fields - Splipping and Sliding (4-16 players, supports vehicles)",
            "Death Island - Sand, Surf and Spent Shells (4-16 players, supports vehicles)",
            "Danger Canyon - Don't Look Down Unless You Fall (4-16 players, supports vehicles)",
            "Infinity - I Imagined it Would Be Bigger (4-16 players, supports vehicles)",
            "Timberland - An Enemy Behind Every Tree (4-16 players, supports vehicles)",
            "Gephyrophobia - Scary, huh? (2-12 players, supports vehicles)",
            "Custom Map - Community Made Map"
        })
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
        bounds = "-263 -467 263 467",
        background_bitmap = imagePath,
        child_widgets = {{widget_tag = overlayImageDescriptionPath}}
    })
    widget.create(dataDescriptionPath, {
        widget_type = "text_box",
        bounds = "0 0 50 300",
        text_label_unicode_strings_list = dataStringsPath,
        text_font = [[ui\gamespy.font]],
        text_color = constants.color.text,
        justification = "left_justify"
    })
    widget.create(contentDescriptionPath, {
        bounds = "0 0 " .. constants.screen.height .. " " .. constants.screen.width,
        child_widgets = {
            {widget_tag = nameDescriptionPath, horizontal_offset = 360, vertical_offset = 300},
            {widget_tag = imageDescriptionPath, horizontal_offset = 344, vertical_offset = 77},
            {widget_tag = dataDescriptionPath, horizontal_offset = 360, vertical_offset = 305}
        }
    })
    wid.child_widgets[2] = {
        widget_tag = contentDescriptionPath,
        vertical_offset = 0,
        horizontal_offset = 0
    }
    return wid
end
