local widget = require "lua.scripts.widget"
local pos = constants.position
local constants = require "lua.scripts.ui.components.constants"
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
    size = 144,
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
    size = 184,
    x = 20,
    y = 416,
    margin = 6
}

return container {
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
                                        text = strmem(257, "MAP")
                                    },
                                    defsLayout()
                                },
                                {
                                    complexButton {
                                        name = "definition_gametype",
                                        variant = "horizontal",
                                        text = strmem(257, "GAMETYPE")
                                    },
                                    defsLayout()
                                },
                                {
                                    complexButton {
                                        name = "definition_template",
                                        variant = "horizontal",
                                        text = strmem(257, "TEMPLATE")
                                    },
                                    defsLayout()
                                },
                                {
                                    complexButton {
                                        name = "definition_skulls",
                                        variant = "horizontal_small",
                                        text = strmem(257, "SKULLS")
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
                        140
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
                                {slider {name = "elements_right", direction = "right"}}
                            }
                        },
                        pos.options.x,
                        170
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
        }
    },
    {
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
                                bitmap = "insurrection/ui/bitmaps/unknown_map_preview.bitmap"
                            },
                            190,
                            1
                        }
                    }
                }
            }
        }
    }
}
