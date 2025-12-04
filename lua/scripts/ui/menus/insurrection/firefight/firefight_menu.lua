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
local buttonSquare = require "lua.scripts.ui.componentsV3.buttonSquare"
local image = require "lua.scripts.ui.componentsV3.image"

widget.init [[insurrection/ui/menus/firefight/]]

local panelWidth = 581
local panelHeight = 258

local defsLayout = widget.layout {
    alignment = "horizontal",
    size = constants.components.complexButton.horizontal_small.width,
    x = 171,
    y = 60,
    margin = 2
}

local elementsLayoutVertical = widget.layout {
    alignment = "vertical",
    size = 24,
    x = 0,
    y = 55,
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
                                        text = strmem(128, "Map")
                                    },
                                    20,
                                    60
                                },
                                {
                                    complexButton {
                                        name = "definition_options",
                                        variant = "horizontal_small",
                                        label = "SETTINGS",
                                        text = "Customize Firefight"
                                    },
                                    defsLayout()
                                },
                                {
                                    complexButton {
                                        name = "definitions_skulls",
                                        variant = "horizontal_small",
                                        label = "SKULLS",
                                        text = "Preset Skulls"
                                    },
                                    defsLayout()
                                },
                                {
                                    complexButton {
                                        name = "definitions_difficulty",
                                        variant = "horizontal_small",
                                        label = "DIFFICULTY",
                                        text = strmem(128, "Normal")
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
                            width = panelWidth,
                            height = panelHeight,
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
                        },
                        20,
                        105
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
        {label {name = "map_name", text = strmem(32, "MAP NAME")}, 226, 270},
        {label {name = "map_author", text = strmem(64, "AUTHOR"), color = "blueYonder"}, 226, 282},
        {
            label {
                name = "map_description",
                text = strmem(128, "MAP DESCRIPTION"),
                height = 200,
                variant = "subtitle",
                color = "white"
            },
            227,
            298
        },
        {
            bar {name = "maps_scroll", orientation = "vertical", type = "scroll", size = 154},
            215,
            160
        },
        {
            footer {
                name = "description",
                title = "DESCRIPTION",
                text = strmem(256, "This area will show the description of the selected map.")
            },
            pos.footer.x,
            380
        },
        {constants.components.version.path, pos.version.x, pos.version.y}
    }
}

local settingsLayout = widget.layout {alignment = "vertical", size = 24, x = 0, y = 0, margin = 2}

local lengthArrowforText = 2
local lengthArrowforNumbers = -30
local positionX = constants.components.button.normal.width + 8
local settings2Layout = widget.layout {
    alignment = "vertical",
    size = 24,
    x = positionX,
    y = 0,
    margin = 2
}

local firefightSettingsMenuPath = wrapper {
    name = "firefight_settings_panel",
    width = panelWidth,
    height = panelHeight,
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
                            text = "EXTRA BOSS WAVE FREQ",
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
                        checkbox {name = "round_ending_boss", text = "ALLOW ROUND ENDING BOSS"},
                        settingsLayout()
                    },
                    {
                        spinner {
                            name = "game_timer",
                            text = "GAME TIMER",
                            value = strmem(2, "1"),
                            length = lengthArrowforNumbers,
                            variant = "large"
                        },
                        settings2Layout()
                    },
                    {
                        spinner {
                            name = "wave_timer",
                            text = "WAVE TIMER",
                            value = strmem(2, "9"),
                            length = lengthArrowforNumbers,
                            variant = "large"
                        },
                        settings2Layout()
                    },
                    {
                        spinner {
                            name = "round_timer",
                            text = "ROUND TIMER",
                            value = strmem(2, "10"),
                            length = lengthArrowforNumbers,
                            variant = "large"
                        },
                        settings2Layout()
                    },
                    {
                        spinner {
                            name = "set_timer",
                            text = "SET TIMER",
                            value = strmem(2, "1"),
                            length = lengthArrowforNumbers,
                            variant = "large"
                        },
                        settings2Layout()
                    },
                    -- {
                    --    spinner {
                    --        name = "starting_enemy_team",
                    --        text = "STARTING ENEMY TEAM",
                    --        value = strmem(16, "Covenant"),
                    --        length = lengthArrowforText,
                    --        variant = "large"
                    --    },
                    --    settings2Layout()
                    -- },
                    {
                        spinner {
                            name = "activate_temporal_skull_each",
                            text = "ACTIVATE TEMPORAL SKULL EVERY",
                            value = strmem(16, "Round"),
                            length = lengthArrowforText,
                            variant = "large"
                        },
                        settings2Layout()
                    },
                    {
                        spinner {
                            name = "reset_temporal_skull_each",
                            text = "RESET TEMPORAL SKULL EVERY",
                            value = strmem(16, "Set"),
                            length = lengthArrowforText,
                            variant = "large"
                        },
                        settings2Layout()
                    },
                    {
                        spinner {
                            name = "activate_permanent_skull_each",
                            text = "ACTIVATE PERMANENT SKULL EVERY",
                            value = strmem(16, "Set"),
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
                    },
                    {
                        spinner {
                            name = "deploy_allies",
                            text = "DEPLOY ALLIES EVERY",
                            value = strmem(16, "Boss Wave"),
                            length = lengthArrowforText,
                            variant = "large"
                        },
                        settings2Layout()
                    },
                    {
                        spinner {
                            name = "player_assistances",
                            text = "PLAYER ASSISTANCES EVERY",
                            value = strmem(16, "Round"),
                            length = lengthArrowforText,
                            variant = "large"
                        },
                        settings2Layout()
                    }
                }
            }
        }
    }
}


