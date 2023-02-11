local widget = require "lua.scripts.widget"
local constants = require "lua.scripts.ui.components.constants"
local pos = constants.position
local description = require "lua.scripts.ui.componentsV2.description"
local container = require "lua.scripts.ui.componentsV2.container"
local options = require "lua.scripts.ui.componentsV2.options"
local button = require "lua.scripts.ui.componentsV2.button"
local header = require "lua.scripts.ui.componentsV2.header"

widget.init([[insurrection/ui/menus/classic_campaign_difficulty_select/]])
local layout = widget.align("vertical", 24, pos.options.x, pos.options.y, 2)

container("classic_campaign_difficulty_select_menu", {
    {
        options("difficulty_select_options", "vertical", {
            {button("easy", "EASY", {func = {"difficulty_item_select"}, select = true}), layout()},
            {button("normal", "NORMAL", {func = "difficulty_item_select", select = true}), layout()},
            {button("hard", "HEROIC", {func = "difficulty_item_select", select = true}), layout()},
            {
                button("impossible", "LEGENDARY", {func = "difficulty_item_select", select = true}),
                layout()
            },
            {
                options("actions_bar", "vertical", {
                    {[[insurrection/ui/shared/void.ui_widget_definition]], 0, 0},
                    {[[insurrection/ui/shared/void.ui_widget_definition]], 0, 0}
                }),
                layout()
            },
            {
                button("set_difficulty", "OK",
                       {func = {"set_difficulty", "main_menu_switch_to_solo_game"}}),
                layout()
            },
            {button("back_difficulty", "BACK", {back = true}), layout()}
        --}, [[ui/shell/main_menu/difficulty_select/difficulty_ext_desc.ui_widget_definition]], {
        }, description("difficulty_item", {}, [[insurrection/ui/bitmaps/difficulty_description.bitmap]], "difficulties"), {
            dataInput = "difficulty_menu_update_desc",
            func = "difficulty_menu_init",
            eventsToChildren = true,
            useItems = true
        })
    },
    {[[ui/shell/main_menu/difficulty_select/warning_message.ui_widget_definition]], 0, 0},
    {
        header("difficulty_select_header", "CHOOSE DIFFICULTY",
               "CHOOSE LEVEL DIFFICULTY AND START GAME"),
        pos.header.x,
        pos.header.y
    },
    {constants.components.currentProfile.path, 624, 20},
    {constants.components.version.path, 0, 460}
}, {dataInput = "warn_if_diff_will_nuke_saved_game"})
