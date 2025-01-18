local widget = require "lua.scripts.widget"
local container = require "lua.scripts.ui.componentsV3.container"
local header = require "lua.scripts.ui.componentsV3.header"
local options = require "lua.scripts.ui.componentsV3.options"
local button = require "lua.scripts.ui.componentsV3.button"
local complexButton = require "lua.scripts.ui.componentsV3.complexButton"
local constants = require "lua.scripts.ui.components.constants"
local pos = constants.position

widget.init [[insurrection\ui\menus\pause\]]

local layout = widget.align("horizontal", constants.components.complexButton.vertical.width, 284, 162, 2)


local containerPauseChooseTeamMenu container {
    name = "pause_choose_team_menu",
    background ="transparent",
    childs = {
         {
            header {
                name ="pause_choose_team_menu",
                title = "CHOOSE TEAM",
                subtitle = "CHOOSE SIDE IN TEAM TO FIGHT FOR"
            },
            pos.header.x,
            pos.header.y
         },
          {[[insurrection\ui\shared\void.ui_widget_definition]]},
          {
            options {
            name = "pause_choose_team",
            layout ="horizontal",
            childs = {
                {
                    complexButton{
                        name = "blue_team",
                        text = "BLUE TEAM",
                        label = nil,
                        variant = "vertical",
                        func = "mp_choose_team",
                        close = true,
                        icon =  [[insurrection/ui/bitmaps/keagle_icon.bitmap]]
                    },
                    layout()
                },
                {
                    complexButton {
                        name = "red_team",
                        text = "RED TEAM",
                        label = nil,
                        variant = "vertical",
                        func = "mp_choose_team",
                        close= true,
                        icon =  [[insurrection/ui/bitmaps/ksnake_icon.bitmap]]
                    },
                     layout()
                },
                {
                    button {
                        name = "back",
                        text ="BACK",
                        back = true
                    },
                     pos.back.x,
                     pos.back.y
                }
              }
            }
          },
          {constants.components.currentProfile.path, 624, 20},
          {constants.components.version.path, 0, 460}
    }
}

return containerPauseChooseTeamMenu