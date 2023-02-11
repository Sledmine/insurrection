local widget = require "lua.scripts.widget"
local container = require "lua.scripts.ui.componentsV2.container"
local options = require "lua.scripts.ui.componentsV2.options"
local button = require "lua.scripts.ui.componentsV2.button"
local image = require "lua.scripts.ui.componentsV2.image"
local constants = require "lua.scripts.ui.components.constants"

widget.init([[insurrection/ui/menus/classic_campaign/]])
local layout = widget.align("vertical", 24, 335, 312, 2)

container("classic_campaign_menu", {
    {
        image("classic_halo", [[insurrection/ui/bitmaps/classic_halo_logo.bitmap]], 800, 346, 0.5),
        227,
        85
    },
    {
        options("singleplayer_menu_options", "vertical", {
            {
                button("continue", "CONTINUE",
                       {func = "campaign_menu_continue", justification = "center_justify"}),
                layout()
            },
            {
                button("new_journey", "NEW JOURNEY", {
                    opens = [[insurrection/ui/menus/classic_campaign_level_select/classic_campaign_level_select_menu.ui_widget_definition]],
                    justification = "center_justify"
                }),
                layout()
            },
            {
                button("load_checkpoint", "LOAD CHECKPOINT", {
                    opens = [[ui/shell/main_menu/campaign_select/load_level_select_screen.ui_widget_definition]],
                    justification = "center_justify"
                }),
                layout()
            },
            {button("back_menu", "BACK", {back = true, justification = "center_justify"}), layout()}
        }, nil, {
            func = "campaign_menu_init",
            branch = true,
            conditionalWidgets = {
                {
                    widget_tag = [[insurrection/ui/menus/classic_campaign_difficulty_select/classic_campaign_difficulty_select_menu.ui_widget_definition]],
                    name = [[difficulty]],
                    flags = {load_if_event_handler_function_fails = true}
                }
            }
        })
    },
    {constants.components.currentProfile.path, 624, 20},
    {constants.components.version.path, 0, 460}
})
