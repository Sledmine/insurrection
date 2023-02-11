local widget = require "lua.scripts.widget"
local container = require "lua.scripts.ui.componentsV2.container"
local header = require "lua.scripts.ui.componentsV2.header"
local options = require "lua.scripts.ui.componentsV2.options"
local button = require "lua.scripts.ui.componentsV2.button"
local description = require "lua.scripts.ui.componentsV2.description"
local constants = require "lua.scripts.ui.components.constants"
local pos = constants.position

widget.init([[insurrection/ui/menus/singleplayer/]])
local layout = widget.align("vertical", 24, pos.options.x, pos.options.y, 2)

container("singleplayer_menu", {
    {
        header("singleplayer_menu_header", "SINGLEPLAYER", "PLAY A SINGLEPLAYER CAMPAIGN PROJECT"),
        pos.header.x,
        pos.header.y
    },
    {
        options("singleplayer_menu_options", "vertical", {
            {
                button("classic_campaign", "CLASSIC CAMPAIGN", {
                    opens = [[insurrection/ui/menus/classic_campaign/classic_campaign_menu.ui_widget_definition]]
                }),
                layout()
            },
            {button("back", "BACK", {back = true}), pos.back.x, pos.back.y}
        }, description("singleplayer_maps", {
            "Classic Campaign - While the Covenant had us locked up in here, I overheard the guards talking about this ring world.\r\nThey call it... Halo.",
        }, [[insurrection/ui/bitmaps/previews/singleplayer/classic_campaign.bitmap]]))
    },
    {constants.components.currentProfile.path, 624, 20},
    {constants.components.version.path, 0, 460}
})
