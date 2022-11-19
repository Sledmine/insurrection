local widget = require "lua.scripts.widget"
local container = require "lua.scripts.ui.componentsV2.container"
local header = require "lua.scripts.ui.componentsV2.header"
local options = require "lua.scripts.ui.componentsV2.options"
local button = require "lua.scripts.ui.componentsV2.button"
local constants = require "lua.scripts.ui.components.constants"
local pos = constants.position

widget.init [[insurrection\ui\menus\pause\]]

local layout = widget.align("vertical", 24, pos.options.x, pos.options.y, 2)

return container("pause_menu", {
    {
        header("pause_menu", "PAUSE MENU", "GET BACK IN THE FIELD SPARTAN!"),
        pos.header.x,
        pos.header.y
    },
    {
        options("pause_menu_options", "vertical", {
            {button("resume_game", "RESUME GAME", {close = true}), layout()},
            {
                button("game_options", "GAME OPTIONS", {
                    opens = [[insurrection/ui/menus/pause/pause_game_options_menu.ui_widget_definition]]
                }),
                layout()
            },
            {
                button("settings", "SETTINGS", {
                    opens = [[insurrection\ui\menus\settings_menu\player_profile_edit_screen.ui_widget_definition]],
                    func = "profile_set_edit_begin",
                    branch = true
                }),
                layout()
            },
            {button("exit", "EXIT TO MAIN MENU", {func = "mp_game_player_quit"}), layout()}
        }, nil, {func = "mp_pause_menu_open"})
    },
    {[[insurrection\ui\shared\current_profile.ui_widget_definition]], 624, 20},
    {[[insurrection\ui\shared\version.ui_widget_definition]], 0, 460}
})
