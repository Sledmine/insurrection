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
local pos = constants.position

widget.init [[insurrection/ui/menus/customization/]]

local optionsLayout = widget.align("horizontal", constants.components.complexButton.normal.width,
                                   pos.options.x, pos.options.y, 2)
local nameplatesLayout = widget.align("vertical", 26, pos.options.x, 170, 3)

return container("customization_menu", {
    {
        header("customization", "INSURRECTION CUSTOMIZATION",
               "CUSTOMIZE DIFFERENT ASPECTS FROM YOUR INSURRECTION ACCOUNT"),
        pos.header.x,
        pos.header.y
    },
    {
        options("nameplates", "vertical", {
            {
                options("customization", "horizontal", {
                    {complexButton("nameplates", "NAMEPLATES", "SELECT NAMEPLATE"), optionsLayout()},
                    {complexButton("bipeds", "BIPEDS", "SELECT BIPED"), optionsLayout()}
                })
            },
            {
                button("scroll_nameplates_list_up", nil, {legacy = true, arrow = "up"}),
                nameplatesLayout()
            },
            {nameplate("1"), nameplatesLayout()},
            {nameplate("2"), nameplatesLayout()},
            {nameplate("3"), nameplatesLayout()},
            {nameplate("4"), nameplatesLayout()},
            {nameplate("5"), nameplatesLayout()},
            {nameplate("6"), nameplatesLayout()},
            {nameplate("7"), nameplatesLayout()},
            {
                button("scroll_nameplates_list_down", nil, {legacy = true, arrow = "down"}),
                nameplatesLayout()
            },
            {button("save_customization", "SAVE"), pos.back.x - 186, pos.back.y},
            {button("back", "BACK", {back = true}), pos.back.x, pos.back.y}
        })
    },
    {nameplate("preview", nil, {preview = true}), 254, 200},
    {[[insurrection/ui/shared/current_profile.ui_widget_definition]], 624, 20},
    {[[insurrection/ui/shared/version.ui_widget_definition]], 0, 460}
})
