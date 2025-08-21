local widget = require "lua.scripts.widget"
local constants = require "lua.scripts.ui.components.constants"
local pos = constants.position
local strmem = widget.strmem
local container = require "lua.scripts.ui.componentsV3.container"
local options = require "lua.scripts.ui.componentsV3.options"
local button = require "lua.scripts.ui.componentsV3.button"
local header = require "lua.scripts.ui.componentsV3.header"
local input = require "lua.scripts.ui.componentsV3.input"
local footer = require "lua.scripts.ui.componentsV3.footer"
local complexButton = require "lua.scripts.ui.componentsV3.complexButton"
local slider = require "lua.scripts.ui.componentsV3.slider"
local nameplate = require "lua.scripts.ui.componentsV3.nameplate"
local box = require "lua.scripts.ui.componentsV3.box"
local preview = require "lua.scripts.ui.componentsV3.preview"
local wrapper = require "lua.scripts.ui.componentsV3.wrapper"
local checkbox = require "lua.scripts.ui.componentsV3.checkbox"
local bar = require "lua.scripts.ui.componentsV3.bar"
local label = require "lua.scripts.ui.componentsV3.label"
local buttonSquare = require "lua.scripts.ui.componentsV3.buttonSquare"
local image = require "lua.scripts.ui.componentsV3.image"

widget.init [[insurrection/ui/menus/lobby_skulls/]]

local defsLayout = widget.layout {alignment = "horizontal", size = 149, x = 20, y = 60, margin = 2}


local skullsLayoutA = widget.layout {
    alignment = "horizontal",
    size = 80,
    x = 15,
    y = 136,
    margin = -4
}

return container {
    name = "lobby_skulls_menu",
    background = "transparent",
    childs = {
        {
            header {
                name = "lobby_skulls_menu",
                title = strmem(256, " MY LOBBY"),
                subtitle = "INVITE FRIENDS TO YOUR LOBBY, CHOOSE YOUR SERVER TYPE, SET YOUR RULES AND HAVE FUN!"
            },
            pos.header.x,
            pos.header.y
        },
        {
            options {
                name = "lobby_skulls",
                alignment = "vertical",
                childs = {
                    {
                        options {
                            name = "definition_skulls",
                            alignment = "horizontal",
                            childs = {
                                {
                                    complexButton {
                                        name = "definition_skulls_map",
                                        variant = "horizontal",
                                        label = "MAP",
                                        text = strmem(128)
                                    },
                                    defsLayout()
                                },
                                {
                                    complexButton {
                                        name = "definition_skulls_gametype",
                                        variant = "horizontal",
                                        label = "GAMETYPE",
                                        text = strmem(64)
                                    },
                                    defsLayout()
                                },
                                {
                                    complexButton {
                                        name = "definition_skulls_template",
                                        variant = "horizontal",
                                        label = "TEMPLATE",
                                        text = strmem(64)
                                    },
                                    defsLayout()
                                },
                                {
                                    complexButton {
                                        name = "definition_skulls",
                                        variant = "horizontal_small",
                                        label = "SKULLS",
                                        text = strmem(64)
                                    },
                                    defsLayout()
                                }
                            }
                        }
                    }
                }
            }
        },
        {
            options {
                name = "skull_grid",
                alignment = "horizontal",
                childs = {
                    {
                        buttonSquare {
                            name = "skull_1",
                            justification = "center_justify",
                            variant = "small",
                            childs = {
                                {
                                    image {
                                        name = "skull_1",
                                        bitmap = "insurrection/ui/bitmaps/skull_button_icons.bitmap",
                                        width = 128,
                                        height = 128,
                                        scale = 0.375
                                    },
                                    16,
                                    16
                                },
                                {checkbox {name = "skull_1", align = "left", transparent = true}, 4
                                
                                
                                
                                
                                
                                , 52}
                            }
                        },
                        skullsLayoutA()
                    },
                    {
                        buttonSquare {
                            name = "skull_2",
                            justification = "center_justify",
                            variant = "small",
                            childs = {
                                {
                                    image {
                                        name = "skull_2",
                                        bitmap = "insurrection/ui/bitmaps/skull_button_icons.bitmap",
                                        width = 128,
                                        height = 128,
                                        scale = 0.375
                                    },
                                    16,
                                    16
                                },
                                {checkbox {name = "skull_2", align = "left", transparent = true}, 4, 52 }
                            }
                        },
                        skullsLayoutA()
                    }
                }
            }
        },
        {constants.components.version.path, 0, 460}
    }
}
