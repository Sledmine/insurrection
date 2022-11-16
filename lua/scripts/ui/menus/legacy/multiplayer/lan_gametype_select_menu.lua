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

widget.init([[insurrection/ui/menus/lan_gametype_select/]])

local widgetPath = container("lan_gametype_select_menu", {
    {
        header("lan_gametype_select", "SELECT GAMETYPE", "CHOOSE A GAMETYPE TO PLAY"),
        pos.header.x,
        pos.header.y
    },
    {
        options("lan_gametypes_list", "vertical", {
            {
                spinner("gametype_class", nil, {"STANDARD", "CLASSIC", "CUSTOM"},
                        {legacy = true, func = "mouse_spinner_1wide_click"}),
                layout()
            },
            {
                button("scroll_gametypes_list_up", nil,
                       {legacy = true, func = "single_prev_cl_item_activated", arrow = "up"}),
                layout()
            },
            {
                button("gametype_1", nil,
                       {legacy = true, select = true, func = "single_prev_cl_item_activated"}),
                layout()
            },
            {
                button("gametype_2", nil,
                       {legacy = true, select = true, func = "single_prev_cl_item_activated"}),
                layout()
            },
            {
                button("gametype_3", nil,
                       {legacy = true, select = true, func = "single_prev_cl_item_activated"}),
                layout()
            },
            {
                button("gametype_4", nil,
                       {legacy = true, select = true, func = "single_prev_cl_item_activated"}),
                layout()
            },
            {
                button("gametype_5", nil,
                       {legacy = true, select = true, func = "single_prev_cl_item_activated"}),
                layout()
            },
            {
                button("gametype_6", nil,
                       {legacy = true, select = true, func = "single_prev_cl_item_activated"}),
                layout()
            },
            {
                button("gametype_7", nil,
                       {legacy = true, select = true, func = "single_prev_cl_item_activated"}),
                layout()
            },
            {
                button("gametype_8", nil,
                       {legacy = true, select = true, func = "single_prev_cl_item_activated"}),
                layout()
            },
            {
                button("gametype_9", nil,
                       {legacy = true, select = true, func = "single_prev_cl_item_activated"}),
                layout()
            },
            {
                button("scroll_gametypes_list_down", nil,
                       {legacy = true, func = "single_prev_cl_item_activated", arrow = "down"}),
                layout()
            },
            {
                options("gametypes_list_actions", "horizontal", {
                    {
                        button("select_gametype_ok", "SELECT GAMETYPE",
                               {func = "emit_custom_activation_event"}),
                        pos.back.x - 186,
                        pos.back.y
                    },
                    {button("back", "BACK", {back = true}), pos.back.x, pos.back.y}
                }, nil, {useItems = true})
            }
        },
                description("lan_maps_description", {},
                            [[insurrection/ui/bitmaps/gametypes_description.bitmap]],
                            "network_gametypes"), {
            --gametypes = [[ui/shell/main_menu/multiplayer_type_select/server_settings/server_settings_screen.ui_widget_definition]],
            gametypes = [[insurrection/ui/menus/lan_server_settings/lan_server_settings_menu.ui_widget_definition]],
            dataInput = "gt_select_list_update"
        })
    },
    {[[insurrection\ui\shared\current_profile.ui_widget_definition]], 624, 20},
    {[[insurrection\ui\shared\version.ui_widget_definition]], 0, 460}
}, {func = "net_server_defer_start"})

-- ui/shell/strings/game_variant_descriptions.unicode_string_list

widget.init([[ui\shell\main_menu\multiplayer_type_select\connected\]])

container("gametype_select_screen_wrapper", {{widgetPath, 0, 0}}, {noBackgroud = true})
