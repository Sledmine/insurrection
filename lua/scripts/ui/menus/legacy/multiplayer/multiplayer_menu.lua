local widget = require "lua.scripts.widget"
local constants = require "lua.scripts.ui.components.constants"
local container = require "lua.scripts.ui.componentsV2.container"
local header = require "lua.scripts.ui.componentsV2.header"
local options = require "lua.scripts.ui.componentsV2.options"
local button = require "lua.scripts.ui.componentsV2.button"
local description = require "lua.scripts.ui.componentsV2.description"
local label = require "lua.scripts.ui.componentsV2.label"
local pos = constants.position

widget.init([[insurrection/ui/menus/multiplayer/]])

local layout = widget.align("vertical", 24, pos.options.x, 90, 2)

local widgetPath = container("multiplayer_menu", {
    {
        header("multiplayer", "MULTIPLAYER LEGACY", "CREATE OR JOIN A MULTIPLAYER GAME"),
        pos.header.x,
        pos.header.y
    },
    {label("join_game", "JOIN GAME", {variant = "subtitle"}), 40, 70},
    {label("create_game", "CREATE GAME", {variant = "subtitle"}), 40, 196},
    {
        options("multiplayer", "vertical", {
            {[[insurrection/ui/shared/void.ui_widget_definition]]},
            {
                button("join_internet", "INTERNET", {
                    func = "mp_type_set_mode",
                    opens = "insurrection/ui/menus/servers_menu/servers_menu_screen.ui_widget_definition"
                }),
                layout()
            },
            {
                button("join_lan", "LAN", {
                    func = "mp_type_set_mode",
                    opens = "insurrection/ui/menus/servers_menu/servers_menu_screen.ui_widget_definition"
                }),
                layout()
            },
            {
                button("join_ip", "DIRECT IP", {
                    func = "mp_type_set_mode",
                    opens = "ui/shell/main_menu/multiplayer_type_select/direct_ip/direct_ip_screen.ui_widget_definition"
                }),
                layout()
            },
            {[[insurrection/ui/shared/void.ui_widget_definition]]},
            {
                button("create_internet", "INTERNET", {
                    func = {"join_controller_to_mp_game","mp_type_set_mode"},
                    opens = "ui/shell/main_menu/multiplayer_type_select/checking_updates_screen_create.ui_widget_definition"
                }),
                layout(50)
            },
            {
                button("create_lan", "LAN", {
                    func = {"join_controller_to_mp_game","mp_type_set_mode"},
                    opens = "ui/shell/main_menu/multiplayer_type_select/connected/connected_map_select_wrapper.ui_widget_definition"
                }),
                layout(50)
            },
            {button("back", "BACK", {back = true}), pos.back.x, pos.back.y}
        }, description("multiplayer_legacy_options", {
                "Join a multiplayer game on the Internet. Play against other players and prove them all that Halo Custom Edition is still alive.\r\nIf you can join a server without bots...",
                "Join a multiplayer game on your local area network.",
                "Join a multiplayer game at a specific server address.",
                "Create a multiplayer game on the Internet, if this somehow works...",
                "Create a multiplayer game on your local area network.",
                "Go back to the previous menu."
            },
            [[insurrection/ui/main_menu/menu_options/multiplayer_menu/options/options_description/bitmaps/description_preview.bitmap]],
            "multiplayer"),
        {dataInput = "multiplayer_type_menu_update_desc"})
    },
    {constants.components.currentProfile.path, 624, 20},
    {constants.components.version.path, 0, 460}
}, {func = "mp_type_menu_initialize", script = "set_multiplayer_background"})
