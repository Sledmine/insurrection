local widget = require "lua.scripts.widget"
local container = require "lua.scripts.ui.componentsV2.container"
local options = require "lua.scripts.ui.componentsV2.options"
local button = require "lua.scripts.ui.componentsV2.button"
local header = require "lua.scripts.ui.componentsV2.header"
local input = require "lua.scripts.ui.componentsV2.input"
local constants = require "lua.scripts.ui.components.constants"
local image = require "lua.scripts.ui.componentsV2.image"
local footer = require "lua.scripts.ui.componentsV2.footer"
local nameplate = require "lua.scripts.ui.componentsV2.nameplate"
local complexButton = require "lua.scripts.ui.componentsV2.complexButton"
local box = require "lua.scripts.ui.componentsV2.box"
local pos = constants.position

widget.init [[insurrection/ui/menus/customization/]]

local optionsLayout = widget.align("horizontal", constants.components.complexButton.normal.width,
                                   pos.options.x, pos.options.y, 2)
local nameplatesLayout = widget.align("vertical", 26, pos.options.x, 170, 3)
local mapsLayout = widget.align("vertical", 24, pos.options.x, 170, 2)
local bipedsLayout = widget.align("vertical", 24,
                                  pos.options.x + constants.components.button.normal.width + 2, 170,
                                  2)

return container("customization_menu", {
    {
        header("customization", "INSURRECTION CUSTOMIZATION",
               "CUSTOMIZE DIFFERENT ASPECTS FROM YOUR INSURRECTION ACCOUNT"),
        pos.header.x,
        pos.header.y
    },
    {
        options("customization", "vertical", {
            {
                options("types", "horizontal", {
                    {complexButton("nameplates", "NAMEPLATES", "SELECT NAMEPLATE"), optionsLayout()},
                    {complexButton("bipeds", "BIPEDS", "SELECT BIPED"), optionsLayout()}
                })
            },
            {
                options("nameplates", "vertical", {
                    {button("scroll_nameplates_list_up", nil, {arrow = "up"}), nameplatesLayout()},
                    {nameplate("1"), nameplatesLayout()},
                    {nameplate("2"), nameplatesLayout()},
                    {nameplate("3"), nameplatesLayout()},
                    {nameplate("4"), nameplatesLayout()},
                    {nameplate("5"), nameplatesLayout()},
                    {nameplate("6"), nameplatesLayout()},
                    {nameplate("7"), nameplatesLayout()},
                    {
                        button("scroll_nameplates_list_down", nil, {arrow = "down"}),
                        nameplatesLayout()
                    }
                }, box("nameplate_description",
                       {{nameplate("preview", nil, {preview = true}), 254, 200}}))
            },
            {button("save_customization", "SAVE"), pos.back.x - 186, pos.back.y},
            {button("back", "BACK", {back = true}), pos.back.x, pos.back.y}
        })
    },
    {constants.components.currentProfile.path, 624, 20},
    {constants.components.version.path, 0, 460}
}, {
    conditionalWidgets = {
        {
            widget_tag = options("select_bipeds", "horizontal", {
                {
                    options("select_map_biped", "vertical", {
                        {button("scroll_bipeds_maps_list_up", nil, {arrow = "up"}), mapsLayout()},
                        {button("biped_map_1", string.rep(" ", 32)), mapsLayout()},
                        {button("biped_map_2", string.rep(" ", 32)), mapsLayout()},
                        {button("biped_map_3", string.rep(" ", 32)), mapsLayout()},
                        {button("biped_map_4", string.rep(" ", 32)), mapsLayout()},
                        {button("biped_map_5", string.rep(" ", 32)), mapsLayout()},
                        {button("biped_map_6", string.rep(" ", 32)), mapsLayout()},
                        {button("biped_map_7", string.rep(" ", 32)), mapsLayout()},
                        {button("scroll_bipeds_maps_list_down", nil, {arrow = "down"}), mapsLayout()}
                    })
                },
                {
                    options("select_custom_biped", "vertical", {
                        {button("scroll_bipeds_list_up", nil, {arrow = "up"}), bipedsLayout()},
                        {button("biped_1", string.rep(" ", 32)), bipedsLayout()},
                        {button("biped_2", string.rep(" ", 32)), bipedsLayout()},
                        {button("biped_3", string.rep(" ", 32)), bipedsLayout()},
                        {button("biped_4", string.rep(" ", 32)), bipedsLayout()},
                        {button("biped_5", string.rep(" ", 32)), bipedsLayout()},
                        {button("biped_6", string.rep(" ", 32)), bipedsLayout()},
                        {button("biped_7", string.rep(" ", 32)), bipedsLayout()},
                        {button("scroll_bipeds_list_down", nil, {arrow = "down"}), bipedsLayout()}
                    })
                }
            })
        }
    }
})
