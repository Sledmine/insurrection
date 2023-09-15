local widget = require "lua.scripts.widget"
local label = require "lua.scripts.ui.componentsV3.label"
local strmem = widget.strmem
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
local slider = require "lua.scripts.ui.componentsV3.slider"
local checkbox = require "lua.scripts.ui.componentsV3.checkbox"
local pos = constants.position

widget.init [[insurrection/ui/menus/customization/]]

local optionsLayout = widget.align("horizontal",
                                   constants.components.complexButton.horizontal.width,
                                   pos.options.x, pos.options.y, 2)
local nameplatesLayout = widget.align("vertical", 26, pos.options.x, 170, 3)
local projectLayout = widget.align("vertical", 24, pos.options.x, 170, 2)
local bipedsLayout = widget.align("horizontal", 260, 298, 410, 2)

return container {
    name = "customization_menu",
    background = "fade",
    conditionalWidgets = {
        {
            widget_tag = options {
                name = "select_bipeds",
                childs = {
                    {
                        options {
                            name = "select_project",
                            alignment = "vertical",
                            childs = {
                                {
                                    button("scroll_project_list_up", nil, {arrow = "up"}),
                                    projectLayout()
                                },
                                {button("project_1", strmem(64)), projectLayout()},
                                {button("project_2", strmem(64)), projectLayout()},
                                {button("project_3", strmem(64)), projectLayout()},
                                {button("project_4", strmem(64)), projectLayout()},
                                {
                                    button("scroll_project_list_down", nil, {arrow = "down"}),
                                    projectLayout()
                                }
                            }
                        }
                    },
                    {
                        options {
                            name = "select_project_biped",
                            alignment = "vertical",
                            childs = {
                                {
                                    slider {
                                        name = "bipeds_left",
                                        direction = "left",
                                        variant = "small"
                                    },
                                    317,
                                    380
                                },
                                {
                                    button("biped_1", strmem(64, "CUSTOMIZE"),
                                           {justification = "center_justify"}),
                                    336,
                                    pos.back.y
                                },
                                {
                                    slider {
                                        name = "bipeds_right",
                                        direction = "right",
                                        variant = "small"
                                    },
                                    523,
                                    380
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
                    {button("save_customization", "SAVE"), pos.back.x, pos.back.y - 26},
                    {button("back", "BACK", {back = true}), pos.back.x, pos.back.y}
                }
            }
        },
        {
            label {
                name = "current_biped",
                text = strmem(32),
                justify = "center",
                width = constants.screen.width,
                variant = "title"
            },
            0,
            380
        },
        {constants.components.currentProfile.path, 624, 20},
        {constants.components.version.path, 0, 460}
    }
}
