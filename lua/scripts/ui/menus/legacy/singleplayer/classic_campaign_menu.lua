local widget = require "lua.scripts.widget"
local container = require "lua.scripts.ui.componentsV2.container"
local header = require "lua.scripts.ui.componentsV2.header"
local options = require "lua.scripts.ui.componentsV2.options"
local button = require "lua.scripts.ui.componentsV2.button"
local description = require "lua.scripts.ui.componentsV2.description"
local constants = require "lua.scripts.ui.components.constants"
local pos = constants.position

widget.init([[insurrection/ui/menus/classic_campaign/]])
local layout = widget.align("vertical", 24, 335, 312, 2)

container("classic_campaign_menu", {
    {[[insurrection/ui/shared/halo_custom_edition_logo.ui_widget_definition]], 227, 57},
    {
        options("singleplayer_menu_options", "vertical", {
            {
                button("continue", "CONTINUE",
                       {func = "campaign_menu_continue", justification = "center_justify"}),
                layout()
            },
            {
                button("new_game", "NEW GAME", {
                    opens = [[ui/shell/main_menu/solo_level_select/solo_level_select_screen.ui_widget_definition]],
                    justification = "center_justify"
                }),
                layout()
            },
            {
                button("load_game", "LOAD GAME", {
                    opens = [[ui/shell/main_menu/campaign_select/load_level_select_screen.ui_widget_definition]],
                    justification = "center_justify"
                }),
                layout()
            },
            {button("back", "BACK", {back = true, justification = "center_justify"}), layout()}
        })
    },
    -- {[[insurrection/ui/shared/current_profile.ui_widget_definition]], 624, 20},
    {[[insurrection/ui/shared/version.ui_widget_definition]], 0, 460}
}, {
    func = "campaign_menu_init",
    branch = true,
    conditionalWidgets = {
        {
            widget_tag = [[ui/shell/main_menu/difficulty_select/difficulty_select_list_screen.ui_widget_definition]],
            name = [[difficulty]],
            flags = {load_if_event_handler_function_fails = true}
        }
    }
})
