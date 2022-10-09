local widget = require "lua.scripts.widget"
local container = require "lua.scripts.ui.componentsV2.container"
local options = require "lua.scripts.ui.componentsV2.options"
local button = require "lua.scripts.ui.componentsV2.button"
local constants = require "lua.scripts.ui.components.constants"
local pos = constants.position

widget.init [[insurrection\ui\menus\main\]]

local layout = widget.align("vertical", 24, 40, 266, 2)

return container("main_menu", {
    {
        [[insurrection\ui\shared\halo_custom_edition_logo.ui_widget_definition]],
        pos.logo.x,
        pos.logo.y
    },
    {
        options("main_menu_options", "vertical", {
            {
                button("singleplayer", "SINGLEPLAYER", {
                    opens = [[insurrection/ui/menus/singleplayer/singleplayer_menu.ui_widget_definition]]
                }),
                layout()
            },
            {
                button("multiplayer", "MULTIPLAYER", {
                    opens = [[insurrection\ui\main_menu\menu_options\multiplayer_menu\multiplayer_menu.ui_widget_definition]]
                }),
                layout()
            },
            {
                button("insurrection", "INSURRECTION", {
                    opens = [[insurrection\ui\menus\insurrection_login\insurrection_login_menu.ui_widget_definition]]
                }),
                layout()
            },
            {
                button("profiles", "PROFILES", {
                    opens = [[ui\shell\main_menu\profile_manager\player_profile_manager.ui_widget_definition]],
                    func = "new_game_if_no_plyr_profiles"
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
            {button("credits", "CREDITS"), layout()},
            {button("exit", "EXIT GAME", {func = "main_menu_quit_game"}), layout()}
        })
    },
    {[[insurrection\ui\shared\current_profile.ui_widget_definition]], 624, 20},
    {[[insurrection\ui\shared\version.ui_widget_definition]], 0, 460}
}, {script = "set_ui_background"})
