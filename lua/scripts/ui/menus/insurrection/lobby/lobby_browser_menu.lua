local widget = require "lua.scripts.widget"
local constants = require "lua.scripts.ui.components.constants"
local wrapper = require "lua.scripts.ui.componentsV3.wrapper"
local preview = require "lua.scripts.ui.componentsV3.preview"
local pos = constants.position
local label = require "lua.scripts.ui.componentsV3.label"
local strmem = widget.strmem
local container = require "lua.scripts.ui.componentsV3.container"
local options = require "lua.scripts.ui.componentsV3.options"
local button = require "lua.scripts.ui.componentsV3.button"
local header = require "lua.scripts.ui.componentsV3.header"
local complexButton = require "lua.scripts.ui.componentsV3.complexButton"
local slider = require "lua.scripts.ui.componentsV3.slider"

widget.init [[insurrection/ui/menus/lobby_browser/]]

local yPosList = 305
local layout = widget.align("horizontal", constants.components.complexButton.normal.width, 59,
                            yPosList, 2)

return container {
    name = "lobby_browser_menu",
    background = "transparent",
    childs = {
        {
            header {
                name = "lobby_browser",
                title = "LOBBY BROWSER",
                subtitle = "FIND AND JOIN CURRENT GAMES"
            },
            pos.header.x,
            pos.header.y
        },
        {
            options {
                name = "lobby_browser_list",
                alignment = "horizontal",
                childs = {
                    {slider {name = "lobby_browser_left", direction = "left"}, 122, 192},
                    {
                        wrapper {
                            name = "lobby_browser_item_1",
                            isClickable = true,
                            width = 269,
                            height = 165,
                            childs = {
                                {
                                    preview {
                                        name = "lobby_browser_item_1_map",
                                        bitmap = "insurrection/ui/bitmaps/unknown_map_preview.bitmap"
                                    },
                                    0,
                                    20
                                },
                                {
                                    label {
                                        name = "lobby_browser_item_1_template",
                                        text = strmem(32, "TEMPLATE")
                                    },
                                    5,
                                    0
                                },
                                {
                                    label {
                                        name = "lobby_browser_item_1_owner",
                                        text = strmem(64, "OWNER"),
                                        justify = "right",
                                        width = 259
                                    },
                                    5,
                                    17
                                },
                                {
                                    label {
                                        name = "lobby_browser_item_1_players",
                                        text = strmem(64, "PLAYERS")
                                    },
                                    5,
                                    149
                                },
                                {
                                    label {
                                        name = "lobby_browser_item_1_description",
                                        text = strmem(128, "DESCRIPTION"),
                                        justify = "right",
                                        width = 259
                                    },
                                    5,
                                    149
                                }
                            }
                        },
                        156,
                        70
                    },
                    {
                        wrapper {
                            name = "lobby_browser_item_2",
                            isClickable = true,
                            width = 269,
                            height = 165,
                            childs = {
                                {
                                    preview {
                                        name = "lobby_browser_item_2_map",
                                        bitmap = "insurrection/ui/bitmaps/unknown_map_preview.bitmap"
                                    },
                                    0,
                                    20
                                },
                                {
                                    label {
                                        name = "lobby_browser_item_2_template",
                                        text = strmem(32, "TEMPLATE")
                                    },
                                    5,
                                    0
                                },
                                {
                                    label {
                                        name = "lobby_browser_item_2_owner",
                                        text = strmem(64, "OWNER"),
                                        justify = "right",
                                        width = 259
                                    },
                                    5,
                                    17
                                },
                                {
                                    label {
                                        name = "lobby_browser_item_2_players",
                                        text = strmem(64, "PLAYERS")
                                    },
                                    5,
                                    149
                                },
                                {
                                    label {
                                        name = "lobby_browser_item_2_description",
                                        text = strmem(128, "DESCRIPTION"),
                                        justify = "right",
                                        width = 259
                                    },
                                    5,
                                    149
                                }
                            }
                        },
                        434,
                        70
                    },
                    {
                        wrapper {
                            name = "lobby_browser_item_3",
                            isClickable = true,
                            width = 269,
                            height = 165,
                            childs = {
                                {
                                    preview {
                                        name = "lobby_browser_item_3_map",
                                        bitmap = "insurrection/ui/bitmaps/unknown_map_preview.bitmap"
                                    },
                                    0,
                                    20
                                },
                                {
                                    label {
                                        name = "lobby_browser_item_3_template",
                                        text = strmem(32, "TEMPLATE")
                                    },
                                    5,
                                    0
                                },
                                {
                                    label {
                                        name = "lobby_browser_item_3_owner",
                                        text = strmem(64, "OWNER"),
                                        justify = "right",
                                        width = 259
                                    },
                                    5,
                                    17
                                },
                                {
                                    label {
                                        name = "lobby_browser_item_3_players",
                                        text = strmem(64, "PLAYERS")
                                    },
                                    5,
                                    149
                                },
                                {
                                    label {
                                        name = "lobby_browser_item_3_description",
                                        text = strmem(128, "DESCRIPTION"),
                                        justify = "right",
                                        width = 259
                                    },
                                    5,
                                    149
                                }
                            }
                        },
                        156,
                        236
                    },
                    {
                        wrapper {
                            name = "lobby_browser_item_4",
                            isClickable = true,
                            width = 269,
                            height = 165,
                            childs = {
                                {
                                    preview {
                                        name = "lobby_browser_item_4_map",
                                        bitmap = "insurrection/ui/bitmaps/unknown_map_preview.bitmap"
                                    },
                                    0,
                                    20
                                },
                                {
                                    label {
                                        name = "lobby_browser_item_4_template",
                                        text = strmem(32, "TEMPLATE")
                                    },
                                    5,
                                    0
                                },
                                {
                                    label {
                                        name = "lobby_browser_item_4_owner",
                                        text = strmem(64, "OWNER"),
                                        justify = "right",
                                        width = 259
                                    },
                                    5,
                                    17
                                },
                                {
                                    label {
                                        name = "lobby_browser_item_4_players",
                                        text = strmem(64, "PLAYERS")
                                    },
                                    5,
                                    149
                                },
                                {
                                    label {
                                        name = "lobby_browser_item_4_description",
                                        text = strmem(128, "DESCRIPTION"),
                                        justify = "right",
                                        width = 259
                                    },
                                    5,
                                    149
                                }
                            }
                        },
                        434,
                        236
                    },
                    {slider {name = "lobby_browser_right", direction = "right"}, 717, 192},
                    {
                        options {
                            name = "lobby_browser_actions",
                            layout = "horizontal",
                            childs = {
                                {
                                    button {name = "back", text = "BACK", back = true},
                                    pos.back.x,
                                    pos.back.y
                                }
                            }
                        }
                    }
                }
            }
        },
        {constants.components.currentProfile.path, 624, 20},
        {constants.components.version.path, 0, 460}
    }
}
