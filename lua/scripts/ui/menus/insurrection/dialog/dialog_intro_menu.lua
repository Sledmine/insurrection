local widget = require "lua.scripts.widget"
local container = require "lua.scripts.ui.componentsV3.container"
local options = require "lua.scripts.ui.componentsV3.options"
local button = require "lua.scripts.ui.componentsV3.button"
local label = require "lua.scripts.ui.componentsV3.label"

widget.init [[insurrection/ui/menus/dialog_intro/]]

local layout = widget.align("vertical", 24, 336, 340, 2)

return container {
    name = "dialog_intro_menu",
    background = "dialog",
    childs = {
        {
            label {
                name = "dialog_intro_title",
                text = "FATAL ERROR",
                variant = "title",
                justify = "center"
            },
            0,
            104
        },
        {
            label {
                name = "dialog_intro_subtitle",
                text = "INSURRECTION PLUGIN FAILURE!",
                variant = "error",
                justify = "center"
            },
            0,
            154
        },
        {
            label {
                name = "dialog_intro_text",
                text = "Insurrection menu has not loaded correctly.\r\nPlease check the integrity of the files or contact the developers on the Discord server:\r\nhttps://discord.shadowmods.net",
                justify = "center",
                height = 50
            },
            0,
            220
        },
        {
            options {
                name = "dialog_intro_actions",
                layout = "horizontal",
                childs = {
                    {
                        button {
                            name = "close_game",
                            text = "CLOSE GAME",
                            justification = "center_justify",
                            back = true
                        },
                        336,
                        340
                    }
                }
            }
        }
    }
}