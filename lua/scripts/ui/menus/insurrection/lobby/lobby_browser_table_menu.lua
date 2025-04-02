local widget = require "lua.scripts.widget"
local constants = require "lua.scripts.ui.components.constants"
local wrapper = require "lua.scripts.ui.componentsV3.wrapper"
local preview = require "lua.scripts.ui.componentsV3.preview"
local input = require "lua.scripts.ui.componentsV3.input"
local bar = require "lua.scripts.ui.componentsV3.bar"
local pos = constants.position
local label = require "lua.scripts.ui.componentsV3.label"
local strmem = widget.strmem
local container = require "lua.scripts.ui.componentsV3.container"
local options = require "lua.scripts.ui.componentsV3.options"
local button = require "lua.scripts.ui.componentsV3.button"
local header = require "lua.scripts.ui.componentsV3.header"
local buttonTable = require "lua.scripts.ui.componentsV3.buttonTable"
local complexButton = require "lua.scripts.ui.componentsV3.complexButton"

widget.init [[insurrection/ui/menus/lobby_browser_table/]]

local headersLayout = widget.layout {
    alignment = "horizontal",
    size = 104,
    x = 24,
    y = 125,
    margin = 0
}
local tableRowLayout = widget.layout {
    alignment = "vertical",
    size = 19,
    x = 20,
    y = 155,
    margin = 1
}
local optionsLayout = widget.layout {
    alignment = "horizontal",
    size = 149,
    x = 20,
    y = 416,
    margin = 2
}

local rows = {}
for i = 1, 8 do
    local justify = "left"
    local tableRowLabelLayout = widget.layout {
        alignment = "horizontal",
        size = 104,
        horizontal = 24,
        margin = 0,
        x = 8,
        y = -3
    }
    table.insert(rows, {
        buttonTable {
            name = "list_browser_row_button_" .. i,
            variant = "row",
            isClickable = true,
            childs = {
                {
                    label {
                        name = "owner_header_label_" .. i,
                        text = strmem(11, "OWNER"),
                        justify = justify,
                        width = 104
                    },
                    tableRowLabelLayout()
                },
                {
                    label {
                        name = "map_header_label_" .. i,
                        text = strmem(64, "MAP"),
                        justify = justify,
                        width = 104
                    },
                    tableRowLabelLayout()
                },
                {
                    label {
                        name = "gametype_header_label_" .. i,
                        text = strmem(32, "GAMETYPE"),
                        justify = justify,
                        width = 104
                    },
                    tableRowLabelLayout()
                },
                {
                    label {
                        name = "template_header_label_" .. i,
                        text = strmem(32, "TEMPLATE"),
                        justify = justify,
                        width = 104
                    },
                    tableRowLabelLayout()
                },
                {
                    label {
                        name = "players_header_label_" .. i,
                        text = "000",
                        justify = justify,
                        width = 104
                    },
                    tableRowLabelLayout()
                },
            }
        },
        tableRowLayout()
    })
end

return container {
    name = "lobby_browser_table_menu",
    background = "transparent",
    childs = {
        {
            header {
                name = "lobby_browser_table",
                title = strmem(256, "INSURRECTION - LOBBY BROWSER"),
                subtitle = "FIND A GAME TO JOIN"
            },
            pos.header.x,
            pos.header.y
        },
        {
            bar {
                name = "lobby_browser_table_scroll",
                orientation = "vertical",
                type = "scroll",
                size = 185
            },
            587,
            127
        },
        {
            preview {
                name = "lobby_browser_table_preview",
                bitmap = [[insurrection/ui/bitmaps/unknown_map_preview.bitmap]],
                variant = "small"
            },
            634,
            127
        },
        {
            label {
            name = "lobby_browser_table_map_name",
            text = strmem(32, "MAP NAME")
        },
        634,
        240
    },
        {
            label {
            name = "lobby_browser_table_author",
            text = strmem(32, "AUTHOR"),
            color = "blueYonder"
        },
        634,
        252
    },
        {
            label {
                name = "lobby_browser_table_map_description",
                text = strmem(256, "DESCRIPTION")
            },
            634,
            264
        },
        {
            options {
                name = "lobby_browser_table_header_list",
                alignment = "horizontal",
                childs = {
                    {buttonTable {name = "owner_header", text = "OWNER"}, headersLayout()},
                    {buttonTable {name = "map_header", text = "MAP"}, headersLayout()},
                    {buttonTable {name = "gametype_header", text = "GAMETYPE"}, headersLayout()},
                    {buttonTable {name = "template_header", text = "TEMPLATE"}, headersLayout()},
                    {buttonTable {name = "players_header", text = "PLAYERS"}, headersLayout()},
                    -- {
                    --    complexButton {
                    --        name = "host_game",
                    --        text = "HOST GAME",
                    --        variant = "horizontal_c_text"
                    --    },
                    --    20,
                    --    66
                    -- }
                    {
                        input {
                            name = "search_browser",
                            text = strmem(32),
                            variant = "small",
                            icon = [[insurrection/ui/bitmaps/search_icon.bitmap]]
                        },
                        20,
                        85
                    },
                    {
                        input {
                            name = "lobby_browser_table_key",
                            text = strmem(32, "Lobby Key"),
                            variant = "small",
                            icon = [[insurrection/ui/bitmaps/key_icon.bitmap]]
                        },
                        20,
                        330
                    }
                }
            }
        },
        {options {name = "lobby_browser_table_row_list", alignment = "vertical", childs = rows}},
        {
            options {
                name = "lobby_browser_table_options_list",
                alignment = "horizontal",
                childs = {
                    {
                        button {name = "back", text = "BACK", variant = "small", back = true},
                        optionsLayout()
                    },
                    -- {
                    --    button {name = "refresh", text = "REFRESH", variant = "small"},
                    --    optionsLayout()
                    -- },
                    -- {
                    --    button {name = "filters", text = "FILTERS", variant = "small"},
                    --    optionsLayout()
                    -- },
                    {
                        button {name = "join_game", text = "JOIN GAME", variant = "small"}, 
                        optionsLayout()
                        -- 685, 416
                    }
                }
            }
        },
        {constants.components.currentProfile.path, 641, 20},
        {constants.components.version.path, 0, 460}
    }
}