local wrapperWidth = 581
local wrapperHeight = 258

local startingX = -5
local startingY = 12
local buttonSquareMargin = 4
local buttonSquareSize = 80 - buttonSquareMargin
local backgroundX = 406

local rowsCount = 3
local columnsCount = 5
local skullsCount = rowsCount * columnsCount
local skullsPositions = {}

for rowIndex = 1, rowsCount do
    for columnIndex = 1, columnsCount do
        local layout = widget.layout {
            alignment = "horizontal",
            size = buttonSquareSize,
            x = (startingX - buttonSquareSize) + columnIndex * buttonSquareSize,
            -- x = startingX + (columnIndex - 1) * buttonSquareSize,
            y = (startingY - buttonSquareSize) + rowIndex * buttonSquareSize,
            -- y = startingY + (rowIndex - 1) * buttonSquareSize,
            margin = 0
        }
        table.insert(skullsPositions, {layout()})
    end
end

local skullElements = {}
for i = 1, skullsCount do
    table.insert(skullElements, {
        buttonSquare {
            name = "skull_" .. i,
            justification = "center_justify",
            variant = "small",
            childs = {
                {
                    image {
                        name = "skull_" .. i,
                        bitmap = "insurrection/ui/bitmaps/skull_button_icons.bitmap",
                        width = 128,
                        height = 128,
                        scale = 0.28
                    },
                    22,
                    22
                },
                -- {
                --    image {
                --        name = "skull_stack_icon" .. i,
                --        bitmap = "insurrection/ui/bitmaps/replay_icon.bitmap",
                --        width = 128,
                --        height = 128,
                --        scale = 0.08
                --    },
                --    62,
                --    8
                -- },
                -- {
                --    image {
                --        name = "skull_perma_icon" .. i,
                --        bitmap = "insurrection/ui/bitmaps/perma_icon.bitmap",
                --        width = 64,
                --        height = 32,
                --        scale = 0.25
                --    },
                --    8,
                --    8
                -- },
                -- {
                --    label {
                --        name = "skull_stacked" .. i,
                --        variant = "subtitle",
                --        color = "white",
                --        text = strmem(3, "1"),
                --        justify = "right",
                --        width = 16
                --    },
                --    45,
                --    3
                -- },
                {
                    checkbox {
                        name = "skull_" .. i,
                        align = "left",
                        transparent = true
                    },
                    9,
                    57
                },
                --{
                --    label {
                --        name = "skull_multiplier" .. i,
                --        variant = "button",
                --        color = "cobalt",
                --        text = strmem(3, "x" .. "1"),
                --        justify = "right",
                --        width = 16
                --    },
                --    55,
                --    55
                --}
            }
        },
        table.unpack(skullsPositions[i])
    })
