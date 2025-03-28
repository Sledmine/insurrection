local widget = require "lua.scripts.widget"
local container = require "lua.scripts.ui.componentsV3.container"
local header = require "lua.scripts.ui.componentsV3.header"
local options = require "lua.scripts.ui.componentsV3.options"
local button = require "lua.scripts.ui.componentsV3.button"
local constants = require "lua.scripts.ui.components.constants"
local checkbox = require "lua.scripts.ui.componentsV3.checkbox"
local spinner = require "lua.scripts.ui.componentsV3.spinner"
local footer = require "lua.scripts.ui.componentsV3.footer"

local pos = constants.position

widget.init [[insurrection/ui/menus/mods/chimera/]]

local layout = widget.align("vertical", 24, pos.options.x, pos.options.y, 2)
local positionX = pos.options.x + constants.components.button.normal.width + 8
local positionY = pos.options.y
local spinnersLayout = widget.align("vertical", 24, positionX, positionY, 2)

local chimeraModMenu = container {
    name = "chimera_mod_menu",
    background ="transparent",
    childs = {
        {
            header {
                name = "chimera_mod",
                title = "CHIMERA",
                subtitle = "CUSTOMIZE DIFFERENT CHIMERA SETTINGS"
            },
            pos.header.x,
            pos.header.y
        },
        {
            options {
                name = "chimera_mod",
                alignment = "vertical",
                childs = {
                    {
                        checkbox {
                            name = "vsync",
                            text = "USE VSYNC",
                        },
                        layout()
                    },
                    {
                        checkbox {
                            name = "fps",
                            text = "SHOW FPS",
                        },
                        layout()
                    },
                    {
                        checkbox {
                            name = "windowed",
                            text = "WINDOWED MODE"
                        },
                        layout()
                    },
                    {
                        checkbox {
                            name = "borderless",
                            text = "BORDERLESS"
                        },
                        layout()
                    },
                    {
                        checkbox {
                            name = "enable_map_memory_buffer",
                            text = "LOAD MAPS ON RAM"
                        },
                        layout()
                    },
                    {
                        checkbox {
                            name = "af",
                            text = "ANISOTROPIC FILTER"
                        },
                        layout()
                    },
                    {
                        checkbox {
                            name = "block_buffering",
                            text = "BLOCK BUFFERING"
                        },
                        layout()
                    },
                    {
                        checkbox {
                            name = "block_hold_f1",
                            text = "BLOCK HOLD F1 AT START"
                         },
                        layout()
                    },
                    {
                        checkbox {
                            name = "block_loading_screen",
                            text = "BLOCK LOADING SCREEN"
                        },
                        layout()
                    },
                    {
                        checkbox {
                            name = "block_zoom_blur",
                            text =  "BLOCK ZOOM BLUR"
                        },
                        layout()
                    },
                    {
                        checkbox {
                            name = "devmode",
                            text = "DEVMODE"
                        },
                        layout()
                    },
                    {
                        checkbox {
                            name = "show_budget",
                            text  = "SHOW BUDGET"
                        },
                        layout()
                    },
                    {
                        spinner {
                            name = "fov",
                            text = "FOV",
                            value ="000v"
                        },
                        spinnersLayout()
                    },
                    {
                        button {
                            name = "back",
                            text = "BACK",
                            back = true,
                        },
                        pos.back.x,
                        pos.back.y
                    }
                }
            }
        },
        {
            footer {
                name = "chimera_mod_footer",
                title = "DESCRIPTION",
                text = "Choose which Chimera options you want to enable or disable.\r\nWARNING: Some options may require a game restart to apply changes.",
            },
            layout(8)
        },
        {constants.components.currentProfile.path, 624, 20},
        {constants.components.version.path, 0, 460}
    }
}

return chimeraModMenu
