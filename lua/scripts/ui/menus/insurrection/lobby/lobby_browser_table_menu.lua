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
local buttonTable = require "lua.scripts.ui.componentsV3.buttonTable"

widget.init [[insurrection/ui/menus/lobby_browser_table/]]

local headersLayout = widget.align("horizontal", 104, 39, 118, 4)

return container {
    name = "lobby_browser_table_menu",
    background = "transparent",
    childs = {
        {
            header {
                name = "lobby_browser_table",
                title = strmem(256, "Insurrection - Ranked - Lobby Browser"),
                subtitle = "sub_string_test"
            },
            pos.header.x,
            pos.header.y
        },
        {
            options {
                name = "lobby_browser_table_list",
                alignment = "horizontal",
                childs = {
                    {
                        buttonTable {
                            name = "test_button",
                        },
                        headersLayout()
                    },
                    {
                        buttonTable {
                            name = "test_button_2",
                        },
                        headersLayout()
                    }
                }
            }
        }
    }
}