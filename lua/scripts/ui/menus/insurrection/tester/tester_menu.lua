local widget = require "lua.scripts.widget"
local constants = require "lua.scripts.ui.components.constants"
local wrapper = require "lua.scripts.ui.componentsV3.wrapper"
local preview = require "lua.scripts.ui.componentsV3.preview"
local input = require "lua.scripts.ui.componentsV3.input"
local bar = require "lua.scripts.ui.componentsV3.bar"
local pos = constants.position
local label = require "lua.scripts.ui.componentsV3.label"
local strmem = widget.strmem
local container = require "lua.scripts.ui.componentsV3.container"
local options = require "lua.scripts.ui.componentsV3.options"
local button = require "lua.scripts.ui.componentsV3.button"
local header = require "lua.scripts.ui.componentsV3.header"
local checkbox = require "lua.scripts.ui.componentsV3.checkbox"
local slider = require "lua.scripts.ui.componentsV3.slider"
local complexButton = require "lua.scripts.ui.componentsV3.complexButton"
local color = require "lua.scripts.ui.componentsV3.color"
local image = require "lua.scripts.ui.componentsV3.image"

widget.init [[insurrection/ui/menus/tester/]]

local layout = widget.layout {
    alignment = "vertical",
    size = 30,
    x = pos.options.x,
    y = pos.options.y,
    margin = 5
}

return container {
    name = "tester_menu",
    background = "transparent",
    childs = {
        {
            header {
                name = "tester_header",
                title = "COMPONENTS TESTER MENU",
                subtitle = "TEST ALL THE COMPONENTS"
            },
            pos.header.x,
            pos.header.y
        },
        {
            image {
                name = "anim_test",
                bitmap = "insurrection/ui/bitmaps/difficulty_impossible_icon.bitmap",
                width = 270,
                height = 270,
                scale = 0.4
            },
            300,
            60
        },
        {
            preview {
                name = "test_preview_1",
                bitmap = "insurrection/ui/bitmaps/unknown_map_preview.bitmap",
                variant = "small"
            },
            400,
            150
        },
        {
            options {
                name = "tester_options",
                alignment = "vertical",
                childs = {
                    {button {name = "test_1", text = "NORMAL BUTTON"}, layout()},
                    {
                        button {name = "test_2", text = "TRANSPARENT BUTTON", transparent = true},
                        layout()
                    },
                    {checkbox {name = "test_checkbox_1", text = "CHECKBOX"}, layout()},
                    {
                        checkbox {
                            name = "test_checkbox_2",
                            text = "CHECKBOX",
                            transparent = true,
                            align = "left"
                        },
                        layout()
                    },
                    {
                        complexButton {
                            name = "test_complex_1",
                            text = "COMPLEX BUTTON",
                            variant = "horizontal"
                        },
                        layout()
                    },
                    {
                        complexButton {
                            name = "test_complex_2",
                            text = "COMPLEX BUTTON",
                            variant = "vertical"
                        },
                        layout()
                    },
                    {slider {name = "test_slider_1", direction = "left"}, 300, 300},
                    {slider {name = "test_slider_2", direction = "right"}, 330, 300},
                    {
                        input {
                            name = "test_input_1",
                            text = "NORMAL",
                            icon = [[insurrection/ui/bitmaps/search_icon.bitmap]]
                        },
                        40,
                        360
                    },
                    {
                        input {
                            name = "test_input_2",
                            text = "SMALL",
                            variant = "small",
                            icon = [[insurrection/ui/bitmaps/search_icon.bitmap]]
                        },
                        40,
                        400
                    },
                    {color {name = "test_color_1", color = "red", text = "COLOR BUTTON"}, 40, 440}
                }
            }
        }
    }
}
