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

widget.init [[insurrection/ui/menus/lobby/]]

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
    x = 0,
    y = 0,
    margin = 2
}

local nameplatesLayout = widget.layout {
    alignment = "vertical",
    size = 28,
    x = 641,
    y = 20,
    margin = 2
}

local actionsLayout = widget.layout {
    alignment = "horizontal",
    size = 149,
    x = 20,
    y = 416,
    margin = 2
}

local lobbyMenuPath = container {
    name = "lobby_menu",
    background = "transparent",
    childs = {
        {
            header {
                name = "lobby_menu",
                title = strmem(256, " MY LOBBY"),
                subtitle = "INVITE FRIENDS TO YOUR LOBBY, CHOOSE YOUR SERVER TYPE, SET YOUR RULES AND HAVE FUN!"
            },
            pos.header.x,
            pos.header.y
        },
        {
            options {
                name = "lobby",
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
                                        name = "definition_gametype",
                                        variant = "horizontal",
                                        label = "GAMETYPE",
                                        text = strmem(64)
                                    },
                                    defsLayout()
                                },
                                {
                                    complexButton {
                                        name = "definition_template",
                                        variant = "horizontal",
                                        label = "TEMPLATE",
                                        text = strmem(64)
                                    },
                                    defsLayout()
                                },
                                {
                                    complexButton {
                                        name = "definition_skulls",
                                        variant = "horizontal_small",
                                        label = "SKULLS",
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
                        110
                    },
                    {
                        options {
                            name = "elements",
                            alignment = "horizontal",
                            width = 530,
                            height = 110,
                            childs = {
                                {slider {name = "elements_left", direction = "left"}},
                                {
                                    complexButton {
                                        name = "element_1",
                                        text = strmem(32),
                                        variant = "normal",
                                        icon = "insurrection/ui/bitmaps/lobby_gametype_icon.bitmap"
                                    },
                                    elementsLayout()
                                },
                                {
                                    complexButton {
                                        name = "element_2",
                                        text = strmem(32),
                                        variant = "normal",
                                        icon = "insurrection/ui/bitmaps/lobby_gametype_icon.bitmap"
                                    },
                                    elementsLayout()
                                },
                                {
                                    complexButton {
                                        name = "element_3",
                                        text = strmem(32),
                                        variant = "normal",
                                        icon = "insurrection/ui/bitmaps/lobby_gametype_icon.bitmap"
                                    },
                                    elementsLayout()
                                },
                                {
                                    complexButton {
                                        name = "element_4",
                                        text = strmem(32),
                                        variant = "normal",
                                        icon = "insurrection/ui/bitmaps/lobby_gametype_icon.bitmap"
                                    },
                                    elementsLayout()
                                },
                                {
                                    slider {name = "elements_right", direction = "right"},
                                    elementsLayout(2)
                                }
                            }
                        },
                        pos.options.x,
                        140
                    },
                    {checkbox {name = "make_public", text = "Public Lobby"}, pos.options.x, 371},
                    {
                        input {
                            name = "lobby_key",
                            text = strmem(512, "Lobby Key"),
                            variant = "small",
                            icon = "insurrection/ui/bitmaps/copy_icon.bitmap"
                        },
                        pos.options.x + constants.components.button.normal.width + 7,
                        371
                    },
                    {
                        button {name = "back", text = "BACK", variant = "small", back = true},
                        actionsLayout()
                    },
                    {button {name = "play", text = "PLAY", variant = "small"}, actionsLayout()}
                }
            }
        },
        {footer {name = "summary", title = "SUMMARY", text = strmem(256)}, pos.footer.x, 335},
        {
            box {
                name = "players",
                childs = {
                    {nameplate {name = "nameplate_1", text = strmem(64)}, nameplatesLayout()},
                    {nameplate {name = "nameplate_2", text = strmem(64)}, nameplatesLayout()},
                    {nameplate {name = "nameplate_3", text = strmem(64)}, nameplatesLayout()},
                    {nameplate {name = "nameplate_4", text = strmem(64)}, nameplatesLayout()},
                    {nameplate {name = "nameplate_5", text = strmem(64)}, nameplatesLayout()},
                    {nameplate {name = "nameplate_6", text = strmem(64)}, nameplatesLayout()},
                    {nameplate {name = "nameplate_7", text = strmem(64)}, nameplatesLayout()},
                    {nameplate {name = "nameplate_8", text = strmem(64)}, nameplatesLayout()},
                    {nameplate {name = "nameplate_9", text = strmem(64)}, nameplatesLayout()},
                    {nameplate {name = "nameplate_10", text = strmem(64)}, nameplatesLayout()},
                    {nameplate {name = "nameplate_11", text = strmem(64)}, nameplatesLayout()},
                    {nameplate {name = "nameplate_12", text = strmem(64)}, nameplatesLayout()},
                    {nameplate {name = "nameplate_13", text = strmem(64)}, nameplatesLayout()},
                    {nameplate {name = "nameplate_14", text = strmem(64)}, nameplatesLayout()},
                    {nameplate {name = "nameplate_15", text = strmem(64)}, nameplatesLayout()},
                    {nameplate {name = "nameplate_16", text = strmem(64)}, nameplatesLayout()}
                }
            }
        },
        {constants.components.version.path, 0, 460}
    },
    conditionalWidgets = {
        {
            widget_tag = wrapper {
                name = "lobby_maps",
                width = 465,
                height = 160,
                childs = {
                    {
                        options {
                            name = "lobby_maps",
                            alignment = "vertical",
                            width = 465,
                            height = 160,
                            childs = {
                                {
                                    button {name = "scroll_map_list_up", arrow = "up"},
                                    elementsLayoutVertical()
                                },
                                {
                                    button {
                                        name = "element_map_1",
                                        text = strmem(32),
                                        variant = "normal"
                                    },
                                    elementsLayoutVertical()
                                },
                                {
                                    button {
                                        name = "element_map_2",
                                        text = strmem(32),
                                        variant = "normal"
                                    },
                                    elementsLayoutVertical()
                                },
                                {
                                    button {
                                        name = "element_map_3",
                                        text = strmem(32),
                                        variant = "normal"
                                    },
                                    elementsLayoutVertical()
                                },
                                {
                                    button {
                                        name = "element_map_4",
                                        text = strmem(32),
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
                        240,
                        1
                    },
                    {label {name = "map_name", text = strmem(32, "MAP NAME")}, 240, 113},
                    {
                        label {
                            name = "map_author",
                            text = strmem(32, "AUTHOR"),
                            color = "blueYonder"
                        },
                        240,
                        125
                    },
                    {
                        label {
                            name = "map_description",
                            text = strmem(64, "MAP DESCRIPTION"),
                            height = 200
                        },
                        240,
                        137
                    }
                }
            }
        }
    }
}

local wrapperWidth = 570
local wrapperHeight = 247
local startingX = 0
local startingY = 20
local buttonSquareMargin = 4
local buttonSquareSize = 80 - buttonSquareMargin
local rowsCount = 3
local columnsCount = 5
local skullsCount = rowsCount * columnsCount
local skullsPositions = {}

for rowIndex = 1, rowsCount do
    for columnIndex = 1, columnsCount do
        local layout = widget.layout {
            alignment = "horizontal",
            size = buttonSquareSize,
            x = startingX + (columnIndex - 1) * buttonSquareSize,
            y = startingY + (rowIndex - 1) * buttonSquareSize,
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
                        scale = 0.375
                    },
                    16,
                    16
                },
                {checkbox {name = "skull_" .. i, align = "left", transparent = true}, 4, 52}
            }
        },
        table.unpack(skullsPositions[i])
    })
