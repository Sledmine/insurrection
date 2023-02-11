local widget = require "lua.scripts.widget"
local container = require "lua.scripts.ui.componentsV2.container"
local options = require "lua.scripts.ui.componentsV2.options"
local button = require "lua.scripts.ui.componentsV2.button"
local constants = require "lua.scripts.ui.components.constants"
local header = require "lua.scripts.ui.componentsV2.header"
local description = require "lua.scripts.ui.componentsV2.description"
local pos = constants.position

widget.init "insurrection/ui/menus/settings/"

local layout = widget.align("vertical", 24, pos.options.x, pos.options.y, 2)

return container("settings_menu", {
    {
        header("settings_menu", "SETTINGS MENU", "CONFIGURE AND SET SETTINGS"),
        pos.header.x,
        pos.header.y
    },
    {
        options("settings_menu", "vertical", {
            {
                button("profile_name", "PROFILE NAME", {
                    opens = [[insurrection/ui/menus/settings_menu/name_edit/profile_name_screen.ui_widget_definition]],
                    func = "player_profile_change_name"
                }),
                layout()
            },
            {
                button("controls_setup", "CONTROLS", {
                    opens = [[insurrection/ui/menus/settings_menu/controls_setup/controls_settings_screen.ui_widget_definition]]
                }),
                layout()
            },
            {
                button("gamepads_setup", "GAMEPADS", {
                    opens = [[insurrection/ui/menus/settings_menu/gamepad_setup/gamepad_setup_screen.ui_widget_definition]]
                }),
                layout()
            },
            -- mouse, audio, video, network, color, about
            {
                button("mouse_setup", "MOUSE", {
                    opens = [[insurrection/ui/menus/settings_menu/mouse_settings/mouse_settings_screen.ui_widget_definition]]
                }),
                layout()
            },
            {
                button("audio_setup", "AUDIO", {
                    opens = [[insurrection/ui/menus/settings_menu/audio_settings/audio_settings_screen.ui_widget_definition]]
                }),
                layout()
            },
            {
                button("video_setup", "VIDEO", {
                    opens = [[insurrection/ui/menus/settings_menu/video_settings/video_settings_screen.ui_widget_definition]]
                }),
                layout()
            },
            {
                button("network_setup", "NETWORK", {
                    opens = [[insurrection/ui/menus/settings_menu/network_setup/network_settings_screen.ui_widget_definition]]
                }),
                layout()
            },
            {
                button("color_setup", "COLOR", {
                    opens = [[insurrection/ui/menus/customization_color/customization_color_menu.ui_widget_definition]]
                }),
                layout()
            },
            {button("about", "ABOUT"), layout()},
            {
                options("settings_actions", "horizontal", {
                    {
                        button("save_settings", "SAVE SETTINGS", {
                            func = "player_profile_save_changes",
                            opens = [[ui/shell/error/warning_saving_file_screen.ui_widget_definition]]
                        }),
                        pos.back.x - 186,
                        pos.back.y
                    },
                    {button("back", "BACK", {back = true}), pos.back.x, pos.back.y}
                }, nil, {useItems = true})
            }
        }, description("settings_elements", {
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
                {dataInput = "plyr_prof_edit_select_menu_upd8"})
    },
    {constants.components.currentProfile.path, 624, 20},
    {constants.components.version.path, 0, 460}
}, {variant = "settings", func = "close_if_not_editing_profile", script = "set_ui_background"})
