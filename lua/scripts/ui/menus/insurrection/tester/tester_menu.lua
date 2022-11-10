local widget = require "lua.scripts.widget"
local container = require "lua.scripts.ui.componentsV2.container"
local options = require "lua.scripts.ui.componentsV2.options"
local button = require "lua.scripts.ui.componentsV2.button"
local constants = require "lua.scripts.ui.components.constants"
local image = require "lua.scripts.ui.componentsV2.image"
local header = require "lua.scripts.ui.componentsV2.header"
local checkbox = require "lua.scripts.ui.componentsV2.checkbox"
local pos = constants.position

widget.init [[insurrection/ui/menus/tester/]]

local layout = widget.align("vertical", 24, pos.options.x, pos.options.y, 2)

return container("tester_menu", {
    {
        header("tester_header", "COMPONENTS TESTER MENU", "TEST ALL THE COMPONENTS"),
        pos.header.x,
        pos.header.y
    },
    {image("anim_test", [[insurrection/ui/bitmaps/anim_test.bitmap]], 123, 135, 0.5), 40, 300},
    {
        options("tester_options", "vertical", {
            {button("test_1", "BUTTON 1"), layout()},
            {button("test_2", "BUTTON 2"), layout()},
            {button("test_3", "BUTTON 3"), layout()},
            {checkbox("test_checkbox_1", "CHECKBOX 1"), layout()},
            {checkbox("test_checkbox_2", "CHECKBOX 2"), layout()}
        })
    }
})