end

local skullsWrapperPath = wrapper {
    name = "skulls_panel",
    isDebug = false,
    width = wrapperWidth,
    height = wrapperHeight,
    childs = {
        {
            options {
                name = "skull_all",
                alignment = "vertical",
                childs = {
                    {
                        options {
                            name = "skull_grid",
                            alignment = "horizontal",
                            childs = skullElements
                        }
                    },
                    --{
                    --    options {
                    --        name = "skull_action",
                    --        alignment = "horizontal",
                    --        childs = {
                    --            {
                    --                button {
                    --                    name = "skull_settings",
                    --                    text = "SKULL SETTINGS",
                    --                    variant = "small"
                    --                },
                    --                backgroundX,
                    --                startingY + 203
                    --            }
                    --        }
                    --    }
                    --}
                }
            }
        },
        {
            bar {name = "skull_bar", orientation = "vertical", type = "scroll", size = 222},
            390,
            startingY + 5
        },
        {
            image {
                name = "skull_preview_background",
                bitmap = "insurrection/ui/bitmaps/skull_overlay.bitmap",
                width = 149,
                height = 144
            },
            backgroundX,
            startingY + 5
        },
        {
            image {
                name = "skull_preview_icon",
                bitmap = "insurrection/ui/bitmaps/skull_preview_icons.bitmap",
                width = 136,
                height = 178,
                scale = 0.45
            },
            backgroundX + 44,
            startingY + 15
        },
        {
            label {
                name = "skull_title",
                variant = "title",
                text = "CHOOSE SKULLS",
                justify = "left",
                width = 145
            },
            0,
            -6
        },
        {
            label {
                name = "skull_name",
                variant = "title",
                text = strmem(128, "SKULL NAME"),
                justify = "left",
                width = 145
            },
            backgroundX + 4,
            startingY + 127
        },
        {
            label {
                name = "skull_motto",
                variant = "button",
                text = strmem(256, "SKULL MOTTO"),
                color = "blueYonder",
                justify = "left",
                width = 145,
                height = 30
            },
            backgroundX + 4,
            startingY + 145
        },
        {
            label {
                name = "skull_description",
                variant = "subtitle",
                text = strmem(256, "SKULL DESCRIPTION"),
                color = "gray",
                justify = "left",
                width = 145,
                height = 35
            },
            backgroundX + 4,
            startingY + 176
        },
        {constants.components.version.path, pos.version.x, pos.version.y}
    }
}

local settingsLayout = widget.layout {alignment = "vertical", size = 24, x = 0, y = 0, margin = 2}
local lengthArrowforNumbers = -30

local skullsSettingsWrapperPath = wrapper {
    name = "skulls_settings_panel",
    isDebug = false,
    width = wrapperWidth,
    height = wrapperHeight,
    childs = {
        {
            options {
                name = "skulls_config",
                alignment = "vertical",
                childs = {
                    {checkbox {name = "ban_skull", text = "BAN SKULL"}, settingsLayout()},
                    {
                        checkbox {name = "permanent_skull", text = "PERMANENT SKULL"},
                        settingsLayout()
                    },
                    {
                        spinner {
                            name = "skull_multiplier",
                            text = "SKULL MULTIPLIER",
                            value = strmem(3, "X" .. "1"),
                            length = lengthArrowforNumbers
                        },
                        settingsLayout()
                    },
                    {
                        spinner {
                            name = "max_skull_stacks",
                            text = "MAX SKULL STACKS",
                            value = strmem(3, "1"),
                            length = lengthArrowforNumbers
                        },
                        settingsLayout()
                    }
                }
            }
        }
    }
}

local startingX = -5
local startingY = 15
local buttonSquareMargin = 4
local buttonSquareSize = 80 - buttonSquareMargin
local backgroundX = 314

local difficultyLayout = widget.layout {
    alignment = "horizontal",
    size = buttonSquareSize,
    x = startingX,
    y = startingY - 3,
    margin = 0
}

