local widget = require "lua.scripts.widget"
local container = require "lua.scripts.ui.componentsV3.container"
local header = require "lua.scripts.ui.componentsV3.header"
local options = require "lua.scripts.ui.componentsV3.options"
local button = require "lua.scripts.ui.componentsV3.button"
local constants = require "lua.scripts.ui.components.constants"
local pos = constants.position

widget.init [[insurrection\ui\menus\pause\]]

local layout = widget.align("vertical", 24, pos.options.x, pos.options.y, 2)

local containerPauseMenu  container {
    name = "pause_menu",
    background = "transparent",
    childs = {
        {
            header {
                name = "pause_menu",
                title = "PAUSE MENU",
                subtitle = "GET BACK IN THE FIELD SPARTAN!"
            },
            pos.header.x,
            pos.header.y
        },
        {
            options {
                name = "pause_menu_options",
                layout = "vertical",
                func = "mp_pause_menu_open",
                description = nil,
                childs ={
                    {
                        button {
                            name = "resume_game",
                            text = "RESUME GAME",
                            close = true
                        },
                        layout()
                    },
                    {
                        button {
                            name = "game_options",
                            text = "GAME OPTIONS",
                            opens =  [[insurrection/ui/menus/pause/pause_game_options_menu.ui_widget_definition]]
                        },
                        layout()
                    },
                    {
                        button {
                            name = "settings",
                            text = "SETTINGS",
                            opens = [[insurrection/ui/menus/settings/settings_menu.ui_widget_definition]],
                            func = "profile_set_edit_begin",
                            branch = true
                        },
                        layout()
                    },
                    {
                        button {
                            name = "mods",
                            text = "MODS",
                            opens = [[insurrection/ui/menus/mods/mods_menu.ui_widget_definition]]
                        },
                        layout()
                    },
                    {
                        button {
                            name = "open_map_pause",
                            text = "MAP MENU"
                        },
                        layout()
                    },
                    {
                        button {
                            name ="exit",
                            text = "EXIT TO MAIN MENU",
                            func = "mp_game_player_quit"
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

return containerPauseMenu
