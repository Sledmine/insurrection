local widget = require "lua.scripts.widget"
local strmem = widget.strmem
local container = require "lua.scripts.ui.componentsV3.container"
local options = require "lua.scripts.ui.componentsV3.options"
local button = require "lua.scripts.ui.componentsV3.button"
local label = require "lua.scripts.ui.componentsV3.label"
local image = require "lua.scripts.ui.componentsV3.image"
local constants = require "lua.scripts.ui.components.constants"

widget.init [[insurrection/ui/menus/dialog/]]

local layout = widget.align("vertical", 24, 336, 340, 2)

local dialogMenu = container {
    name = "dialog_menu",
    background = "transparent",
    childs = {
        {
            image {
                name = "dialog_background",
                image = "insurrection/ui/bitmaps/dialog_menu_background.bitmap",
                width = constants.screen.width,
                height = constants.screen.height
            },
            0,
            0
        },
        {
            label {name = "dialog_title", text = strmem(64), variant = "title", justify = "center"},
            0,
            104
        },
        {
            label {
                name = "dialog_subtitle",
                text = strmem(128),
                variant = "text",
                justify = "center"
            },
            0,
            154
        },
        {
            label {
                name = "dialog_text",
                text = strmem(4096),
                variant = "text",
                justify = "center",
                size = 60
            },
            0,
            210
        },
        {
            options {
                name = "dialog",
                layout = "vertical",
                childs = {
                    {
                        button {
                            name = "dialog_ok",
                            text = "OK",
                            back = true,
                            justification = "center_justify"
                        },
                        layout()
                    }
                }
            }
        },
        {constants.components.version.path, 0, 460}
    }
}
return dialogMenu
