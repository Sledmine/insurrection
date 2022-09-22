set -e

export LUA_WRAPPER="luajit lua/scripts/ui/menus"

# Generate the UI
$LUA_WRAPPER"/legacy/intro/createIntroMenu.lua"
$LUA_WRAPPER"/legacy/main/createMainMenu.lua"
$LUA_WRAPPER"/legacy/singleplayer/createSingleplayerMenu.lua"
