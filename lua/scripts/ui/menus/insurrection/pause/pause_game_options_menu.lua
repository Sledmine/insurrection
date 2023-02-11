local widget = require "lua.scripts.widget"
local container = require "lua.scripts.ui.componentsV2.container"
local header = require "lua.scripts.ui.componentsV2.header"
local options = require "lua.scripts.ui.componentsV2.options"
local button = require "lua.scripts.ui.componentsV2.button"
local constants = require "lua.scripts.ui.components.constants"
local pos = constants.position

widget.init [[insurrection/ui/menus/pause/]]

local layout = widget.align("vertical", 24, pos.options.x, pos.options.y, 2)

return container("pause_game_options_menu", {
    {
        header("pause_game_options_menu", "GAME OPTIONS", "SELECT AND CUSTOMIZE SOME GAME OPTIONS"),
        pos.header.x,
        pos.header.y
    },
    {
        options("pause_game_options", "vertical", {
            {
                button("choose_team", "CHOOSE TEAM", {
                    opens = [[insurrection/ui/menus/pause/pause_choose_team_menu.ui_widget_definition]]
                }),
                layout()
            },
            {[[insurrection/ui/shared/void.ui_widget_definition]]},
            {[[insurrection/ui/shared/void.ui_widget_definition]]},
            {button("back", "BACK", {back = true}), layout()}
        }, nil, {func = "mp_game_options_open"})
    },
    {[[insurrection/ui/shared/current_profile/buttons/nameplate_current_profile.ui_widget_definition]], 624, 20},
    {[[insurrection/ui/shared/version.ui_widget_definition]], 0, 460}
})

