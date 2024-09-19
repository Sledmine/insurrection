local widget = require "lua.scripts.widget"
local constants = require "lua.scripts.ui.components.constants"
local bar = require "lua.scripts.ui.componentsV3.bar"
local pos = constants.position
local label = require "lua.scripts.ui.componentsV3.label"
local strmem = widget.strmem
local container = require "lua.scripts.ui.componentsV3.container"
local options = require "lua.scripts.ui.componentsV3.options"
local button = require "lua.scripts.ui.componentsV3.button"
local header = require "lua.scripts.ui.componentsV3.header"
local complexButton = require "lua.scripts.ui.componentsV3.complexButton"
local slider = require "lua.scripts.ui.componentsV3.slider"

widget.init [[insurrection/ui/menus/customization_biped_colors/]]

local yPosList = 305
local barSize = 200
local layout = widget.align("horizontal", constants.components.complexButton.normal.width, 59,
                            yPosList, 2)

return container {
    name = "customization_biped_colors_menu",
    background = "fade",
    childs = {
        {
            header {
                name = "customization_color",
                title = "BIPED COLOR",
                subtitle = "CUSTOMIZE YOUR BIPED COLOR"
            },
            pos.header.x,
            pos.header.y
        },
        {
            bar {
                name = "customization_primary_color_scroll",
                orientation = "horizontal",
                type = "scroll",
                size = barSize
            },
            (constants.screen.width / 2) - (barSize / 2),
            425
        },
        {
            options {
                name = "customization_biped_color_actions",
                layout = "horizontal",
                childs = {
                    {button {name = "back", text = "BACK", back = true}, pos.back.x, pos.back.y}
                }
            }
        },
        {constants.components.currentProfile.path, 624, 20},
        {constants.components.version.path, 0, 460}
    }
}
