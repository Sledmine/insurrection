local widget = require "lua.scripts.widget"
local container = require "lua.scripts.ui.componentsV3.container"
local header = require "lua.scripts.ui.componentsV3.header"
local options = require "lua.scripts.ui.componentsV3.options"

local button = require "lua.scripts.ui.componentsV3.button"

local constants = require "lua.scripts.ui.components.constants"
local pos = constants.position

widget.init [[insurrection/ui/menus/pause/]]

local layout = widget.align("vertical", 24, pos.options.x, pos.options.y, 2)

local containerPauseGameOptionsMenu container {
    name = "pause_game_options_menu",
    background = "transparent",
    childs = {
        {
            header {
                name = "pause_game_options_menu",
                title = "GAME OPTIONS",
                subtitle = "SELECT AND CUSTOMIZE SOME GAME OPTIONS"
            },
            pos.header.x,
            pos.header.y
        },
        {
            options {
                name ="pause_game_options",
                layout = "vertical",
                description = nil,
                func = "mp_game_options_open",
                childs = {
                    {
                        button {
                             name ="choose_team",
                             text ="CHOOSE TEAM",
                             opens =  [[insurrection/ui/menus/pause/pause_choose_team_menu.ui_widget_definition]]
                         },
                         layout()
                    },
                    {[[insurrection/ui/shared/void.ui_widget_definition]]},
                    {[[insurrection/ui/shared/void.ui_widget_definition]]},
                    {
                        button {
                            name ="back",
                            text ="BACK",
                            back= true
                        },
                        layout()
                    }
                }
            }
        },
        {constants.components.currentProfile.path, 624, 20},
        {constants.components.version.path, 0, 460}
    }
}

return containerPauseGameOptionsMenu

