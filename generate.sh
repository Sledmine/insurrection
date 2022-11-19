set -e

export LUA_WRAPPER="luajit lua/scripts/ui/menus"

# Generate the UI
$LUA_WRAPPER"/legacy/intro/intro_menu.lua"
$LUA_WRAPPER"/legacy/main/main_menu.lua"
$LUA_WRAPPER"/legacy/singleplayer/singleplayer_menu.lua"
$LUA_WRAPPER"/legacy/singleplayer/classic_campaign_menu.lua"
$LUA_WRAPPER"/legacy/singleplayer/classic_campaign_difficulty_select_menu.lua"
$LUA_WRAPPER"/legacy/singleplayer/classic_campaign_level_select_menu.lua"
$LUA_WRAPPER"/insurrection/pause/pause_menu.lua"
$LUA_WRAPPER"/insurrection/pause/pause_game_options_menu.lua"
$LUA_WRAPPER"/insurrection/pause/pause_choose_team_menu.lua"
$LUA_WRAPPER"/insurrection/tester/tester_menu.lua"
$LUA_WRAPPER"/legacy/multiplayer/lan_map_select_menu.lua"
$LUA_WRAPPER"/legacy/multiplayer/lan_gametype_select_menu.lua"
$LUA_WRAPPER"/legacy/multiplayer/lan_server_settings_menu.lua"
