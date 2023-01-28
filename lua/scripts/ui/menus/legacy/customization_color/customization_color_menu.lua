local widget = require "lua.scripts.widget"
local constants = require "lua.scripts.ui.components.constants"
local container = require "lua.scripts.ui.componentsV2.container"
local header = require "lua.scripts.ui.componentsV2.header"
local options = require "lua.scripts.ui.componentsV2.options"
local slider = require "lua.scripts.ui.componentsV2.slider"
local complexButton = require "lua.scripts.ui.componentsV2.complexButton"
local button = require "lua.scripts.ui.componentsV2.button"
local footer = require "lua.scripts.ui.componentsV2.footer"
local pos = constants.position

widget.init [[insurrection/ui/menus/customization_color/]]

local layout = widget.align("horizontal", constants.components.complexButton.normal.width,
                                    59, 310, 2)

return container("customization_color_menu", {
    {
        header("customization_color", "CHANGE COLOR", "SELECT YOUR FAVORITE COLOR SPARTAN!"),
        pos.header.x,
        pos.header.y
    },
    {
        options("customization_color_list", "horizontal", {
            {slider("color_left", "left", {func = "single_prev_cl_item_activated", legacy = true}), pos.options.x, 310},
            {complexButton("color_item_1", nil, nil, {variant = "normal", func = "single_prev_cl_item_activated", legacy = true, icon = [[insurrection/ui/bitmaps/colors_icon.bitmap]]}), layout()},
            {complexButton("color_item_2", nil, nil, {variant = "normal", func = "single_prev_cl_item_activated", legacy = true, icon = [[insurrection/ui/bitmaps/colors_icon.bitmap]]}), layout()},
            {complexButton("color_item_3", nil, nil, {variant = "normal", func = "single_prev_cl_item_activated", legacy = true, icon = [[insurrection/ui/bitmaps/colors_icon.bitmap]]}), layout()},
            {complexButton("color_item_4", nil, nil, {variant = "normal", func = "single_prev_cl_item_activated", legacy = true, icon = [[insurrection/ui/bitmaps/colors_icon.bitmap]]}), layout()},
            {complexButton("color_item_5", nil, nil, {variant = "normal", func = "single_prev_cl_item_activated", legacy = true, icon = [[insurrection/ui/bitmaps/colors_icon.bitmap]]}), layout()},
            {complexButton("color_item_6", nil, nil, {variant = "normal", func = "single_prev_cl_item_activated", legacy = true, icon = [[insurrection/ui/bitmaps/colors_icon.bitmap]]}), layout()},
            --{complexButton("list_item_7", nil, nil, {variant = "normal", func = "single_prev_cl_item_activated", legacy = true}), layout()},
            --{complexButton("list_item_8", nil, nil, {variant = "normal", func = "single_prev_cl_item_activated", legacy = true}), layout()},
            --{complexButton("list_item_9", nil, nil, {variant = "normal", func = "single_prev_cl_item_activated", legacy = true}), layout()},
            -- {complexButton("list_item_10", nil, nil, {variant = "normal", func = "single_prev_cl_item_activated", legacy = true}), layout()},
            -- {complexButton("list_item_11", nil, nil, {variant = "normal", func = "single_prev_cl_item_activated", legacy = true}), layout()},
            -- {complexButton("list_item_12", nil, nil, {variant = "normal", func = "single_prev_cl_item_activated", legacy = true}), layout()},
            -- {complexButton("list_item_13", nil, nil, {variant = "normal", func = "single_prev_cl_item_activated", legacy = true}), layout()},
            -- {complexButton("list_item_14", nil, nil, {variant = "normal", func = "single_prev_cl_item_activated", legacy = true}), layout()},
            -- {complexButton("list_item_15", nil, nil, {variant = "normal", func = "single_prev_cl_item_activated", legacy = true}), layout()},
            -- {complexButton("list_item_16", nil, nil, {variant = "normal", func = "single_prev_cl_item_activated", legacy = true}), layout()},
            -- {complexButton("list_item_17", nil, nil, {variant = "normal", func = "single_prev_cl_item_activated", legacy = true}), layout()},
            -- {complexButton("list_item_18", nil, nil, {variant = "normal", func = "single_prev_cl_item_activated", legacy = true}), layout()},
            {slider("color_right", "right", {func = "single_prev_cl_item_activated", legacy = true}), layout(2)},
             {options("customization_color_actions", "horizontal", {
                {
                    button("save_color", "SAVE COLOR", {func = "emit_custom_activation_event"}),
                    pos.back.x - 186,
                    pos.back.y
                },
                {button("back", "BACK", {back = true}), pos.back.x, pos.back.y}
            }, nil, {useItems = true})}
        },
                [[ui/shell/main_menu/settings_select/player_setup/player_profile_edit/color_edit/color_select_extended_desc.ui_widget_definition]],
                {colorPicker = true,dataInput = "color_picker_update"})
    },
    {[[insurrection/ui/shared/current_profile.ui_widget_definition]], 624, 20},
    {[[insurrection/ui/shared/version.ui_widget_definition]], 0, 460}
}, {noBackgroud = true, script = "set_customization_background"})
