local widget = require "lua.scripts.widget"
local ustr = require "lua.scripts.modules.ustr"
local image= require "lua.scripts.ui.componentsV2.image"

local constants = require "lua.scripts.ui.components.constants"

---Description component
---@param name string Component name
---@param texts string[] Texts to display
---@param bitmap? string Bitmap path to display
---@param variant? '"lan_maps"' | '"gametypes"' | '"difficulties"' | '"campaign"' Variant to use
return function(name, texts, bitmap, variant)
    local widgetPath = widget.path .. name .. "_description.ui_widget_definition"
    local overlayImageDescriptionPath =
        [[insurrection\ui\shared\descriptions\overlay.ui_widget_definition]]
    local nameStringsPath
    local bitmapPath = bitmap or [[ui/shell/bitmaps/black.bitmap]]
    local dataStringsPath
    local contentDescriptionPath = widget.path .. name ..
                                       [[_description_content.ui_widget_definition]]
    local dataDescriptionPath = widget.path .. name .. [[_description_data.ui_widget_definition]]
    local imageDescriptionPath = widget.path .. name .. [[_description_image.ui_widget_definition]]
    local nameDescriptionPath = [[insurrection\ui\shared\descriptions\]] .. name ..
                                    [[_name.ui_widget_definition]]
    if not variant then
        nameStringsPath = ustr(widget.path .. "strings/" .. name ..
                                   "_description.unicode_string_list", texts)
        bitmapPath = bitmapPath
        dataStringsPath = ustr(widget.path .. "strings/" .. name ..
                                   "_description_data.unicode_string_list", texts)
    elseif variant == "lan_maps" then
        nameStringsPath = [[ui\shell\main_menu\mp_map_list.unicode_string_list]]
        bitmapPath = [[insurrection\ui\bitmaps\map_previews.bitmap]]
        -- dataStringsPath =
        --    [[ui\shell\main_menu\multiplayer_type_select\mp_map_select\map_data.unicode_string_list]]
        dataStringsPath =
            [[insurrection/ui/shared/strings/content/map_descriptions.unicode_string_list]]
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
        contentDescriptionPath = widget.path .. variant ..
                                     [[_description_content.ui_widget_definition]]
        dataDescriptionPath = widget.path .. variant ..
                                  [[_description_data.ui_widget_definition]]
        imageDescriptionPath = widget.path .. variant .. [[_description_image.ui_widget_definition]]
        nameDescriptionPath = [[insurrection\ui\shared\descriptions\]] .. variant ..
                                  [[_name.ui_widget_definition]]
    elseif variant == "difficulties" then
        dataStringsPath = ustr(widget.path .. "strings/" .. name ..
                                   "_description_data.unicode_string_list", {
            [[Your foes cower and fall before your unstoppable onslaught, yet final victory will leave you wanting more.]],
            [[Hordes of aliens vie to destroy you, but nerves of steel and a quick trigger finger give you a solid chance to prevail.]],
            [[Your enemies are as numerous as they are ferocious; their attacks are devastating. Survival is not guaranteed.]],
            [[You face opponents who have never known defeat, who laugh in alien tongues at your efforts to survive. This is legendary.]]
        })
    elseif variant == "campaign" then
        dataStringsPath = ustr(widget.path .. "strings/" .. name ..
                                   "_description_data.unicode_string_list", {
            [[Escape intact as Covenant forces board your ship.]],
            [[Seek out surviving Marines and help them fight the Covenant.]],
            [[Board a Covenant ship in an attempt to rescue Captain Keyes.]],
            [[Search for the map room that will lead you to the secrets of Halo.]],
            [[Defend the Control Room against wave after have of Covenant troops.]],
            [[Creep through a swamp to meet the only enemy the Covenant fear.]],
            [[Fight your way through an ancient security facility in search of the index.]],
            [[Reactivate the weapon at the heart of Halo... and learn the truth.]],
            [[Stage a one-spartan assault on a Covenant ship and bring back the Captain.]],
            [[Destroy Halo before Halo destroys all life in the galaxy.]],
            [[You cannot play this level... yet!]],
            "You have a game in progress on this level.\r\nSelect to continue your game."
        })
    elseif variant == "gametypes" then
        -- TODO add correct strings path
        -- stringsListPath = [[ui\shell\main_menu\mp_map_list]]
        error("Variant gametypes not implemented")
    end

    widget.create(nameDescriptionPath, {
        widget_type = "text_box",
        bounds = "0, 0, 50, 300",
        text_label_unicode_strings_list = nameStringsPath or ".unicode_string_list",
        string_list_index = 0,
        text_font = constants.fonts.text,
        text_color = constants.color.text,
        justification = "left_justify"
    })
    widget.create(overlayImageDescriptionPath, {
        bounds = "0, 0, 263, 467",
        background_bitmap = [[insurrection\ui\bitmaps\description_overlay.bitmap]]
    })
    widget.create(imageDescriptionPath, {
        bounds = "-263, -467, 263, 467",
        background_bitmap = bitmapPath,
        child_widgets = {{widget_tag = overlayImageDescriptionPath}}
    })
    widget.create(dataDescriptionPath, {
        widget_type = "text_box",
        bounds = "0, 0, 50, 467",
        text_label_unicode_strings_list = dataStringsPath or ".unicode_string_list",
        string_list_index = 0,
        text_font = constants.fonts.subtitle,
        text_color = constants.color.text,
        justification = "left_justify"
    })
    ---@type invaderWidget
    local wid = {
        widget_type = "container",
        bounds = constants.getScreenBounds(),
        justification = "left_justify",
        child_widgets = {{widget_tag = [[insurrection\ui\shared\void.ui_widget_definition]]}}
    }
    if variant == "difficulties" then
        wid = {
            widget_type = "container",
            bounds = constants.getScreenBounds(),
            justification = "left_justify",
            child_widgets = {
                {widget_tag = imageDescriptionPath, horizontal_offset = 348, vertical_offset = 77},
                {widget_tag = dataDescriptionPath, horizontal_offset = 364, vertical_offset = 305},
                {
                    widget_tag = [[insurrection/ui/shared/void.ui_widget_definition]],
                    horizontal_offset = 0,
                    vertical_offset = 0
                }
            }
        }
    elseif variant == "campaign" then
        widget.create(contentDescriptionPath, {
            bounds = constants.getScreenBounds(),
            child_widgets = {
                {widget_tag = nameDescriptionPath, horizontal_offset = 364, vertical_offset = 300},
                {widget_tag = imageDescriptionPath, horizontal_offset = 348, vertical_offset = 77},
                {widget_tag = dataDescriptionPath, horizontal_offset = 364, vertical_offset = 305},
                {
                    widget_tag = image("left_item_difficulty", [[insurrection/ui/bitmaps/singleplayer_difficulties.bitmap]], 245, 270, 0.15),
                    horizontal_offset = 770,
                    vertical_offset = 250
                },
                {
                    widget_tag = image("center_item_difficulty", [[insurrection/ui/bitmaps/singleplayer_difficulties.bitmap]], 245, 270, 0.15),
                    horizontal_offset = 0,
                    vertical_offset = 0
                },
                {
                    widget_tag = image("right_item_difficulty", [[insurrection/ui/bitmaps/singleplayer_difficulties.bitmap]], 245, 270, 0.15),
                    horizontal_offset = 0,
                    vertical_offset = 0
                }
            }
        })
        wid = {
            widget_type = "container",
            bounds = constants.getScreenBounds(),
            justification = "left_justify",
            child_widgets = {
                {
                    widget_tag = [[insurrection/ui/shared/void.ui_widget_definition]],
                    horizontal_offset = 0,
                    vertical_offset = 0
                },
                {widget_tag = contentDescriptionPath, vertical_offset = 0, horizontal_offset = 0}

            }
        }
    else
        widget.create(contentDescriptionPath, {
            bounds = constants.getScreenBounds(),
            child_widgets = {
                {widget_tag = nameDescriptionPath, horizontal_offset = 364, vertical_offset = 300},
                {widget_tag = imageDescriptionPath, horizontal_offset = 348, vertical_offset = 77},
                {widget_tag = dataDescriptionPath, horizontal_offset = 364, vertical_offset = 305}
            }
        })
        wid.child_widgets[2] = {
            widget_tag = contentDescriptionPath,
            vertical_offset = 0,
            horizontal_offset = 0
        }
    end

    widget.create(widgetPath, wid)
    return widgetPath
end
