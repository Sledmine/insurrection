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

widget.init [[insurrection/ui/menus/audio/]]

local layout = widget.align("vertical", 24, pos.options.x, pos.options.y, 2)

local name = "audio_settings_menu_custom"

return container {
    name = name,
    background = "transparent",
    childs = {
        {
            header {
                name = name,
                title = "AUDIO SETTINGS",
                subtitle = "CHANGE YOUR AUDIO SETTINGS TO FIT YOUR SETUP"
            },
            pos.header.x,
            pos.header.y
        },
        {
            options {
                name = name,
                alignment = "vertical",
                childs = {
                    {
                        spinner {
                            name = "master_volume",
                            text = "MASTER VOLUME",
                            value = strmem(8, "10"),
                            variant = "large"
                        },
                        layout()
                    },
                    {
                        spinner {
                            name = "effects_volume",
                            text = "GAME EFFECTS VOLUME",
                            value = strmem(8, "10"),
                            variant = "large"
                        },
                        layout()
                    },
                    {
                        spinner {
                            name = "music_volume",
                            text = "MUSIC VOLUME",
                            value = strmem(8, "10"),
                            variant = "large"
                        },
                        layout()
                    },
                    {
                        checkbox {
                            name = "hardware_acceleration",
                            text = "HARDWARE ACCELERATION",
                            variant = "large"
                        },
                        layout()
                    },
                    {
                        checkbox {
                            name = "environmental_sound",
                            text = "ENVIRONMENTAL SOUND",
                            variant = "large"
                        },
                        layout()
                    },
                    {
                        spinner {
                            name = "sound_quality",
                            text = "SOUND QUALITY",
                            value = strmem(8, "HIGH"),
                            variant = "large"
                        },
                        layout()
                    },
                    {
                        spinner {
                            name = "sound_variety",
                            text = "SOUND VARIETY",
                            value = strmem(8, "HIGH"),
                            variant = "large"
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
                title = "DESCRIPTION",
                text = strmem(384, "Customize different audio settings.")
            },
            layout(8)
        },
        {constants.components.version.path, 0, 460}
    }
}