end

local skullsWrapperPath = wrapper {
    name = "skulls_panel",
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
                    {
                        options {
                            name = "skull_action",
                            alignment = "horizontal",
                            childs = {
                                {
                                    button {
                                        name = "skull_settings",
                                        text = "SKULL SETTINGS",
                                        variant = "small"
                                    },
                                    410,
                                    startingY + 195
                                }
                            }
                        }
                    }
                }
            }
        },
        {
            bar {name = "skull_bar", orientation = "vertical", type = "scroll", size = 222},
            390,
            startingY
        },
        {
            image {
                name = "skull_preview_background",
                bitmap = "insurrection/ui/bitmaps/skull_overlay.bitmap",
                width = 149,
                height = 144
            },
            410,
            startingY
        },
        {
            image {
                name = "skull_preview_icon",
                bitmap = "insurrection/ui/bitmaps/skull_preview_icons.bitmap",
                width = 136,
                height = 178,
                scale = 0.45
            },
            453,
            startingY + 10
        },
        {
            label {
                name = "skull_title",
                variant = "title",
                text = "CHOOSE SKULLS",
                justify = "left",
                width = 145
            },
            4,
            0
        },
        {
            label {
                name = "skull_name",
                variant = "title",
                text = strmem(128, "SKULL NAME"),
                justify = "left",
                width = 145
            },
            414,
            startingY + 120
        },
        {
            label {
                name = "skull_motto",
                variant = "button",
                text = strmem(256, "SKULL MOTTO"),
                color = "blueYonder",
                justify = "left",
                width = 145
            },
            414,
            startingY + 140
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
            414,
            180
        },
        {constants.components.version.path, 0, 460}
    }
}

widget.global(skullsWrapperPath, "insurrection/ui/custom_menus.tag_collection")

return lobbyMenuPath