local firefightDifficultyMenuPath = wrapper {
    name = "firefight_difficulty_panel",
    width = 581,
    height = 258,
    childs = {
        {
            options {
                name = "difficulty_all",
                alignment = "horizontal",
                childs = {
                    {
                        buttonSquare {
                            name = "difficulty_easy",
                            justification = "center_justify",
                            variant = "small",
                            childs = {
                                {
                                    checkbox {
                                        name = "difficulty_easy",
                                        align = "left",
                                        transparent = true
                                    },
                                    9,
                                    57
                                },
                                {
                                    image {
                                        name = "difficulty_easy",
                                        bitmap = "insurrection/ui/bitmaps/difficulty_icons.bitmap",
                                        width = 270,
                                        height = 270,
                                        scale = 0.2
                                    },
                                    13,
                                    10
                                }
                            }
                        },
                        difficultyLayout()
                    },
                    {
                        buttonSquare {
                            name = "difficulty_normal",
                            justification = "center_justify",
                            variant = "small",
                            childs = {
                                {
                                    image {
                                        name = "difficulty_normal",
                                        bitmap = "insurrection/ui/bitmaps/difficulty_icons.bitmap",
                                        width = 270,
                                        height = 270,
                                        scale = 0.2
                                    },
                                    13,
                                    10
                                },
                                {
                                    checkbox {
                                        name = "difficulty_normal",
                                        align = "left",
                                        transparent = true
                                    },
                                    9,
                                    57
                                }
                            }
                        },
                        difficultyLayout()
                    },
                    {
                        buttonSquare {
                            name = "difficulty_hard",
                            justification = "center_justify",
                            variant = "small",
                            childs = {
                                {
                                    image {
                                        name = "difficulty_hard",
                                        bitmap = "insurrection/ui/bitmaps/difficulty_icons.bitmap",
                                        width = 270,
                                        height = 270,
                                        scale = 0.2
                                    },
                                    13,
                                    10
                                },
                                {
                                    checkbox {
                                        name = "difficulty_hard",
                                        align = "left",
                                        transparent = true
                                    },
                                    9,
                                    57
                                }
                            }
                        },
                        difficultyLayout()
                    },
                    {
                        buttonSquare {
                            name = "difficulty_impossible",
                            justification = "center_justify",
                            variant = "small",
                            childs = {
                                {
                                    image {
                                        name = "difficulty_impossible",
                                        bitmap = "insurrection/ui/bitmaps/difficulty_impossible_icon.bitmap",
                                        width = 270,
                                        height = 270,
                                        scale = 0.2
                                    },
                                    13,
                                    10
                                },
                                {
                                    checkbox {
                                        name = "difficulty_legendary",
                                        align = "left",
                                        transparent = true
                                    },
                                    9,
                                    57
                                }
                            }
                        },
                        difficultyLayout()
                    }
                }
            }
        },
        {
            image {
                name = "difficulty_preview_background",
                bitmap = "insurrection/ui/bitmaps/skull_overlay.bitmap",
                width = 149,
                height = 144
            },
            backgroundX,
            startingY + 2
        },
        {
            image {
                name = "difficulty_preview_icon",
                bitmap = "insurrection/ui/bitmaps/difficulty_icons.bitmap",
                width = 270,
                height = 270,
                scale = 0.4
            },
            backgroundX + 20,
            startingY + 12
        },
        {
            label {
                name = "difficulty_title",
                variant = "title",
                text = "SELECT DIFFICULTY",
                justify = "left",
                width = 145
            },
            0,
            -6
        },
        {
            label {
                name = "difficulty_name",
                variant = "title",
                text = strmem(128, "DIFFICULTY NAME"),
                justify = "left",
                width = 145
            },
            backgroundX + 4,
            startingY + 124
        },
        {
            footer {
                name = "difficulty_description",
                title = "DESCRIPTION",
                text = strmem(256, "This is the description area for the selected difficulty.")
            },
            0,
            124
        }
    }
}

widget.global(firefightDifficultyMenuPath, "insurrection/ui/custom_menus.tag_collection")
widget.global(firefightSettingsMenuPath, "insurrection/ui/custom_menus.tag_collection")
widget.global(skullsWrapperPath, "insurrection/ui/custom_menus.tag_collection")
widget.global(skullsSettingsWrapperPath, "insurrection/ui/custom_menus.tag_collection")

return firefightMenuPath
