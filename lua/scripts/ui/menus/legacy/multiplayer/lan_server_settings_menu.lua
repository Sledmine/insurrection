local widget = require "lua.scripts.widget"
local constants = require "lua.scripts.ui.components.constants"
local container = require "lua.scripts.ui.componentsV2.container"
local header = require "lua.scripts.ui.componentsV2.header"
local options = require "lua.scripts.ui.componentsV2.options"
local button = require "lua.scripts.ui.componentsV2.button"
local description = require "lua.scripts.ui.componentsV2.description"
local spinner = require "lua.scripts.ui.componentsV2.spinner"
local pos = constants.position

local layout = widget.align("vertical", 24, pos.options.x, pos.options.y, 2)

widget.init([[insurrection/ui/menus/lan_server_settings/]])

-- server name
-- password
-- connection type
-- max players
-- server ip

local maxPlayersList = {}
for i = 1, 15 do
    maxPlayersList[i] = tostring(i + 1)
end

local widgetPath = container("lan_server_settings_menu", {
    {
        header("lan_server_settings", "SERVER SETTINGS", "DEFINE NETWORK SETTINGS FOR YOUR GAME"),
        pos.header.x,
        pos.header.y
    },
    {
        options("lan_server_settings_list", "vertical", {
            {
                spinner("server_name", "SERVER NAME", {""},
                        {variant = "large", func = "ss_edit_server_name", length = 32}),
                layout()
            },
            {
                spinner("password", "PASSWORD", {""},
                        {variant = "large", func = "ss_edit_server_password", length = 8}),
                layout()
            },
            {
                spinner("connection_type", "CONNECTION TYPE", {
                    "56k",
                    "DSL/Cable (LOW)",
                    "DSL/Cable (AVG)",
                    "DSL/Cable (HIGH)",
                    "T1/LAN"
                }, {variant = "large", func = "mouse_spinner_1wide_click"}),
                layout()
            },
            {
                spinner("max_players", "MAX PLAYERS", maxPlayersList,
                        {variant = "large", func = "mouse_spinner_1wide_click"}),
                layout()
            },
            {spinner("server_ip", "SERVER IP", {""}, {variant = "large", length = 32}), layout()},
            {
                options("gametypes_list_actions", "horizontal", {
                    {
                        button("start_server_game", "START GAME", {func = "ss_start_game"}),
                        pos.back.x - 186,
                        pos.back.y
                    },
                    {button("back", "BACK", {back = true}), pos.back.x, pos.back.y}
                })
            }
        },
                [[ui/shell/main_menu/multiplayer_type_select/server_settings/server_settings_help.ui_widget_definition]],
                {func = "server_settings_init", dataInput = "server_settings_update"})
    },
    {constants.components.currentProfile.path, 624, 20},
    {constants.components.version.path, 0, 460}
    -- })
})
