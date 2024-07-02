local widget = require "lua.scripts.widget"
local constants = require "lua.scripts.ui.components.constants"
local wrapper = require "lua.scripts.ui.componentsV3.wrapper"
local preview = require "lua.scripts.ui.componentsV3.preview"
local bar = require "lua.scripts.ui.componentsV3.bar"
local buttonDashboard = require "lua.scripts.ui.componentsV3.buttonDashboard"
local footer          = require "lua.scripts.ui.componentsV3.footer"
local rankDashboard   = require "lua.scripts.ui.componentsV3.rankDashboard"
local pos = constants.position
local label = require "lua.scripts.ui.componentsV3.label"
local strmem = widget.strmem
local container = require "lua.scripts.ui.componentsV3.container"
local options = require "lua.scripts.ui.componentsV3.options"
local button = require "lua.scripts.ui.componentsV3.button"
local header = require "lua.scripts.ui.componentsV3.header"

widget.init [[insurrection/ui/menus/dashboard_new/]]

local borrowLayout = widget.layout {alignment = "horizontal", size = 24, x = 61, y = 310, margin = 2 }

return container {
    name = "dashboard_new_menu",
    background = "transparent",
    childs = {
        {
            header {
                name = "dashboard_new",
                title = strmem(256, "INSURRECTION - DASHBOARD"),
                subtitle = "PLAY WITH FRIENDS IN DIFFRENT GAME MODES"
            },
            pos.header.x,
            pos.header.y
        },
        {
            footer {
                name = "dashboard_new",
                title = "DASHBOARD",
                text = "Welcome to the dashboard!\r\nHere you can choose from different game modes from Insurrection services."
            },
            borrowLayout()
        },
        {
            rankDashboard {
                name = "rank_overlay_dashbard",
                variant = "overlay",
            },
            775,
            358
        },
        {
            rankDashboard {
                name = "rank_icon_dashbard",
                variant = "icon",
            },
            779,
            364
        },
        {
            bar {
                name = "rank_progress",
                orientation = "horizontal",
                type = "progress",
                size = 128
            },
            641,
            409
        },
        {
            options {
                name = "dashboard_new_buttons",
                alignment = "horizontal",
                childs = {
                    {
                        buttonDashboard {
                            name = "custom_prompt",
                            text = "CUSTOM",
                            variant = "custom"
                        },
                        60,
                        102
                    },
                    {
                        buttonDashboard {
                            name = "coop_prompt",
                            text = "COOP",
                            variant = "coop"
                        },
                        60,
                        198
                    },
                    {
                        buttonDashboard {
                            name = "forge_prompt",
                            text = "FORGE",
                            variant = "forge"
                        },
                        334,
                        102
                    },
                    {
                        buttonDashboard {
                            name = "firefight_prompt",
                            text = "FIREFIGHT",
                            variant = "firefight"
                        },
                        334,
                        198
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