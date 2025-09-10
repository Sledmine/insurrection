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

widget.init [[insurrection/ui/menus/firefight/]]

local defsLayout = widget.layout {alignment = "horizontal", size = 149, x = 20, y = 60, margin = 2}

local elementsLayout = widget.layout {
    alignment = "horizontal",
    size = 120,
    x = 19,
    y = 0,
    margin = 2
}

local elementsLayoutVertical = widget.layout {
    alignment = "vertical",
    size = 24,
    x = pos.options.x,
    y = 160,
    margin = 2
}

local optionsLayout = widget.align("vertical", 24, pos.options.x, 140, 2)

-- local nameplatesLayout = widget.layout {
--    alignment = "vertical",
--    size = 28,
--    x = 641,
--    y = 20,
--    margin = 2
-- }

local actionsLayout = widget.layout {
    alignment = "horizontal",
    size = 149,
    x = 20,
    y = 416,
    margin = 2
}

local firefightMenuPath = container {
    name = "firefight_menu",
    background = "transparent",
    childs = {
        {
            header {
                name = "firefight_menu",
                title = strmem(256, "FIREFIGHT"),
                subtitle = strmem(256, "SELECT A MAP AND OPTIONS TO PLAY FIREFIGHT.")
            },
            pos.header.x,
            pos.header.y
        },
        {
            options {
                name = "firefight",
                alignment = "vertical",
                childs = {
                    {
                        options {
                            name = "definitions",
                            alignment = "horizontal",
                            childs = {
                                {
                                    complexButton {
                                        name = "definition_map",
                                        variant = "horizontal",
                                        label = "MAP",
                                        text = strmem(128)
                                    },
                                    defsLayout()
                                },
                                {
                                    complexButton {
                                        name = "definition_options",
                                        variant = "horizontal_small",
                                        label = "OPTIONS",
                                        text = strmem(64)
                                    },
                                    defsLayout()
                                }
                            }
                        }
                    },
                    {
                        input {
                            name = "search",
                            text = strmem(32),
                            placeholder = strmem(32, "Search..."),
                            variant = "small",
                            icon = "insurrection/ui/bitmaps/search_icon.bitmap"
                        },
                        pos.options.x,
                        122
                    },
                    {
                        options {
                            name = "firefight_maps",
                            alignment = "vertical",
                            childs = {
                                {
                                    button {name = "scroll_map_list_up", arrow = "up"},
                                    elementsLayoutVertical()
                                },
                                {
                                    button {
                                        name = "element_map_1",
                                        text = strmem(32, "MAP_1"),
                                        variant = "normal"
                                    },
                                    elementsLayoutVertical()
                                },
                                {
                                    button {
                                        name = "element_map_2",
                                        text = strmem(32, "MAP_2"),
                                        variant = "normal"
                                    },
                                    elementsLayoutVertical()
                                },
                                {
                                    button {
                                        name = "element_map_3",
                                        text = strmem(32, "MAP_3"),
                                        variant = "normal"
                                    },
                                    elementsLayoutVertical()
                                },
                                {
                                    button {
                                        name = "element_map_4",
                                        text = strmem(32, "MAP_4"),
                                        variant = "normal"
                                    },
                                    elementsLayoutVertical()
                                },
                                {
                                    button {name = "scroll_map_list_down", arrow = "down"},
                                    elementsLayoutVertical()
                                }
                            }
                        }
                    },
                    {
                        preview {
                            name = "map_small",
                            bitmap = "insurrection/ui/bitmaps/unknown_map_preview.bitmap",
                            variant = "small"
                        },
                        226,
                        160
                    },
                    {label {name = "map_name", text = strmem(32, "MAP NAME")}, 226, 273},
                    {
                        label {
                            name = "map_author",
                            text = strmem(32, "AUTHOR"),
                            color = "blueYonder"
                        },
                        226,
                        285
                    },
                    {
                        label {
                            name = "map_description",
                            text = strmem(64, "MAP DESCRIPTION"),
                            height = 200
                        },
                        226,
                        297
                    },
                    {
                        bar {
                            name = "maps_bar_scroll",
                            orientation = "vertical",
                            type = "scroll",
                            size = 154
                        },
                        215,
                        160
                    },
                    {
                        button {name = "back", text = "BACK", variant = "small", back = true},
                        actionsLayout()
                    },
                    {button {name = "play", text = "PLAY", variant = "small"}, actionsLayout()}
                }
            }
        },
        {
            label {
                name = "search_browser",
                text = strmem(256, "SEARCH MAP BY KEYWORDS"),
                variant = "subtitle"
            },
            20,
            105
        },
        {footer {name = "summary", title = "SUMMARY", text = strmem(256)}, pos.footer.x, 365},
        {constants.components.version.path, 0, 460}
    }
    -- conditionalWidgets = {
    --    {
    --        widget_tag = wrapper {
    --            name = "firefight_maps",
    --            width = 465,
    --            height = 160,
    --            childs = {
    --                {
    --                    options {
    --                        name = "elements",
    --                        alignment = "vertical",
    --                        childs = {
    --                            {
    --                                button {
    --                                    name = "firefight_option_1",
    --                                    text = strmem(32, "OPTION 1"),
    --                                    variant = "large"
    --                                },
    --                                optionsLayout()
    --                            },
    --                            {
    --                                button {
    --                                    name = "firefight_option_2",
    --                                    text = strmem(32, "OPTION 2"),
    --                                    variant = "large"
    --                                },
    --                                optionsLayout()
    --                            },
    --                            {
    --                                button {
    --                                    name = "firefight_option_3",
    --                                    text = strmem(32, "OPTION 3"),
    --                                    variant = "large"
    --                                },
    --                                optionsLayout()
    --                            },
    --                            {
    --                                button {
    --                                    name = "firefight_option_4",
    --                                    text = strmem(32, "OPTION 4"),
    --                                    variant = "large"
    --                                },
    --                                optionsLayout()
    --                            }
    --                        }
    --                    }
    --                }
    --            }
    --        }
    --    }
    -- }
}

widget.global(firefightMenuPath, "insurrection/ui/custom_menus.tag_collection")

return firefightMenuPath
