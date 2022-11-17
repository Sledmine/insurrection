local widget = require "lua.scripts.widget"
local container = require "lua.scripts.ui.componentsV2.container"
local header = require "lua.scripts.ui.componentsV2.header"
local options = require "lua.scripts.ui.componentsV2.options"
local button = require "lua.scripts.ui.componentsV2.button"
local constants = require "lua.scripts.ui.components.constants"
local pos = constants.position

widget.init [[insurrection\ui\menus\pause\]]

local layout = widget.align("vertical", 24, pos.options.x, pos.options.y, 2)

return container("pause_choose_team_menu", {
    {
        header("pause_game_options_menu", "CHOOSE TEAM", "CHOOSE SIDE IN TEAM TO FIGHT FOR"),
        pos.header.x,
        pos.header.y
    },
    {[[insurrection\ui\shared\void.ui_widget_definition]]},
    {
        options("pause_choose_team", "vertical", {
            {
                button("blue_team", "BLUE TEAM",
                       {func = "mp_choose_team", close = true, script = "menu_blur_off"}),
                layout()
            },
            {
                button("red_team", "RED TEAM",
                       {func = "mp_choose_team", close = true, script = "menu_blur_off"}),
                layout()
            },
            {button("back", "BACK", {back = true}), layout()}
        }, nil, {func = "mp_game_options_open"})
    },
    {[[insurrection\ui\shared\current_profile.ui_widget_definition]], 624, 20},
    {[[insurrection\ui\shared\version.ui_widget_definition]], 0, 460}
})
