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
local spinner = require "lua.scripts.ui.componentsV3.spinner"

widget.init [[insurrection/ui/menus/firefight_options/]]


local posY = 116
local optionsLayout = widget.align("vertical", 24, pos.options.x, posY, 2)

local lengthArrowforText = 0
local lengthArrowforNumbers = -30
local positionX = pos.options.x + constants.components.button.normal.width + 8
local positionY = posY
local optionsSideLayout = widget.align("vertical", 24, positionX, positionY, 2)


local defsLayout = widget.layout {alignment = "horizontal", size = 149, x = 20, y = 60, margin = 2}

-- local nameplatesLayout = widget.layout {
--    alignment = "vertical",
--    size = 28,
--    x = 641,
--    y = 20,
--    margin = 2
-- }

local firefightMenuPath = container {
    name = "firefight_options_menu",
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
                name = "firefight_config",
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
                        spinner {
                            name = "player_initial_lives",
                            text = "PLAYER INITIAL LIVES",
                            value = strmem(2, "10"),
                            length = lengthArrowforNumbers
                            --variant = "large"
                        },
                        optionsLayout()
                    },
                    {
                        spinner {
                            name = "extra_lives_gained",
                            text = "EXTRA LIVES GAINED",
                            value = strmem(2, "1"),
                            length = lengthArrowforNumbers
                            --variant = "large"
                        },
                        optionsLayout()
                    },
                    {
                        spinner {
                            name = "lives_lost_per_dead",
                            text = "LIVES LOST PER DEAD",
                            value = strmem(2, "1"),
                            length = lengthArrowforNumbers
                            --variant = "large"
                        },
                        optionsLayout()
                    },
                    {
                        spinner {
                            name = "waves_per_round",
                            text = "WAVES PER ROUND",
                            value = strmem(2, "5"),
                            length = lengthArrowforNumbers
                            --variant = "large"
                        },
                        optionsLayout()
                    },
                    {
                        spinner {
                            name = "rounds_per_set",
                            text = "ROUNDS PER SET",
                            value = strmem(2, "3"),
                            length = lengthArrowforNumbers
                            --variant = "large"
                        },
                        optionsLayout()
                    },
                    {
                        spinner {
                            name = "sets_per_game",
                            text = "SETS PER GAME",
                            value = strmem(2, "3"),
                            length = lengthArrowforNumbers
                            --variant = "large"
                        },
                        optionsLayout()
                    },
                    {
                        spinner {
                            name = "boss_wave_frequency",
                            text = "BOSS WAVE FREQUENCY",
                            value = strmem(2, "0"),
                            length = lengthArrowforNumbers
                        },
                        optionsLayout()
                    },
                    {
                        spinner {
                            name = "enemies_left_before_next_wave",
                            text = "ENEMIES LEFT",
                            value = strmem(2, "4"),
                            length = lengthArrowforNumbers
                            --variant = "large"
                        },
                        optionsLayout()
                    },
                    {
                        spinner {
                            name = "boss_enemies_left_before_next_wave",
                            text = "BOSS ENEMIES LEFT",
                            value = strmem(2, "0"),
                            length = lengthArrowforNumbers
                        },
                        optionsLayout()
                    },
                    {
                        spinner {
                            name = "wave_timer",
                            text = "WAVE TIMER",
                            value = strmem(2, "9"),
                            length = lengthArrowforNumbers
                        },
                        optionsLayout()
                    },
                    {
                        spinner {
                            name = "temporal_skull_frequency",
                            text = "TEMPORAL SKULL FREQUENCY",
                            value = strmem(14, "Each Round"),
                            length = lengthArrowforText,
                            variant = "large"
                        },
                        optionsSideLayout()
                    },
                    {
                        spinner {
                            name = "permanent_skull_frequency",
                            text = "PERMANENT SKULL FREQUENCY",
                            value = strmem(14, "Each Set"),
                            length = lengthArrowforText,
                            variant = "large"
                        },
                        optionsSideLayout()
                    },
                    {
                        checkbox {
                            name = "random_permanent_skulls",
                            text = "ALLOW RANDOM PERMANENT SKULLS",
                            variant = "large"
                        },
                        optionsSideLayout()
                    }
                }
            }
        },
        -- {
        --    label {
        --        name = "player_settings",
        --        text = strmem(256, "PLAYER SETTINGS"),
        --        variant = "subtitle"
        --    },
        --    20,
        --    105
        -- },
        {footer {name = "summary", title = "SUMMARY", text = strmem(384, "OPTION DESCRIPTION HERE")}, pos.footer.x, 380},
        {constants.components.version.path, 0, 460}
    }
}

widget.global(firefightMenuPath, "insurrection/ui/custom_menus.tag_collection")

return firefightMenuPath
