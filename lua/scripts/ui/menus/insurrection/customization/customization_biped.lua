local widget = require "lua.scripts.widget"
local constants = require "lua.scripts.ui.components.constants"
local pos = constants.position
local label = require "lua.scripts.ui.componentsV3.label"
local strmem = widget.strmem
local container = require "lua.scripts.ui.componentsV3.container"
local options = require "lua.scripts.ui.componentsV3.options"
local button = require "lua.scripts.ui.componentsV3.button"
local header = require "lua.scripts.ui.componentsV3.header"
local complexButton = require "lua.scripts.ui.componentsV3.complexButton"
local slider = require "lua.scripts.ui.componentsV3.slider"

widget.init [[insurrection/ui/menus/customization_biped/]]

local yPosList = 305
local layout = widget.align("horizontal", constants.components.complexButton.normal.width, 59,
                            yPosList, 2)

return container {
    name = "customization_biped_menu",
    background = "fade",
    childs = {
        {
            header {
                name = "customization",
                title = "BIPED CUSTOMIZATION",
                subtitle = "CUSTOMIZE YOUR BIPED APPAREANCE"
            },
            pos.header.x,
            pos.header.y
        },
        {label {name = "geometry_name", text = strmem(32, "GEOMETRY")}},
        {
            options {
                name = "customization_geometry_list",
                alignment = "horizontal",
                childs = {
                    {slider {name = "geometry_left", direction = "left"}, pos.options.x, yPosList},
                    {
                        complexButton {
                            name = "geometry_item_1",
                            text = strmem(32, "GEOMETRY 1"),
                            icon = "insurrection/ui/bitmaps/customization_icon.bitmap"
                        },
                        layout()
                    },
                    {
                        complexButton {
                            name = "geometry_item_2",
                            text = strmem(32, "GEOMETRY 2"),
                            icon = "insurrection/ui/bitmaps/customization_icon.bitmap"
                        },
                        layout()
                    },
                    {
                        complexButton {
                            name = "geometry_item_3",
                            text = strmem(32, "GEOMETRY 3"),
                            icon = "insurrection/ui/bitmaps/customization_icon.bitmap"
                        },
                        layout()
                    },
                    {
                        complexButton {
                            name = "geometry_item_4",
                            text = strmem(32, "GEOMETRY 4"),
                            icon = "insurrection/ui/bitmaps/customization_icon.bitmap"
                        },
                        layout()
                    },
                    {
                        complexButton {
                            name = "geometry_item_5",
                            text = strmem(32, "GEOMETRY 5"),
                            icon = "insurrection/ui/bitmaps/customization_icon.bitmap"
                        },
                        layout()
                    },
                    {
                        complexButton {
                            name = "geometry_item_6",
                            text = strmem(32, "GEOMETRY 6"),
                            icon = "insurrection/ui/bitmaps/customization_icon.bitmap"
                        },
                        layout()
                    },
                    {slider {name = "geometry_right", direction = "right"}, layout()},
                    {
                        options {
                            name = "customization_geometry_actions",
                            layout = "horizontal",
                            childs = {
                                {
                                    button {name = "back", text = "BACK", back = true},
                                    pos.back.x,
                                    pos.back.y
                                }
                            }
                        }
                    }
                }
            }
        },
        {constants.components.currentProfile.path, 624, 20},
        {constants.components.version.path, 0, 460}
    }
}
