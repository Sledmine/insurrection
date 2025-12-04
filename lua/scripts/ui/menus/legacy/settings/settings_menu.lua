local widget = require "lua.scripts.widget"
local strmem = widget.strmem
local constants = require "lua.scripts.ui.components.constants"
local container = require "lua.scripts.ui.componentsV3.container"
local header = require "lua.scripts.ui.componentsV3.header"
local options = require "lua.scripts.ui.componentsV3.options"
local button = require "lua.scripts.ui.componentsV3.button"
local footer = require "lua.scripts.ui.componentsV3.footer"
local description = require "lua.scripts.ui.componentsV2.description"
local pos = constants.position

widget.init "insurrection/ui/menus/settings/"

local layout = widget.layout {
    alignment = "vertical",
    size = 24,
    x = pos.options.x,
    y = pos.options.y,
    margin = 2
}

local name = "settings_menu"

return container {
    name = name,
    background = "transparent",
    variant = "settings",
    func = "close_if_not_editing_profile",
    script = "set_ui_background",
    childs = {
        {
            header {name = name, title = "SETTINGS MENU", subtitle = "CONFIGURE AND SET SETTINGS"},
            pos.header.x,
            pos.header.y
        },
        {
            options {
                name = name,
                alignment = "vertical",
                dataInput = "plyr_prof_edit_select_menu_upd8",
                description = description("settings_elements", {
                    [[Rename this profile.]],
                    [[Customize controls for this profile.]],
                    [[Select the gamepads to be used by this profile.]],
                    [[Adjust mouse settings for this profile.]],
                    [[Adjust audio settings for this profile.]],
                    [[Adjust video settings for this profile.]],
                    [[Adjust network settings for this profile.]],
                    [[Change the current profile Slayer/FFA armor color.]],
                    "BUILD: __BUILD__ \r\nPID: __PID__"
                }, [[insurrection/ui/bitmaps/settings_description.bitmap]], "settings"),
                childs = {
                    {
                        button {
                            name = "profile_name",
                            text = "PROFILE NAME",
                            opens = [[insurrection/ui/menus/settings_menu/name_edit/profile_name_screen.ui_widget_definition]],
                            func = "player_profile_change_name"
                        },
                        layout()
                    },
                    {
                        button {
                            name = "controls_setup",
                            text = "CONTROLS",
                            opens = [[insurrection/ui/menus/settings_menu/controls_setup/controls_settings_screen.ui_widget_definition]]
                        },
                        layout()
                    },
                    {
                        button {
                            name = "gamepads_setup",
                            text = "GAMEPADS",
                            opens = [[insurrection/ui/menus/settings_menu/gamepad_setup/gamepad_setup_screen.ui_widget_definition]]
                        },
                        layout()
                    },
                    {
                        button {
                            name = "mouse_setup",
                            text = "MOUSE",
                            opens = [[insurrection/ui/menus/settings_menu/mouse_settings/mouse_settings_screen.ui_widget_definition]]
                        },
                        layout()
                    },
                    {
                        button {
                            name = "audio_setup",
                            text = "AUDIO",
                            opens = [[insurrection/ui/menus/settings_menu/audio_settings/audio_settings_screen.ui_widget_definition]]
                        },
                        layout()
                    },
                    {
                        button {
                            name = "video_setup",
                            text = "VIDEO",
                            opens = [[insurrection/ui/menus/settings_menu/video_settings/video_settings_screen.ui_widget_definition]]
                        },
                        layout()
                    },
                    {
                        button {
                            name = "network_setup",
                            text = "NETWORK",
                            opens = [[insurrection/ui/menus/settings_menu/network_setup/network_settings_screen.ui_widget_definition]]
                        },
                        layout()
                    },
                    {
                        button {
                            name = "color_setup",
                            text = "COLOR",
                            opens = [[insurrection/ui/menus/customization_color/customization_color_menu.ui_widget_definition]]
                        },
                        layout()
                    },
                    {button {name = "about", text = "ABOUT"}, layout()},
                    {
                        options {
                            name = "settings_actions",
                            alignment = "horizontal",
                            useItems = true,
                            childs = {
                                {
                                    button {
                                        name = "save_settings",
                                        text = "SAVE SETTINGS",
                                        func = "player_profile_save_changes",
                                        opens = [[ui/shell/error/warning_saving_file_screen.ui_widget_definition]],
                                        variant = "small"
                                    },
                                    pos.back.x - constants.components.button.small.width - 2,
                                    pos.back.y
                                },
                                {
                                    button {
                                        name = "back",
                                        text = "BACK",
                                        back = true,
                                        variant = "small"
                                    },
                                    pos.back.x,
                                    pos.back.y
                                }
                            }
                        }
                    }
                }
            }
        },
        {
            footer {
                name = name,
                title = "DESCRIPTION",
                text = "Customize your profile settings controls, audio, video, etc."
            },
            layout(8)
        },
        {constants.components.version.path, pos.version.x, pos.version.y}
    }
}
