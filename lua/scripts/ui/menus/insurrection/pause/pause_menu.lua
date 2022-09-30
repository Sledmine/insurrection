local widget = require "lua.scripts.widget"
local container = require "lua.scripts.ui.componentsV2.container"
local header = require "lua.scripts.ui.componentsV2.header"
local options = require "lua.scripts.ui.componentsV2.options"
local button = require "lua.scripts.ui.componentsV2.button"
local constants = require "lua.scripts.ui.components.constants"
local pos = constants.position

widget.init [[insurrection\ui\menus\pause\]]

local layout = widget.align("vertical", 24, pos.options.x, pos.options.y, 2)

return container("pause_menu", {
    {
        header("pause_menu_header", "PAUSE MENU", "GET BACK IN THE FIELD SPARTAN!"),
        pos.header.x,
        pos.header.y
    },
    {
        options("pause_menu_options", "vertical", {
            {button("resume_game", "RESUME GAME", {back = true}), layout()},
            {button("game_options", "GAME OPTIONS"), layout()},
            {button("settings", "SETTINGS"), layout()},
            {button("exit", "EXIT TO MAIN MENU"), layout()}
        })
    },
    {[[insurrection\ui\shared\current_profile.ui_widget_definition]], 624, 20},
    {[[insurrection\ui\main_menu\version.ui_widget_definition]], 0, 460}
})
