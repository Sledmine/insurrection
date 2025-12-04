local widget = require "lua.scripts.widget"
local constants = require "lua.scripts.ui.components.constants"
local container = require "lua.scripts.ui.componentsV3.container"
local header = require "lua.scripts.ui.componentsV3.header"
local options = require "lua.scripts.ui.componentsV3.options"
local button = require "lua.scripts.ui.componentsV3.button"
local description = require "lua.scripts.ui.componentsV2.description"
local pos = constants.position

widget.init [[insurrection/ui/menus/singleplayer/]]
local layout = widget.align("vertical", 24, pos.options.x, pos.options.y, 2)

local name = "singleplayer_menu"

return container {
    name = name,
    background = "transparent",
    childs = {
        {
            header {
                name = name,
                title = "SINGLEPLAYER",
                subtitle = "PLAY A SINGLEPLAYER CAMPAIGN PROJECT"
            },
            pos.header.x,
            pos.header.y
        },
        {
            options {
                name = name,
                alignment = "vertical",
                description = description("singleplayer_maps", {
                    "Classic Campaign - While the Covenant had us locked up in here, I overheard the guards talking about this ring world.\r\nThey call it... Halo."
                }, [[insurrection/ui/bitmaps/previews/singleplayer/classic_campaign.bitmap]]),
                childs = {
                    {
                        button {
                            name = "classic_campaign",
                            text = "CLASSIC CAMPAIGN",
                            opens = [[insurrection/ui/menus/classic_campaign/classic_campaign_menu.ui_widget_definition]]
                        },
                        layout()
                    },
                    {
                        button {name = "back", text = "BACK", back = true, variant = "small"},
                        pos.back.x,
                        pos.back.y
                    }
                }
            }
        },
        {constants.components.currentProfile.path, pos.nameplate.x, pos.nameplate.y},
        {constants.components.version.path, pos.version.x, pos.version.y}
    }
}
