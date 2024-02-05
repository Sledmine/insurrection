local widget = require "lua.scripts.widget"
local container = require "lua.scripts.ui.componentsV2.container"
local options = require "lua.scripts.ui.componentsV2.options"
local button = require "lua.scripts.ui.componentsV2.button"
local header = require "lua.scripts.ui.componentsV2.header"
local input = require "lua.scripts.ui.componentsV2.input"
local constants = require "lua.scripts.ui.components.constants"
local image = require "lua.scripts.ui.componentsV2.image"
local footer = require "lua.scripts.ui.componentsV2.footer"
local pos = constants.position

widget.init [[insurrection/ui/menus/dashboard/]]

local layout = widget.align("vertical", 24, pos.options.x, pos.options.y, 2)

return container("dashboard_menu", {
    {
        header("dashboard", "INSURRECTION DASHBOARD",
               "PLAY WITH FRIENDS IN A LOBBY, CUSTOMIZE YOUR PROFILE, AND MORE"),
        pos.header.x,
        pos.header.y
    },
    {
        options("dashboard", "vertical", {
            {button("browse_lobby", "BROWSE LOBBIES"), layout()},
            {button("create_lobby", "CREATE LOBBY"), layout()},
            {button("join_lobby", "JOIN LOBBY BY KEY"), layout()},
            {
                input("lobby_key", string.rep(" ", 16),
                      {variant = "small", icon = [[insurrection/ui/bitmaps/key_icon.bitmap]]}),
                layout()
            },
            {
                button("customization", "CUSTOMIZATION", {
                    opens = [[insurrection/ui/menus/customization/customization_menu.ui_widget_definition]]
                }),
                layout()
            },
            {button("back", "BACK", {back = true}), pos.back.x, pos.back.y}
        })
    },
    {
        footer("dashboard", "DASHBOARD",
               "Welcome to the dashboard!\r\nHere you can choose from different actions from Insurrection services."),
        layout(8)
    },
    {constants.components.currentProfile.path, 624, 20},
    {constants.components.version.path, 0, 460}
})
