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
        }, description("lan_maps_description", {
            [[Custom Game Type Capture the Flag]],
            [[Custom Game Type Capture the Flag]],
            [[Custom Game Type Slayer Free for All]],
            [[Custom Game Type Slayer Teams Enabled]],
            [[Custom Game Type Oddball Free for All]],
            [[Custom Game Type Oddball Teams Enabled]],
            [[Custom Game Type King of the Hill Free for All]],
            [[Custom Game Type King of the Hill Teams Enabled]],
            [[Custom Game Type Racing Free for All]],
            [[Custom Game Type Racing Teams Enabled]],
            [[Classic deathmatch. 15 kills to win.]],
            [[Classic deathmatch. 25 kills to win. Start with Pistol, AR and Grenades.]],
            [[Each player has  only one life. The winner is the last cyborg standing!]],
            [[All players are invisible. To win, follow the nav points and kill your targets in order.]],
            [[Each player has 5 lives. Respawn Time Growth and Odd Man Out rules apply. 10 kills or the last man standing wins.]],
            [[Everybody has Rocket Launchers, and nobody has a Motion Tracker. 25 kills to win.]],
            [[Everybody has sniper weapons, and the Respawn Time Growth rules are on. Watch out! 15 kills to win.]],
            [[Hold the Skull for 2 minutes to win.]],
            [[When you're "it", you run slowly but you score time. Accumulate 2 minutes to win.]],
            [[Score 5 minutes to win. Kills speed up  your timer, but you lose your time bonus if you die.]],
            [[The Juggernaut does extra damage. Kill the Juggernaut to steal his powers. Score 10 kills to win the game.]],
            [[One sneaky player is invisible. Find him and kill him to gain his sneaky powers. Score 10 kills to win the game.]],
            [[Control the hill for a total of 2 minutes to win the match.]],
            [[Control the hill for a total of 2 minutes to win the match. Start with Grenades, Pistol and AR.]],
            [[Control the hill for a total of 2 minutes to win the match, but watch out: it moves from place to place!]],
            [[The first player to complete 3 laps by touching all the flag points wins the race.]],
            [[The first player to collect 15 flag points wins the rally.]],
            [[The first team to capture the enemy's flag and return it to their own base 3 times wins the game.]],
            [[Carry the enemy flag into their base and plant it at their flag station. 3 successful assaults wins, but you only get 5 lives!]],
            [[All players start with health at 200% and both teams have Scorpion tanks. 3 flag captures wins the game.]],
            [[3 flag captures wins the game, but your flag must be at home to score. Start with Grenades, Pistol and AR.]],
            [[The first team to have all of its players touch all of the flag points in order 3 times wins the race.]],
            [[The first team to have all of its players collect 5 flag points wins the rally.]],
            [[The first team to hold the Skull for 2 minutes wins. 10-second respawn time.]],
            [[The first team to control the hill for a total of 2 minutes wins. 10-second respawn time.]],
            [[The first team to amass 50 kills wins this fragfest. Kills make you slower, but dying makes you faster.]],
            [[Classic deathmatch. 25 kills to win.]],
            [[Hold the Skull for 2 minutes to win.]],
            [[The Juggernaut does extra damage. Kill the Juggernaut to steal his powers. Score 15 kills to win the game.]],
            [[Control the hill for a total of 2 minutes to win the match.]],
            [[Control the hill for a total of 2 minutes to win the match, but watch out: it moves from place to place!]],
            [[The first player to complete 3 laps by touching all the flag points wins the race.]],
            "The first team to capture the enemy's flag and return it to their own base 3 times wins the game.\r\nYou must have your own flag to capture.",
            [[Teams alternate offense and defense every 2 minutes.  Carry the enemy flag into their base to their flag station. 5 assaults wins.]],
            [[The first team to amass 50 kills wins this fragfest.]],
            [[The first team to hold the Skull for 2 minutes wins. 5-second respawn time.]],
            [[The first team to control the hill for a total of 2 minutes wins. 10-second respawn time.]],
            [[The first team to have all of its players touch all of the flag points in order 3 times wins the race.]]
        }, [[insurrection/ui/bitmaps/gametypes_description.bitmap]], "network_gametypes"), {
            -- gametypes = [[ui/shell/main_menu/multiplayer_type_select/server_settings/server_settings_screen.ui_widget_definition]],
            gametypes = [[insurrection/ui/menus/lan_server_settings/lan_server_settings_menu.ui_widget_definition]],
            dataInput = "gt_select_list_update"
        })
    },
    {constants.components.currentProfile.path, 624, 20},
    {constants.components.version.path, 0, 460}
}, {func = "net_server_defer_start"})

-- ui/shell/strings/game_variant_descriptions.unicode_string_list

widget.init([[ui\shell\main_menu\multiplayer_type_select\connected\]])

container("gametype_select_screen_wrapper", {{widgetPath, 0, 0}}, {noBackgroud = true})
