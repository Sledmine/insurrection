local widget = require "lua.scripts.widget"
local container = require "lua.scripts.ui.componentsV2.container"
local header = require "lua.scripts.ui.componentsV2.header"
local options = require "lua.scripts.ui.componentsV2.options"
local button = require "lua.scripts.ui.componentsV2.button"
local complexButton = require "lua.scripts.ui.componentsV2.complexButton"
local constants = require "lua.scripts.ui.components.constants"
local pos = constants.position

widget.init [[insurrection\ui\menus\pause\]]

local layout = widget.align("horizontal", constants.components.complexButton.vertical.width, 284,
                            162, 2)

return container("pause_choose_team_menu", {
    {
        header("pause_choose_team_menu", "CHOOSE TEAM", "CHOOSE SIDE IN TEAM TO FIGHT FOR"),
        pos.header.x,
        pos.header.y
    },
    {[[insurrection\ui\shared\void.ui_widget_definition]]},
    {
        options("pause_choose_team", "horizontal", {
            {
                complexButton("blue_team", "BLUE TEAM", nil,
                              {variant = "vertical", func = "mp_choose_team", close = true, icon = [[insurrection/ui/bitmaps/keagle_icon.bitmap]]}),
                layout()
            },
            {
                complexButton("red_team", "RED TEAM", nil,
                              {variant = "vertical", func = "mp_choose_team", close = true, icon = [[insurrection/ui/bitmaps/ksnake_icon.bitmap]]}),
                layout()
            },
            {button("back", "BACK", {back = true}), pos.back.x, pos.back.y}
        })
    },
    {[[insurrection\ui\shared\current_profile.ui_widget_definition]], 624, 20},
    {[[insurrection\ui\shared\version.ui_widget_definition]], 0, 460}
})
