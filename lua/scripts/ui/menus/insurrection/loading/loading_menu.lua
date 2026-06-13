local widget = require "lua.scripts.widget"
local strmem = widget.strmem
local constants = require "lua.scripts.ui.components.constants"
local container = require "lua.scripts.ui.componentsV3.container"
local label = require "lua.scripts.ui.componentsV3.label"
local image = require "lua.scripts.ui.componentsV3.image"

widget.init [[insurrection/ui/menus/loading/]]

local name = "loading_menu"

local loadingMenuPath = container {
    name = name,
    background = "overlay",
    childs = {
        {
            label {
                name = "loading_label",
                text = strmem(256, "LOADING GAME..."),
                justify = "center",
                variant = "title"
            },
            0,
            200
        },
        {
            image {
                name = "loading_orb",
                bitmap = "insurrection/ui/bitmaps/loading_orb.bitmap",
                width = 256,
                height = 256,
                scale = 0.25
            },
            395,
            220
        }
    }
}

widget.global(loadingMenuPath, "insurrection/ui/custom_menus.tag_collection")

return loadingMenuPath