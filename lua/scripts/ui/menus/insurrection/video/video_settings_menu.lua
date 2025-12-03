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

local name = "video_settings_menu_custom"

local variant = "large"

local layout = widget.layout {
    alignment = "vertical",
    size = 24,
    x = pos.options.x,
    y = pos.options.y,
    margin = 2
}
local layout2 = widget.layout {
    alignment = "vertical",
    size = 24,
    x = pos.options.x + constants.components.button[variant].width + 8,
    y = pos.options.y,
    margin = 2
}

return container {
    name = name,
    background = "transparent",
    childs = {
        {
            header {
                name = name,
                title = "VIDEO SETTINGS",
                subtitle = "CHANGE YOUR VIDEO SETTINGS TO FIT YOUR SETUP"
            },
            pos.header.x,
            pos.header.y
        },
        {
            options {
                name = name,
                alignment = "vertical",
                childs = {
                    -- {
                    --    spinner {
                    --        name = "adapter",
                    --        text = "DISPLAY ADAPTER",
                    --        variant = variant,
                    --        value = strmem(32, "NVIDIA GeForce GTX 1080"),
                    --    },
                    --    layout()
                    -- },
                    {
                        spinner {
                            name = "resolution",
                            text = "RESOLUTION",
                            variant = variant,
                            value = strmem(10, "1920x1080")
                        },
                        layout()
                    },
                    {
                        spinner {
                            name = "refresh_rate",
                            text = "REFRESH RATE",
                            variant = variant,
                            value = strmem(6, "60Hz")
                        },
                        layout()
                    },
                    {
                        spinner {
                            name = "texture_quality",
                            text = "TEXTURE QUALITY",
                            value = strmem(6, "HIGH"),
                            variant = variant
                        },
                        layout()
                    },
                    {
                        spinner {
                            name = "fov",
                            text = "FIELD OF VIEW",
                            value = strmem(4, "70"),
                            variant = variant
                        },
                        layout()
                    },
                    {
                        checkbox {
                            name = "specular",
                            text = "RENDER SPECULAR SURFACES",
                            variant = variant
                        },
                        layout()
                    },
                    {
                        checkbox {
                            name = "shadows",
                            text = "RENDER OBJECTS SHADOWS",
                            variant = variant
                        },
                        layout()
                    },
                    {
                        checkbox {name = "decals", text = "RENDER MAP DECALS", variant = variant},
                        layout()
                    },
                    {
                        checkbox {
                            name = "particles",
                            text = "RENDER EFFECTS PARTICLES",
                            variant = variant
                        },
                        layout()
                    },
                    {checkbox {name = "use_vsync", text = "USE VSYNC", variant = variant}, layout()},
                    {checkbox {name = "show_fps", text = "SHOW FPS", variant = variant}, layout()},
                    {
                        checkbox {name = "windowed_mode", text = "WINDOWED MODE", variant = variant},
                        layout()
                    },
                    {
                        checkbox {name = "bordeless", text = "BORDERLESS WINDOW", variant = variant},
                        layout()
                    },
                    {
                        checkbox {
                            name = "anisotropic",
                            text = "ANISOTROPIC FILTER",
                            variant = variant
                        },
                        layout()
                    },
                    {
                        checkbox {
                            name = "preload_textures",
                            text = "PRELOAD MAP TEXTURES",
                            variant = variant
                        },
                        layout2()
                    },
                    {button {name = "back", text = "BACK", back = true}, pos.back.x, pos.back.y}
                }
            }
        },
        {
            footer {
                name = name,
                title = "DESCRIPTION",
                text = strmem(384, "Customize different video settings.")
            },
            layout(8)
        },
        {constants.components.version.path, 0, 460}
    }
}
