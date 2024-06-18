local widget = require "lua.scripts.widget"
local container = require "lua.scripts.ui.componentsV2.container"
local options = require "lua.scripts.ui.componentsV2.options"
local button = require "lua.scripts.ui.componentsV2.button"
local constants = require "lua.scripts.ui.components.constants"
local image = require "lua.scripts.ui.componentsV2.image"
local header = require "lua.scripts.ui.componentsV2.header"
local checkbox = require "lua.scripts.ui.componentsV2.checkbox"
local input = require "lua.scripts.ui.componentsV2.input"
local complexButton = require "lua.scripts.ui.componentsV2.complexButton"
local slider = require "lua.scripts.ui.componentsV2.slider"
local nameplate = require "lua.scripts.ui.componentsV2.nameplate"
local preview = require "lua.scripts.ui.componentsV2.preview"
local color = require "lua.scripts.ui.componentsV3.color"
local pos = constants.position

widget.init [[insurrection/ui/menus/tester/]]

local layout = widget.align("vertical", 40, pos.options.x, pos.options.y, 5)

return container("tester_menu", {
    {
        header("tester_header", "COMPONENTS TESTER MENU", "TEST ALL THE COMPONENTS"),
        pos.header.x,
        pos.header.y
    },
    {image("anim_test", [[insurrection/ui/bitmaps/anim_test.bitmap]], 123, 135, 0.5), 300, 60},
    {nameplate("nameplate", "NAMEPLATE"), 624, 20},
    {
        preview("test_preview_1", "insurrection/ui/bitmaps/insurrection_maps/cold_shoulder.bitmap"),
        400,
        150
    },
    {
        options("tester_options", "vertical", {
            {button("test_1", "NORMAL BUTTON"), layout()},
            {checkbox("test_checkbox_1", "CHECKBOX"), layout()},
            {
                complexButton("test_complex_1", "COMPLEX BUTTON", "HORIZONTAL",
                              {variant = "horizontal"}),
                layout()
            },
            {
                complexButton("test_complex_2", "COMPLEX BUTTON", "VERTICAL", {variant = "vertical"}),
                layout()
            },
            {slider("test_slider_1", "left"), 300, 300},
            {slider("test_slider_2", "right"), 330, 300},
            {
                input("test_input_1", "NORMAL",
                      {icon = "insurrection/ui/bitmaps/search_icon.bitmap"}),
                40,
                360
            },
            {
                input("test_input_2", "SMALL",
                      {variant = "small", icon = "insurrection/ui/bitmaps/search_icon.bitmap"}),
                40,
                400
            },
            {color {name = "test_color_1", color = "red", text = "COLOR BUTTON"}, 40, 440}

        })
    }
})
