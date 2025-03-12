local widget = require "lua.scripts.widget"
local container = require "lua.scripts.ui.componentsV3.container"
local header = require "lua.scripts.ui.componentsV3.header"
local options = require "lua.scripts.ui.componentsV3.options"
local button = require "lua.scripts.ui.componentsV3.button"
local constants = require "lua.scripts.ui.components.constants"
local pos = constants.position

widget.init [[insurrection/ui/menus/mods/]]

local layout = widget.align("vertical", 24, pos.options.x, pos.options.y, 2)

return container {
    name = "mods_menu",
    background = "transparent",
    childs = {
        {
            header {
                name = "mods_menu",
                title = "MODS CUSTOMIZATION",
                subtitle = "CUSTOMIZE DIFFERENT MODS FROM THE COMMUNITY"
            },
            pos.header.x,
            pos.header.y
        },
        {
            options {
                name = "mods_menu",
                alignment = "vertical",
                childs = {
                    {
                        button {
                            name = "chimera",
                            text = "CHIMERA",
                            opens = [[insurrection/ui/menus/mods/chimera/chimera_mod_menu.ui_widget_definition]]
                        },
                        layout()
                    },
                    {
                        button {
                            name = "balltze",
                            text = "BALLTZE",
                            opens = [[insurrection/ui/menus/balltze/balltze_mod_menu.ui_widget_definition]]
                        },
                        layout()
                    },
                    {
                        button {
                            name = "insurrection",
                            text = "INSURRECTION",
                            opens = [[insurrection/ui/menus/settings_custom/settings_menu_custom.ui_widget_definition]]
                        },
                        layout()
                    },
                    {button {name = "back", text = "BACK", back = true}, pos.back.x, pos.back.y}
                }
            }
        },
        {constants.components.version.path, 0, 460}
    }
}
