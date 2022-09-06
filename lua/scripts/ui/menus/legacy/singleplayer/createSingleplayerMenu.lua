local widget = require "lua.scripts.widget"
local container = require "lua.scripts.ui.componentsV2.container"
local header = require "lua.scripts.ui.componentsV2.header"
local options = require "lua.scripts.ui.componentsV2.options"
local button = require "lua.scripts.ui.componentsV2.button"
local inspect = require "lua.lua_modules.inspect"

widget.init([[insurrection/ui/menus/singleplayer/]])
local layout = widget.align("vertical", 24, 40, 84, 2)

container("singleplayer_menu", {
    {
        header("singleplayer_menu_header", "SINGLEPLAYER", "PLAY A SINGLEPLAYER CAMPAIGN PROJECT"),
        40,
        20
    },
    {
        options("singleplayer_menu_options", "vertical", {
            {button("classic_campaign", "CLASSIC CAMPAIGN"), layout()},
            {button("lumoria", "LUMORIA"), layout()},
            {button("the_flood", "THE FLOOD"), layout()},
            {button("back", "BACK", {back = true}), 630, 415}
        })
    },
    {[[insurrection/ui/shared/current_profile.ui_widget_definition]], 624, 20},
    {[[insurrection/ui/main_menu/version.ui_widget_definition]], 0, 460}
})
