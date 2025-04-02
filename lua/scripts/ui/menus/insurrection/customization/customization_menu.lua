local widget = require "lua.scripts.widget"
local label = require "lua.scripts.ui.componentsV3.label"
local bar   = require "lua.scripts.ui.componentsV3.bar"
local strmem = widget.strmem
local container = require "lua.scripts.ui.componentsV3.container"
local options = require "lua.scripts.ui.componentsV3.options"
local button = require "lua.scripts.ui.componentsV3.button"
local header = require "lua.scripts.ui.componentsV3.header"
local constants = require "lua.scripts.ui.components.constants"
local nameplate = require "lua.scripts.ui.componentsV2.nameplate"
local complexButton = require "lua.scripts.ui.componentsV3.complexButton"
local wrapper = require "lua.scripts.ui.componentsV3.wrapper"
local slider = require "lua.scripts.ui.componentsV3.slider"
local pos = constants.position

widget.init [[insurrection/ui/menus/customization/]]

local complexLayout = widget.align("horizontal",
                                   constants.components.complexButton.horizontal.width,
                                   pos.options.x, pos.options.y, 2)
local nameplatesLayout = widget.align("vertical", 26, pos.options.x, 120, 2)
local projectLayout = widget.align("vertical", 24, pos.options.x, 120, 2)
-- local bipedsLayout = widget.align("horizontal", 260, 298, 410, 2)

local optionsLayout = widget.layout {
    alignment = "horizontal",
    size = 149,
    x = 20,
    y = 416,
    margin = 2
}


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
                                    button {
                                        name = "scroll_project_list_up",
                                        arrow = "up",
                                    },
                                    projectLayout()
                                },
                                {
                                    button {
                                        name = "project_1",
                                        text = strmem(64),
                                    },
                                    projectLayout()
                                },
                                {
                                    button {
                                        name = "project_2",
                                        text = strmem(64),
                                    },
                                    projectLayout()
                                },
                                {
                                    button {
                                        name = "project_3",
                                        text = strmem(64),
                                    },
                                    projectLayout()
                                },
                                {
                                    button {
                                        name = "project_4",
                                        text = strmem(64),
                                    },
                                    projectLayout()
                                },
                                {
                                    button {
                                        name = "scroll_project_list_down",
                                        arrow = "down",
                                    },
                                    projectLayout()
                                },
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
                                    button {
                                        name = "biped_1",
                                        text = strmem(64, "CUSTOMIZE"),
                                        justification = "center_justify"
                                    },
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
            header {
                name = "header",
                title = "INSURRECTION CUSTOMIZATION",
                subtitle = "CUSTOMIZE DIFFERENT ASPECTS FROM YOUR INSURRECTION ACCOUNT"
            },
            pos.header.x,
            pos.header.y
        },{
            bar {
                name = "customization_scroll",
                orientation = "vertical",
                type = "scroll",
                size = 192
            },
            240,
            149
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
                            childs = {
                                {
                                    complexButton {
                                        name = "nameplates",
                                        text = "NAMEPLATES",
                                        label = "Select Nameplate",
                                        variant = "horizontal"
                                    },
                                    complexLayout()
                                },
                                {
                                    complexButton {
                                        name = "bipeds",
                                        text = "BIPEDS",
                                        label = "Select Biped",
                                        variant = "horizontal"
                                    },
                                    complexLayout()
                                },
                            },
                        }
                    },
                    {
                        options {
                            name = "nameplates",
                            alignment = "vertical",
                            childs = {
                                {
                                    button {
                                        name = "scroll_nameplates_list_up",
                                        arrow = "up",
                                    },
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
                                    button {
                                        name = "scroll_nameplates_list_down",
                                        arrow = "down",
                                    },
                                    nameplatesLayout()
                                },
                            }
                        }
                    },
                    {
                        button {
                            name = "back",
                            text = "BACK",
                            variant = "small",
                            back = true
                        },
                        optionsLayout()
                    },
                    {
                        button {
                            name = "save_customization",
                            text = "SAVE",
                            variant = "small",
                            back = true
                        },
                        pos.back_left.x,
                        pos.back_left.y - 26
                    },
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
        {constants.components.currentProfile.path, pos.nameplate.x, pos.nameplate.y},
        {constants.components.version.path, pos.version.x, pos.version.y}
    }
}
