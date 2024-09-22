local widget = require "lua.scripts.widget"
local constants = require "lua.scripts.ui.components.constants"
local container = require "lua.scripts.ui.componentsV3.container"
local header = require "lua.scripts.ui.componentsV2.header"
local options = require "lua.scripts.ui.componentsV2.options"
local slider = require "lua.scripts.ui.componentsV2.slider"
local complexButton = require "lua.scripts.ui.componentsV2.complexButton"
local button = require "lua.scripts.ui.componentsV2.button"
local box = require "lua.scripts.ui.componentsV2.box"
local label = require "lua.scripts.ui.componentsV2.label"
local pos = constants.position

widget.init [[insurrection/ui/menus/customization_color/]]

local yPosColors = 305
local layout = widget.align("horizontal", constants.components.complexButton.normal.width, 59,
                            yPosColors, 2)

return container {
    name = "customization_color_menu",
    background = "fade",
    script = "set_customization_background",
    childs = {
        {
            header("customization_color", "CHANGE COLOR", "SELECT YOUR FAVORITE COLOR SPARTAN!"),
            pos.header.x,
            pos.header.y
        },
        {
            options("customization_color_list", "horizontal", {
                {
                    slider("color_left", "left",
                           {func = "single_prev_cl_item_activated", legacy = true}),
                    pos.options.x,
                    yPosColors
                },
                {
                    complexButton("color_item_1", nil, nil, {
                        variant = "normal",
                        func = "single_prev_cl_item_activated",
                        legacy = true,
                        icon = [[insurrection/ui/bitmaps/colors_icon.bitmap]]
                    }),
                    layout()
                },
                {
                    complexButton("color_item_2", nil, nil, {
                        variant = "normal",
                        func = "single_prev_cl_item_activated",
                        legacy = true,
                        icon = [[insurrection/ui/bitmaps/colors_icon.bitmap]]
                    }),
                    layout()
                },
                {
                    complexButton("color_item_3", nil, nil, {
                        variant = "normal",
                        func = "single_prev_cl_item_activated",
                        legacy = true,
                        icon = [[insurrection/ui/bitmaps/colors_icon.bitmap]]
                    }),
                    layout()
                },
                {
                    complexButton("color_item_4", nil, nil, {
                        variant = "normal",
                        func = "single_prev_cl_item_activated",
                        legacy = true,
                        icon = [[insurrection/ui/bitmaps/colors_icon.bitmap]]
                    }),
                    layout()
                },
                {
                    complexButton("color_item_5", nil, nil, {
                        variant = "normal",
                        func = "single_prev_cl_item_activated",
                        legacy = true,
                        icon = [[insurrection/ui/bitmaps/colors_icon.bitmap]]
                    }),
                    layout()
                },
                {
                    complexButton("color_item_6", nil, nil, {
                        variant = "normal",
                        func = "single_prev_cl_item_activated",
                        legacy = true,
                        icon = [[insurrection/ui/bitmaps/colors_icon.bitmap]]
                    }),
                    layout()
                },
                {
                    slider("color_right", "right",
                           {func = "single_prev_cl_item_activated", legacy = true}),
                    layout(2)
                },
                {
                    options("customization_color_actions", "horizontal", {
                        {
                            button("save_color", "SAVE COLOR",
                                   {func = "emit_custom_activation_event", back = true}),
                            pos.back.x - 186,
                            pos.back.y
                        },
                        {button("back", "BACK", {back = true}), pos.back.x, pos.back.y}
                    }, nil, {useItems = true})
                }
            }, box("current_color_box_description", {
                {[[insurrection/ui/shared/void.ui_widget_definition]]},
                {
                    box("current_color_description", {
                        {
                            label("current_color", {
                                "WHITE COLOR",
                                "BLACK COLOR",
                                "RED COLOR",
                                "BLUE COLOR",
                                "GRAY COLOR",
                                "YELLOW COLOR",
                                "GREEN COLOR",
                                "PINK COLOR",
                                "PURPLE COLOR",
                                "CYAN COLOR",
                                "COBALT COLOR",
                                "ORANGE COLOR",
                                "TEAL COLOR",
                                "SAGE COLOR",
                                "BROWN COLOR",
                                "TAN COLOR",
                                "MAROON COLOR",
                                "SALMON COLOR"
                            }, {variant = "title"}),
                            53,
                            yPosColors - 26
                        },
                        {[[insurrection/ui/shared/void.ui_widget_definition]]}
                    })
                }
            }), {colorPicker = true, dataInput = "color_picker_update"})
        },
        {constants.components.currentProfile.path, 624, 20},
        {constants.components.version.path, 0, 460}
    }
}

