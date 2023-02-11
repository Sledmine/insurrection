local widget = require "lua.scripts.widget"
local container = require "lua.scripts.ui.componentsV2.container"
local header = require "lua.scripts.ui.componentsV2.header"
local options = require "lua.scripts.ui.componentsV2.options"
local button = require "lua.scripts.ui.componentsV2.button"
local constants = require "lua.scripts.ui.components.constants"
local pos = constants.position

widget.init [[insurrection/ui/menus/mods/]]

local layout = widget.align("vertical", 24, pos.options.x, pos.options.y, 2)

return container("mods_menu", {
    {
        header("mods_menu", "MODS CUSTOMIZATION", "CUSTOMIZE DIFFERENT MODS FROM THE COMMUNITY"),
        pos.header.x,
        pos.header.y
    },
    {
        options("mods_menu", "vertical", {
            {
                button("chimera", "CHIMERA", {
                    opens = [[insurrection/ui/menus/mods/chimera/chimera_mod_menu.ui_widget_definition]]
                }),
                layout()
            },
            --{button("optic", "OPTIC", {}), layout()},
            {button("back", "BACK", {back = true}), pos.back.x, pos.back.y}
        })
    },
    {[[insurrection/ui/shared/current_profile/buttons/nameplate_current_profile.ui_widget_definition]], 624, 20},
    {[[insurrection/ui/shared/version.ui_widget_definition]], 0, 460}
})
