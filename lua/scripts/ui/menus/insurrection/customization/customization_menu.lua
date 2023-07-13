local widget = require "lua.scripts.widget"
local container = require "lua.scripts.ui.componentsV3.container"
local options = require "lua.scripts.ui.componentsV3.options"
local button = require "lua.scripts.ui.componentsV2.button"
local header = require "lua.scripts.ui.componentsV2.header"
local input = require "lua.scripts.ui.componentsV2.input"
local constants = require "lua.scripts.ui.components.constants"
local image = require "lua.scripts.ui.componentsV2.image"
local footer = require "lua.scripts.ui.componentsV2.footer"
local nameplate = require "lua.scripts.ui.componentsV2.nameplate"
local complexButton = require "lua.scripts.ui.componentsV2.complexButton"
local box = require "lua.scripts.ui.componentsV2.box"
local wrapper = require "lua.scripts.ui.componentsV3.wrapper"
local pos = constants.position

widget.init [[insurrection/ui/menus/customization/]]

local optionsLayout = widget.align("horizontal",
                                   constants.components.complexButton.horizontal.width,
                                   pos.options.x, pos.options.y, 2)
local nameplatesLayout = widget.align("vertical", 26, pos.options.x, 170, 3)
local projectLayout = widget.align("vertical", 24, pos.options.x, 170, 2)
local bipedsLayout = widget.align("vertical", 24,
                                  pos.options.x + constants.components.button.normal.width + 2, 170,
                                  2)

return container {
    name = "customization_menu",
    noBackgroud = true,
    conditionalWidgets = {
        {
            widget_tag = options {
                name = "select_bipeds",
                alignment = "horizontal",
                childs = {
                    {
                        options {
                            name = "select_map_biped",
                            alignment = "vertical",
                            childs = {
                                {
                                    button("scroll_bipeds_maps_list_up", nil, {arrow = "up"}),
                                    projectLayout()
                                },
                                {button("biped_map_1", string.rep(" ", 32)), projectLayout()},
                                {button("biped_map_2", string.rep(" ", 32)), projectLayout()},
                                {button("biped_map_3", string.rep(" ", 32)), projectLayout()},
                                {button("biped_map_4", string.rep(" ", 32)), projectLayout()},
                                --{button("biped_map_5", string.rep(" ", 32)), projectLayout()},
                                --{button("biped_map_6", string.rep(" ", 32)), projectLayout()},
                                --{button("biped_map_7", string.rep(" ", 32)), projectLayout()},
                                {
                                    button("scroll_bipeds_maps_list_down", nil, {arrow = "down"}),
                                    projectLayout()
                                }
                            }
                        }
                    }
                }
            }
        }
    },
    childs = {
        {
            header("customization", "INSURRECTION CUSTOMIZATION",
                   "CUSTOMIZE DIFFERENT ASPECTS FROM YOUR INSURRECTION ACCOUNT"),
            pos.header.x,
            pos.header.y
        },
        {
            options {
                name = "customization",
                alignment = "vertical",
                childs = {
                    {
                        options {
                            name = "types",
                            alignment = "horizontal",
                            {
                                {
                                    complexButton("nameplates", "NAMEPLATES", "Select Nameplate",
                                                  {variant = "horizontal"}),
                                    optionsLayout()
                                },
                                {
                                    complexButton("bipeds", "BIPEDS", "Select Biped",
                                                  {variant = "horizontal"}),
                                    optionsLayout()
                                }
                            }
                        }
                    },
                    {
                        options {
                            name = "nameplates",
                            alignment = "vertical",
                            childs = {
                                {
                                    button("scroll_nameplates_list_up", nil, {arrow = "up"}),
                                    nameplatesLayout()
                                },
                                {nameplate("1"), nameplatesLayout()},
                                {nameplate("2"), nameplatesLayout()},
                                {nameplate("3"), nameplatesLayout()},
                                {nameplate("4"), nameplatesLayout()},
                                {nameplate("5"), nameplatesLayout()},
                                {nameplate("6"), nameplatesLayout()},
                                {nameplate("7"), nameplatesLayout()},
                                {
                                    button("scroll_nameplates_list_down", nil, {arrow = "down"}),
                                    nameplatesLayout()
                                }
                            },
                            description = wrapper {
                                name = "nameplate_description",
                                {{nameplate("preview", nil, {preview = true}), 254, 200}}
                            }
                        }
                    },
                    {button("save_customization", "SAVE"), pos.back.x - 186, pos.back.y},
                    {button("back", "BACK", {back = true}), pos.back.x, pos.back.y}
                }
            }
        },
        {constants.components.currentProfile.path, 624, 20},
        {constants.components.version.path, 0, 460}
    }
}
