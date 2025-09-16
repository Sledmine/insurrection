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
local preview = require "lua.scripts.ui.componentsV3.preview"
local wrapper = require "lua.scripts.ui.componentsV3.wrapper"
local checkbox = require "lua.scripts.ui.componentsV3.checkbox"
local bar = require "lua.scripts.ui.componentsV3.bar"
local label = require "lua.scripts.ui.componentsV3.label"
local spinner = require "lua.scripts.ui.componentsV3.spinner"

widget.init [[insurrection/ui/menus/firefight/]]

local defsLayout = widget.layout {alignment = "horizontal", size = 149, x = 20, y = 60, margin = 2}

local elementsLayoutVertical = widget.layout {
    alignment = "vertical",
    size = 24,
    x = pos.options.x,
    y = 160,
    margin = 2
}

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
                subtitle = strmem(256, "SELECT A MAP AND OPTIONS TO PLAY FIREFIGHT")
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
                        button {name = "back", text = "BACK", variant = "small", back = true},
                        actionsLayout()
                    },
                    {button {name = "play", text = "PLAY", variant = "small"}, actionsLayout()}
                }
            }
        },
        {
            label {
                name = "search",
                text = strmem(256, "SEARCH MAP BY KEYWORDS"),
                variant = "subtitle"
            },
            20,
            105
        },
        {
            preview {
                name = "map",
                bitmap = "insurrection/ui/bitmaps/unknown_map_preview.bitmap",
                variant = "small"
            },
            226,
            160
        },
        {label {name = "map_name", text = strmem(32, "MAP NAME")}, 226, 273},
        {label {name = "map_author", text = strmem(32, "AUTHOR"), color = "blueYonder"}, 226, 285},
        {
            label {name = "map_description", text = strmem(64, "MAP DESCRIPTION"), height = 200},
            226,
            297
        },
        {
            bar {name = "maps_scroll", orientation = "vertical", type = "scroll", size = 154},
            215,
            160
        },
        {footer {name = "summary", title = "SUMMARY", text = strmem(256)}, pos.footer.x, 380},
        {constants.components.version.path, 0, 460}
    }
}

local posY = 116
local settingsLayout = widget.layout {
    alignment = "vertical",
    size = 24,
    x = pos.options.x,
    y = posY,
    margin = 2
}

local lengthArrowforText = 2
local lengthArrowforNumbers = -30
local positionX = pos.options.x + constants.components.button.normal.width + 8
local positionY = posY
local settings2Layout = widget.layout {
    alignment = "vertical",
    size = 24,
    x = positionX,
    y = positionY,
    margin = 2
}

local firefightSettingsMenuPath = wrapper {
    name = "firefight_settings_panel",
    width = 581,
    height = 258,
    isDebug = true,
    childs = {
        {
            options {
                name = "firefight_config",
                alignment = "vertical",
                childs = {
                    {
                        spinner {
                            name = "player_initial_lives",
                            text = "PLAYER INITIAL LIVES",
                            value = strmem(2, "10"),
                            length = lengthArrowforNumbers
                        },
                        settingsLayout()
                    },
                    {
                        spinner {
                            name = "extra_lives_gained",
                            text = "EXTRA LIVES GAINED",
                            value = strmem(2, "1"),
                            length = lengthArrowforNumbers
                        },
                        settingsLayout()
                    },
                    {
                        spinner {
                            name = "lives_lost_per_dead",
                            text = "LIVES LOST PER DEAD",
                            value = strmem(2, "1"),
                            length = lengthArrowforNumbers
                        },
                        settingsLayout()
                    },
                    {
                        spinner {
                            name = "waves_per_round",
                            text = "WAVES PER ROUND",
                            value = strmem(2, "5"),
                            length = lengthArrowforNumbers
                        },
                        settingsLayout()
                    },
                    {
                        spinner {
                            name = "rounds_per_set",
                            text = "ROUNDS PER SET",
                            value = strmem(2, "3"),
                            length = lengthArrowforNumbers
                        },
                        settingsLayout()
                    },
                    {
                        spinner {
                            name = "sets_per_game",
                            text = "SETS PER GAME",
                            value = strmem(2, "3"),
                            length = lengthArrowforNumbers
                        },
                        settingsLayout()
                    },
                    {
                        spinner {
                            name = "boss_wave_frequency",
                            text = "BOSS WAVE FREQUENCY",
                            value = strmem(2, "0"),
                            length = lengthArrowforNumbers
                        },
                        settingsLayout()
                    },
                    {
                        spinner {
                            name = "enemies_left_before_next_wave",
                            text = "ENEMIES LEFT",
                            value = strmem(2, "4"),
                            length = lengthArrowforNumbers
                        },
                        settingsLayout()
                    },
                    {
                        spinner {
                            name = "boss_enemies_left_before_next_wave",
                            text = "BOSS ENEMIES LEFT",
                            value = strmem(2, "0"),
                            length = lengthArrowforNumbers
                        },
                        settingsLayout()
                    },
                    {
                        spinner {
                            name = "wave_timer",
                            text = "WAVE TIMER",
                            value = strmem(2, "9"),
                            length = lengthArrowforNumbers
                        },
                        settingsLayout()
                    },
                    {
                        spinner {
                            name = "temporal_skull_frequency",
                            text = "TEMPORAL SKULL FREQUENCY",
                            value = strmem(14, "Each Round"),
                            length = lengthArrowforText,
                            variant = "large"
                        },
                        settings2Layout()
                    },
                    {
                        spinner {
                            name = "permanent_skull_frequency",
                            text = "PERMANENT SKULL FREQUENCY",
                            value = strmem(14, "Each Set"),
                            length = lengthArrowforText,
                            variant = "large"
                        },
                        settings2Layout()
                    },
                    {
                        checkbox {
                            name = "random_permanent_skulls",
                            text = "ALLOW RANDOM PERMANENT SKULLS",
                            variant = "large"
                        },
                        settings2Layout()
                    }
                }
            }
        }
    }
}

widget.global(firefightSettingsMenuPath, "insurrection/ui/custom_menus.tag_collection")

return firefightMenuPath
