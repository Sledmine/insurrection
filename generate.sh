set -e

export LUA_WRAPPER="luajit lua/scripts/ui/menus"

# Generate the UI
$LUA_WRAPPER"/legacy/intro/intro_menu.lua"
$LUA_WRAPPER"/legacy/main/main_menu.lua"
$LUA_WRAPPER"/legacy/singleplayer/singleplayer_menu.lua"
