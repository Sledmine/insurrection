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

widget.init [[insurrection/ui/menus/video/]]

local layout = widget.align("vertical", 24, pos.options.x, pos.options.y, 2)

local name = "video_settings_menu_custom"

return container {
    name = name,
    background = "transparent",
    childs = {
        {
            header {name = name, title = "VIDEO SETTINGS", subtitle = "CHANGE YOUR VIDEO SETTINGS TO FIT YOUR SETUP"},
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
                            name = "resolution",
                            text = "RESOLUTION",
                            variant = "large",
                            value = strmem(16, "1920x1080"),
                        },
                        layout()
                    },
                    {
                        spinner {
                            name = "refresh_rate",
                            text = "REFRESH RATE",
                            variant = "large",
                            value = strmem(10, "60Hz"),
                        },
                        layout()
                    },
                    {
                        checkbox {
                            name = "specular",
                            text = "RENDER SPECULAR SURFACES",
                            variant = "large",
                        },
                        layout()
                    },
                    {
                        checkbox {
                            name = "shadows",
                            text = "RENDER OBJECTS SHADOWS",
                            variant = "large",
                        },
                        layout()
                    },
                    {
                        checkbox {
                            name = "decals",
                            text = "RENDER MAP DECALS",
                            variant = "large",
                        },
                        layout()
                    },
                    {
                        checkbox {
                            name = "particles",
                            text = "RENDER EFFECTS PARTICLES",
                            variant = "large",
                        },
                        layout()
                    },
                    {
                        spinner {
                            name = "texture_quality",
                            text = "TEXTURE QUALITY",
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
                text = strmem(384, "Customize different video settings."),
            },
            layout(8)
        },
        {constants.components.version.path, 0, 460}
    }
}
