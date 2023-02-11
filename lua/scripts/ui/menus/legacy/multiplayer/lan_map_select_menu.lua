local widget = require "lua.scripts.widget"
local constants = require "lua.scripts.ui.components.constants"
local container = require "lua.scripts.ui.componentsV2.container"
local header = require "lua.scripts.ui.componentsV2.header"
local options = require "lua.scripts.ui.componentsV2.options"
local button = require "lua.scripts.ui.componentsV2.button"
local description = require "lua.scripts.ui.componentsV2.description"
local pos = constants.position

local layout = widget.align("vertical", 24, pos.options.x, pos.options.y, 2)

widget.init([[insurrection/ui/menus/multiplayer_lan/]])

local widgetPath = container("lan_map_select_menu", {
    {
        header("lan_map_select", "CREATE LAN GAME", "CREATE GAME ON LOCAL NETWORK, CHOOSE A MAP"),
        pos.header.x,
        pos.header.y
    },
    {
        options("lan_maps_list", "vertical", {
            {
                button("scroll_map_list_up", nil,
                       {legacy = true, func = "single_prev_cl_item_activated", arrow = "up"}),
                layout()
            },
            {
                button("map_1", nil,
                       {legacy = true, select = true, func = "single_prev_cl_item_activated"}),
                layout()
            },
            {
                button("map_2", nil,
                       {legacy = true, select = true, func = "single_prev_cl_item_activated"}),
                layout()
            },
            {
                button("map_3", nil,
                       {legacy = true, select = true, func = "single_prev_cl_item_activated"}),
                layout()
            },
            {
                button("map_4", nil,
                       {legacy = true, select = true, func = "single_prev_cl_item_activated"}),
                layout()
            },
            {
                button("map_5", nil,
                       {legacy = true, select = true, func = "single_prev_cl_item_activated"}),
                layout()
            },
            {
                button("map_6", nil,
                       {legacy = true, select = true, func = "single_prev_cl_item_activated"}),
                layout()
            },
            {
                button("map_7", nil,
                       {legacy = true, select = true, func = "single_prev_cl_item_activated"}),
                layout()
            },
            {
                button("map_8", nil,
                       {legacy = true, select = true, func = "single_prev_cl_item_activated"}),
                layout()
            },
            {
                button("map_9", nil,
                       {legacy = true, select = true, func = "single_prev_cl_item_activated"}),
                layout()
            },
            {
                button("scroll_map_list_down", nil,
                       {legacy = true, func = "single_prev_cl_item_activated", arrow = "down"}),
                layout()
            },
            {
                options("map_list_actions", "horizontal", {
                    {
                        button("select_map_ok", "SELECT MAP",
                               {func = "emit_custom_activation_event"}),
                        pos.back.x - 186,
                        pos.back.y
                    },
                    {button("back", "BACK", {back = true}), pos.back.x, pos.back.y}
                }, nil, {useItems = true})
            }
        }, description("lan_maps_description", {
            "Battle Creek - Splash Splash, Bang Bang (2-8 players)",
            "Sidewinder - Red Blood, White Snow (4-16 players, supports vehicles)",
            "Damnation - Covenant Hydro-Processing Center (4-8 players)",
            "Rat Race - Up the Ramps, Down the Tubes (2-6 players)",
            "Prisoner - Get on Top (2-8 players)",
            "Hang'Em High - Tombstones for Everybody (4-16 players)",
            "Chill Out - Dude, you really need to... (2-8 players)",
            "Derelict - Deep-Space Anomaly #0198 (4-8 players)",
            "Boarding Action - Ship-to-Ship Combat (4-16 players)",
            "Blood Gulch - The Quick and the Dead (4-16 players, supports vehicles)",
            "Wizard - You spin my head right round, right round (2-8 players)",
            "Chiron TL34 - Spartan Clone Training Complex (2-16 players)",
            "Longest - A long walk down a short hall... (2-8 players)",
            "Ice Fields - Splipping and Sliding (4-16 players, supports vehicles)",
            "Death Island - Sand, Surf and Spent Shells (4-16 players, supports vehicles)",
            "Danger Canyon - Don't Look Down Unless You Fall (4-16 players, supports vehicles)",
            "Infinity - I Imagined it Would Be Bigger (4-16 players, supports vehicles)",
            "Timberland - An Enemy Behind Every Tree (4-16 players, supports vehicles)",
            "Gephyrophobia - Scary, huh? (2-12 players, supports vehicles)",
            "Custom Map - Community Made Map"
        }, [[insurrection\ui\bitmaps\map_previews.bitmap]], "lan_maps"), {
            multiplayerMaps = [[ui/shell/main_menu/multiplayer_type_select/connected/gametype_select_screen_wrapper.ui_widget_definition]],
            dataInput = "mp_map_list_update"
        })
    },
    {constants.components.currentProfile.path, 624, 20},
    {constants.components.version.path, 0, 460}
}, {func = "net_server_defer_start"})

widget.init([[ui\shell\main_menu\multiplayer_type_select\connected\]])

container("connected_map_select_wrapper", {{widgetPath, 0, 0}}, {noBackgroud = true})
