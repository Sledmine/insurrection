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

widget.init [[insurrection/ui/menus/settings_custom/]]

local layout = widget.align("vertical", 24, pos.options.x, pos.options.y, 2)

local name = "settings_menu_custom"

return container {
    name = name,
    background = "transparent",
    childs = {
        {
            header {name = name, title = "SETTINGS", subtitle = "CUSTOMIZE YOUR GAME EXPERIENCE"},
            pos.header.x,
            pos.header.y
        },
        {
            options {
                name = name,
                alignment = "vertical",
                childs = {
                    {
                        button {
                            name = "controller",
                            text = "CONTROLLER",
                        },
                        layout()
                    },
                    {
                        button {
                            name = "keyboard_mouse",
                            text = "KEYBOARD / MOUSE",
                        },
                        layout()
                    },
                    {
                        button {
                            name = "video",
                            text = "VIDEO",
                            opens = [[insurrection/ui/menus/video/video_settings_menu_custom.ui_widget_definition]],
                        },
                        layout()
                    },
                    {
                        button {
                            name = "audio",
                            text = "AUDIO",
                            opens = [[insurrection/ui/menus/audio/audio_settings_menu_custom.ui_widget_definition]],
                        },
                        layout()
                    },
                    {
                        button{
                            name = "network",
                            text = "NETWORK",
                        },
                        layout()
                    },
                    {
                        button{
                            name = "about",
                            text = "ABOUT INSURRECTION",
                        },
                        layout()
                    },
                    {button {name = "back", text = "BACK", back = true}, pos.back.x, pos.back.y}
                }
            }
        },
        {
            footer {
                name = name,
                title = "GAME SETTINGS DESCRIPTION",
                text = strmem(384, "Set your game settings to your liking. You can change your controller, keyboard, video, audio, and\r\nnetwork settings. You can also learn more about Insurrection."),
            },
            layout(8)
        },
        {constants.components.version.path, 0, 460}
    }
}
