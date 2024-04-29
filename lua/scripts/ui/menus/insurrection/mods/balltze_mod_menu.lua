local widget = require "lua.scripts.widget"
local strmem = widget.strmem
local constants = require "lua.scripts.ui.components.constants"
local container = require "lua.scripts.ui.componentsV3.container"
local header = require "lua.scripts.ui.componentsV3.header"
local options = require "lua.scripts.ui.componentsV3.options"
local button = require "lua.scripts.ui.componentsV3.button"
local checkbox = require "lua.scripts.ui.componentsV3.checkbox"
local spinner = require "lua.scripts.ui.componentsV3.spinner"
local footer = require "lua.scripts.ui.componentsV3.footer"
local pos = constants.position

widget.init [[insurrection/ui/menus/balltze/]]

local layout = widget.align("vertical", 24, pos.options.x, pos.options.y, 2)

return container {
    name = "balltze_mod_menu",
    background = "transparent",
    childs = {
        {
            header {
                name = "balltze_mod_menu",
                title = "BALLTZE",
                subtitle = "CUSTOMIZE DIFFERENT BALLTZE SETTINGS"
            },
            pos.header.x,
            pos.header.y
        },
        {
            options {
                name = "balltze_mod_menu",
                alignment = "vertical",
                childs = {
                    {
                        checkbox {
                            name = "loading_screen",
                            text = "LOADING SCREEN",
                            variant = "large"
                        },
                        layout()
                    },
                    {
                        checkbox {
                            name = "preload_map_textures",
                            text = "PRELOAD MAP TEXTURES",
                            variant = "large"
                        },
                        layout()
                    },
                    {
                        spinner {
                            name = "gamepad_profile",
                            text = "GAMEPAD PROFILE",
                            variant = "large",
                            -- value = strmem(48, "REALLY LONG LONG WORD TO TEST SPACE LIKE REALLYY"),
                            value = strmem(32, "Xbox")
                        },
                        layout()
                    },
                    {button {name = "back", text = "BACK", back = true}, pos.back.x, pos.back.y}
                }
            }
        },
        {
            footer {
                name = "description",
                title = "DESCRIPTION",
                text = strmem(384,
                              "Choose which Balltze options you want to enable or disable.\r\nYou must restart the game to apply changes.")
            },
            layout(8)
        },
        {constants.components.version.path, 0, 460}
    }
}
