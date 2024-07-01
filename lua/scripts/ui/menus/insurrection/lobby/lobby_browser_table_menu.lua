local widget = require "lua.scripts.widget"
local constants = require "lua.scripts.ui.components.constants"
local wrapper = require "lua.scripts.ui.componentsV3.wrapper"
local preview = require "lua.scripts.ui.componentsV3.preview"
local bar     = require "lua.scripts.ui.componentsV3.bar"
local pos = constants.position
local label = require "lua.scripts.ui.componentsV3.label"
local strmem = widget.strmem
local container = require "lua.scripts.ui.componentsV3.container"
local options = require "lua.scripts.ui.componentsV3.options"
local button = require "lua.scripts.ui.componentsV3.button"
local header = require "lua.scripts.ui.componentsV3.header"
local complexButton = require "lua.scripts.ui.componentsV3.complexButton"
local slider = require "lua.scripts.ui.componentsV3.slider"
local buttonTable = require "lua.scripts.ui.componentsV3.buttonTable"

widget.init [[insurrection/ui/menus/lobby_browser_table/]]

local headersLayout = widget.align("horizontal", 104, 37, 118, 0)
local tableRowLayout = widget.layout{alignment = "vertical", size = 19, x = 33, y = 146, margin = 1}

local rows = {}
for i = 1, 8 do
    table.insert(rows, {
        buttonTable {
            name = "list_browser_row_button_" .. i,
            variant = "row"
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
                title = strmem(256, "$ - $ - LOBBY BROWSER"),
                subtitle = "sub_string_test"
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
            588,
            118
        },
        {
            preview {
                name = "lobby_browser_table_preview",
                bitmap = [[insurrection/ui/bitmaps/unknown_map_preview.bitmap]]
            },
            621,
            118
        },
        {
            options {
                name = "lobby_browser_table_header_list",
                alignment = "horizontal",
                childs = {
                    {
                        buttonTable {
                            name = "owner_header",
                            text = "OWNER"
                        },
                        headersLayout()
                    },
                    {
                        buttonTable {
                            name = "map_header",
                            text = "MAP"
                        },
                        headersLayout()
                    },
                    {
                        buttonTable {
                            name = "gametype_header",
                            text = "GAMETYPE"
                        },
                        headersLayout()
                    },
                    {
                        buttonTable {
                            name = "players_header",
                            text = "PLAYERS"
                        },
                        headersLayout()
                    },
                    {
                        buttonTable {
                            name = "ping_header",
                            text = "PING"
                        },
                        headersLayout()
                    }
                }
            }
        },
        {
            options {
                name = "lobby_browser_table_row_list",
                alignment = "vertical",
                childs = rows
            }
        }
    }
}