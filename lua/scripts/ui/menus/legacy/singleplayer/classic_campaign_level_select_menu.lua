local widget = require "lua.scripts.widget"
local constants = require "lua.scripts.ui.components.constants"
local pos = constants.position
local description = require "lua.scripts.ui.componentsV2.description"
local container = require "lua.scripts.ui.componentsV2.container"
local options = require "lua.scripts.ui.componentsV2.options"
local button = require "lua.scripts.ui.componentsV2.button"
local header = require "lua.scripts.ui.componentsV2.header"

widget.init([[insurrection/ui/menus/classic_campaign_level_select/]])
local layout = widget.align("vertical", 24, pos.options.x, pos.options.y, 2)

container("classic_campaign_level_select_menu", {
    {
        header("classic_campaign_level_select_header", "SELECT CAMPAIGN LEVEL",
               "CHOOSE A LEVEL TO PLAY"),
        pos.header.x,
        pos.header.y
    },
    {
        options("level_select_options", "vertical", {
            {
                button("a10", "The Pillar of Autumn",
                       {select = true, func = "single_prev_cl_item_activated", legacy = true}),
                layout()
            },
            {
                button("a30", "Halo",
                       {select = true, func = "single_prev_cl_item_activated", legacy = true}),
                layout()
            },
            {
                button("a50", "The Truth and Reconciliation",
                       {select = true, func = "single_prev_cl_item_activated", legacy = true}),
                layout()
            },
            {
                button("b30", "The Silent Cartographer",
                       {select = true, func = "single_prev_cl_item_activated", legacy = true}),
                layout()
            },
            {
                button("b40", "Assault on the Control Room",
                       {select = true, func = "single_prev_cl_item_activated", legacy = true}),
                layout()
            },
            {
                button("c10", "343 Guilty Spark",
                       {select = true, func = "single_prev_cl_item_activated", legacy = true}),
                layout()
            },
            {
                button("c20", "The Library",
                       {select = true, func = "single_prev_cl_item_activated", legacy = true}),
                layout()
            },
            {
                button("c40", "Two Betrayals",
                       {select = true, func = "single_prev_cl_item_activated", legacy = true}),
                layout()
            },
            {
                button("d20", "Keyes",
                       {select = true, func = "single_prev_cl_item_activated", legacy = true}),
                layout()
            },
            {
                button("d40", "The Maw",
                       {select = true, func = "single_prev_cl_item_activated", legacy = true}),
                layout()
            },
            -- {
            --    [[ui/shell/main_menu/solo_level_select/solo_level_select_button_bar.ui_widget_definition]],
            --    0,
            --    0
            -- }
            {
                options("actions_bar", "horizontal", {
                    {
                        button("play_level", "OK", {func = "emit_custom_activation_event"}),
                        pos.back.x - 186,
                        pos.back.y
                    },
                    {button("back_difficulty", "BACK", {back = true}), pos.back.x, pos.back.y}
                }),
                0,
                0
            },
        --}, [[ui/shell/main_menu/solo_level_select/solo_level_extended_desc.ui_widget_definition]], {
        }, description("classic_campaign_item", {}, [[insurrection/ui/bitmaps/classic_campaign_previews.bitmap]], "campaign"), {
            dataInput = "solo_map_list_update",
            func = "initialize_sp_level_list_solo",
            campaignMaps = true
        })
    },
    {constants.components.currentProfile.path, 624, 20},
    {constants.components.version.path, 0, 460}
})
