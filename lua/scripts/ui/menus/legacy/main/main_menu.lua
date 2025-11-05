local widget = require "lua.scripts.widget"
local container = require "lua.scripts.ui.componentsV3.container"
local options = require "lua.scripts.ui.componentsV3.options"
local button = require "lua.scripts.ui.componentsV3.button"
local constants = require "lua.scripts.ui.components.constants"
local nameplate = require "lua.scripts.ui.componentsV3.nameplate"
local pos = constants.position

--widget.init [[insurrection/ui/shared/current_profile/]]
--local nameplatePath = nameplate {name = "current_profile", properties = nil, options = {profile = true}}

widget.init [[insurrection/ui/menus/main/]]

local layout3 = widget.align("vertical", 24, 40, 240, 2)

local layout = widget.layout {
    alignment = "vertical",
    size = 24,
    x = 40,
    y = 240,
    margin = 2
}


return container {
    name = "main_menu",
    background = "transparent",
    script = "set_ui_background",
    childs = {
        {
            [[insurrection/ui/shared/halo_custom_edition_logo.ui_widget_definition]],
            pos.logo.x,
            pos.logo.y
        },
        {
            options {
                name = "main_menu_options",
                alignment = "vertical",
                childs = {
                    {
                        button {
                            name = "singleplayer",
                            text = "SINGLEPLAYER",
                            opens = [[insurrection/ui/menus/singleplayer/singleplayer_menu.ui_widget_definition]]
                        },
                        layout()
                    },
                    {
                        button {
                            name = "firefight",
                            text = "FIREFIGHT",
                            opens = [[insurrection/ui/menus/firefight/firefight_menu.ui_widget_definition]]
                        },
                        layout()
                    },
                    {
                        button {
                            name = "insurrection",
                            text = "INSURRECTION",
                            opens = [[insurrection/ui/menus/login/login_menu.ui_widget_definition]]
                        },
                        layout()
                    },
                    {
                        button {
                            name = "multiplayer",
                            text = "LEGACY MULTIPLAYER",
                            opens = [[insurrection/ui/menus/multiplayer/multiplayer_menu.ui_widget_definition]]
                        },
                        layout()
                    },
                    {
                        button {
                            name = "settings",
                            text = "SETTINGS",
                            opens = [[insurrection/ui/menus/settings_custom/settings_menu_custom.ui_widget_definition]]
                        },
                        layout()
                    },
                    --{
                    --    button {
                    --        name = "mods",
                    --        text = "MODS",
                    --        opens = [[insurrection/ui/menus/mods/mods_menu.ui_widget_definition]]
                    --    },
                    --    layout()
                    --},
                    --{
                    --    button {
                    --        name = "profiles",
                    --        text = "PROFILES",
                    --        properties = {
                    --            opens = [[ui/shell/main_menu/profile_manager/player_profile_manager.ui_widget_definition]],
                    --            func = "new_game_if_no_plyr_profiles"
                    --        }
                    --    },
                    --    layout()
                    --},
                    {
                        button {
                            name = "exit",
                            text = "EXIT GAME",
                            func = "main_menu_quit_game"
                        },
                        layout()
                    }
                }
            },
        },
        {constants.components.currentProfile.path, pos.nameplate.x, pos.nameplate.y},
        {constants.components.version.path, pos.version.x, pos.version.y},
    }
}