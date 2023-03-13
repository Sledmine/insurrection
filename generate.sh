set -e

LUA_WRAPPER="luajit lua/scripts/ui/menus"

# Generate fonts
FONT_PATH="insurrection/ui/fonts/geogrotesque-regular"
invader-font $FONT_PATH-text -s 12
invader-font $FONT_PATH-title -s 16
invader-font $FONT_PATH-subtitle -s 8
invader-font $FONT_PATH-button -s 11

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
$LUA_WRAPPER"/insurrection/login/login_menu.lua"
$LUA_WRAPPER"/insurrection/dashboard/dashboard_menu.lua"
$LUA_WRAPPER"/insurrection/lobby/lobby_menu.lua"
$LUA_WRAPPER"/insurrection/customization/customization_menu.lua"
$LUA_WRAPPER"/legacy/multiplayer/lan_map_select_menu.lua"
$LUA_WRAPPER"/legacy/multiplayer/lan_gametype_select_menu.lua"
$LUA_WRAPPER"/legacy/multiplayer/lan_server_settings_menu.lua"
$LUA_WRAPPER"/legacy/settings/settings_menu.lua"
$LUA_WRAPPER"/insurrection/mods/mods_menu.lua"
$LUA_WRAPPER"/insurrection/mods/chimera_mod_menu.lua"
$LUA_WRAPPER"/legacy/customization_color/customization_color_menu.lua"
$LUA_WRAPPER"/legacy/multiplayer/multiplayer_menu.lua"
$LUA_WRAPPER"/insurrection/dialog/dialog_menu.lua"
