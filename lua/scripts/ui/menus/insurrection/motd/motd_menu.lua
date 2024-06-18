local widget = require "lua.scripts.widget"
local strmem = widget.strmem
local constants = require "lua.scripts.ui.components.constants"
local container = require "lua.scripts.ui.componentsV3.container"
local label = require "lua.scripts.ui.componentsV3.label"
local button = require "lua.scripts.ui.componentsV3.button"
local image = require "lua.scripts.ui.componentsV3.image"

widget.init [[insurrection/ui/menus/motd/]]

return container {
    name = "motd_menu",
    background = "dialog",
    childs = {
        {
            label {
                name = "motd_title",
                text = "MESSAGE OF THE DAY",
                variant = "title",
                justify = "center"
            },
            0,
            104
        },
        {
            label {
                name = "motd_subtitle",
                text = strmem(256, "THIS IS A TEST SUBTITLE"),
                variant = "subtitle",
                justify = "center",
                size = 60
            },
            0,
            210
        },
        {
            label {
                name = "motd_text",
                text = strmem(4096, "THIS IS A TEST MESSAGE"),
                variant = "text",
                justify = "center"
            },
            0,
            460
        },
        {
            button {
                name = "motd_ok",
                text = "OK",
                back = true,
                justification = "center_justify"
            },
            0,
            400
        },
        {constants.components.version.path, 0, 460}
    }
}