local widget = require "lua.scripts.widget"
local constants = require "lua.scripts.ui.components.constants"
local wrapper = require "lua.scripts.ui.componentsV3.wrapper"
local preview = require "lua.scripts.ui.componentsV3.preview"
local bar = require "lua.scripts.ui.componentsV3.bar"
local buttonDashboard = require "lua.scripts.ui.componentsV3.buttonDashboard"
local footer          = require "lua.scripts.ui.componentsV3.footer"
local rankDashboard   = require "lua.scripts.ui.componentsV3.rankDashboard"
local buttonGames     = require "lua.scripts.ui.componentsV3.buttonGames"
local pos = constants.position
local rankLabel = require "lua.scripts.ui.componentsV3.rankLabel"
local strmem = widget.strmem
local container = require "lua.scripts.ui.componentsV3.container"
local options = require "lua.scripts.ui.componentsV3.options"
local button = require "lua.scripts.ui.componentsV3.button"
local header = require "lua.scripts.ui.componentsV3.header"

widget.init [[insurrection/ui/menus/dashboard_new/]]

local descriptionLayout = widget.layout {alignment = "horizontal", size = 24, x = 255, y = 355, margin = 2 }

return container {
    name = "games_menu",
    background = "transparent",
    childs = {
        {
            header {
                name = "games_menu",
                title = strmem(256, "$mode - $matchType"),
                subtitle = "PLAY WITH FRIENDS IN DIFFRENT GAME MODES"
            },
            pos.header.x,
            pos.header.y
        },
        {
            footer {
                name = "games_menu",
                title = "$projectName",
                text = "$description\r\n$author:",
                justify = "center"
            },
            descriptionLayout()
        },
        {
            bar {
                name = "scroll_bar",
                orientation = "horizontal",
                type = "scroll",
                size = 150
            },
            352,
            343
        },
        {
            options {
                name = "games_button",
                alignment = "horizontal",
                childs = {
                    {
                        buttonGames {
                            name = "stock",
                            text = "CLASSIC",
                            justification = "center_justify",
                            variant = "stock"
                        },
                        142,
                        105
                    },
                    {
                        buttonGames {
                            name = "the_flood",
                            text = "THE FLOOD",
                            justification = "center_justify",
                            variant = "the_flood"
                        },
                        282,
                        105
                    },
                    {
                        buttonGames {
                            name = "community",
                            text = "COMMUNITY PACK",
                            justification = "center_justify",
                            variant = "community"
                        },
                        422,
                        105
                    },
                    {
                        button {
                            name = "back",
                            text = "BACK",
                            variant = "normal",
                            back = true
                        },
                        20,
                        416
                    },
                }
            },
        },
        {constants.components.currentProfile.path, 641, 20},
        {constants.components.version.path, 0, 460},
    }
}