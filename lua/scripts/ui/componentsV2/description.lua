local widget = require "lua.scripts.widget"
local ustr = require "lua.scripts.modules.ustr"
local image = require "lua.scripts.ui.componentsV2.image"

local constants = require "lua.scripts.ui.components.constants"

---Description component
---@param name string Component name
---@param texts? string[] Texts to display
---@param bitmap? string Bitmap path to display
---@param variant? '"lan_maps"' | '"network_gametypes"' | '"difficulties"' | '"campaign"' | '"settings"' | '"multiplayer"' Variant to use
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
    if texts then
        if variant == "network_gametypes" then
            ustr([[ui/shell/strings/game_variant_descriptions.unicode_string_list]], texts)
        else
            dataStringsPath = widget.path .. "strings/" .. name ..
                                  "_description_data.unicode_string_list"
            ustr(dataStringsPath, texts)
        end
    end
    if not variant then
        if texts then
            nameStringsPath = widget.path .. "strings/" .. name ..
                                  "_description.unicode_string_list"
            ustr(nameStringsPath, texts)
        end
    elseif variant == "lan_maps" then
        nameStringsPath = [[ui\shell\main_menu\mp_map_list.unicode_string_list]]
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
    end

    widget.create(nameDescriptionPath, {
        widget_type = "text_box",
        bounds = "0, 0, 50, 300",
        text_label_unicode_strings_list = nameStringsPath,
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
    local dataDescriptionDef = {
        widget_type = "text_box",
        bounds = "0, 0, 50, 467",
        text_label_unicode_strings_list = dataStringsPath,
        string_list_index = 0,
        text_font = constants.fonts.subtitle,
        text_color = constants.color.text,
        justification = "left_justify"
    }
    if variant == "settings" then
        dataDescriptionDef.search_and_replace_functions = {
            {search_string = "__BUILD__", replace_function = "build_number"},
            {search_string = "__PID__", replace_function = "pid"}
        }
    end
    widget.create(dataDescriptionPath, dataDescriptionDef)
    ---@type invaderWidget
    local wid = {
        widget_type = "container",
        bounds = constants.getScreenBounds(),
        justification = "left_justify",
        -- Remove profile name in legacy usage
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
                    widget_tag = image("left_item_difficulty",
                                       [[insurrection/ui/bitmaps/singleplayer_difficulties.bitmap]],
                                       245, 270, 0.15),
                    horizontal_offset = 770,
                    vertical_offset = 250
                },
                {
                    widget_tag = image("center_item_difficulty",
                                       [[insurrection/ui/bitmaps/singleplayer_difficulties.bitmap]],
                                       245, 270, 0.15),
                    horizontal_offset = 0,
                    vertical_offset = 0
                },
                {
                    widget_tag = image("right_item_difficulty",
                                       [[insurrection/ui/bitmaps/singleplayer_difficulties.bitmap]],
                                       245, 270, 0.15),
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
    elseif variant == "network_gametypes" then
        widget.create(contentDescriptionPath, {
            bounds = constants.getScreenBounds(),
            child_widgets = {
                {widget_tag = nameDescriptionPath, horizontal_offset = 364, vertical_offset = 300},
                {widget_tag = imageDescriptionPath, horizontal_offset = 348, vertical_offset = 77},
                {widget_tag = dataDescriptionPath, horizontal_offset = 364, vertical_offset = 305},
                {
                    -- widget_tag = [[ui/shell/main_menu/gametype_select/locked_gametype_icon.ui_widget_definition]],
                    widget_tag = [[insurrection/ui/shared/void.ui_widget_definition]],
                    horizontal_offset = 364,
                    vertical_offset = 305
                }
            }
        })
        wid.child_widgets[2] = {
            widget_tag = contentDescriptionPath,
            vertical_offset = 0,
            horizontal_offset = 0
        }
    elseif variant == "settings" then
        wid = {
            widget_type = "container",
            bounds = constants.getScreenBounds(),
            justification = "left_justify",
            child_widgets = {
                {widget_tag = dataDescriptionPath, horizontal_offset = 364, vertical_offset = 305},
                {widget_tag = imageDescriptionPath, horizontal_offset = 348, vertical_offset = 77},
                {widget_tag = dataDescriptionPath, horizontal_offset = 364, vertical_offset = 305}
            }
        }
    elseif variant == "multiplayer" then
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
