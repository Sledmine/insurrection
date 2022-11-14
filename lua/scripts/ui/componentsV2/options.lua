local widget = require "lua.scripts.widget"
local constants = require "lua.scripts.ui.components.constants"
---Options list component, scroll trough elements using dpad, etc
---@param name string
---@param childWidgets invaderWidgetChildWidget
---@param alignment '"vertical"' | '"horizontal"'
---@param description? string Tag path for description to display
---@param props? {func?: string, branch?: true, conditionalWidgets?: invaderWidgetConditionalWidget[], dataInput?: string, eventsToChildren?: boolean, useItems?: boolean, campaignMaps?: true, multiplayerMaps?: string, gametypes: string} Props of the component
---@return string
return function(name, alignment, childWidgets, description, props)
    local props = props or {}
    local widgetPath = widget.path .. name .. ".ui_widget_definition"
    local horizontal = alignment == "horizontal"
    ---@type invaderWidget
    local wid = {
        widget_type = "column_list",
        bounds = constants.getScreenBounds(),
        flags = {
            pass_unhandled_events_to_focused_child = true,
            dpad_up_down_tabs_thru_children = not horizontal,
            dpad_left_right_tabs_thru_children = horizontal,
            pass_handled_events_to_all_children = props.eventsToChildren or false
        },
        child_widgets = childWidgets or {},
        event_handlers = {},
        extended_description_widget = description or ".ui_widget_definition",
        conditional_widgets = props.conditionalWidgets
    }
    if props.useItems then
        wid.flags.dpad_up_down_tabs_thru_children = false
        wid.flags.dpad_left_right_tabs_thru_children = false
        wid.flags.dpad_up_down_tabs_thru_list_items = not horizontal
        wid.flags.dpad_left_right_tabs_thru_list_items = horizontal
    end
    if props.dataInput then
        wid.game_data_inputs = {{["function"] = props.dataInput}}
    end
    if props.func or props.branch then
        wid.event_handlers = {
            {
                event_type = "created",
                flags = {
                    run_function = true,
                    try_to_branch_on_failure = props.branch ~= nil
                },
                ["function"] = props.func
            }
        }
    end
    if props.campaignMaps then
        wid.event_handlers[#wid.event_handlers + 1] = {
            event_type = "deleted",
            flags = {run_function = true},
            ["function"] = "dispose_sp_level_list"
        }
        wid.event_handlers[#wid.event_handlers + 1] = {
            event_type = "custom_activation",
            flags = {run_function = true, open_widget = true},
            --["function"] = "init_sp_level_list"
            ["function"] = "solo_level_set_map",
            widget_tag = [[insurrection/ui/menus/classic_campaign_difficulty_select/classic_campaign_difficulty_select_menu.ui_widget_definition]],
        }
    elseif props.multiplayerMaps then
        wid.event_handlers[#wid.event_handlers + 1] = {
            event_type = "created",
            flags = {run_function = true},
            ["function"] = "mp_level_list_initialize",
        }
        wid.event_handlers[#wid.event_handlers + 1] = {
            event_type = "deleted",
            flags = {run_function = true},
            ["function"] = "mp_level_list_dispose"
        }
        wid.event_handlers[#wid.event_handlers + 1] = {
            event_type = "custom_activation",
            flags = {run_function = true, open_widget = true},
            ["function"] = "mp_level_select",
            widget_tag = props.multiplayerMaps
        }
    elseif props.gametypes then
        wid.event_handlers[#wid.event_handlers + 1] = {
            event_type = "created",
            flags = {run_function = true},
            ["function"] = "mp_profiles_list_initialize",
        }
        wid.event_handlers[#wid.event_handlers + 1] = {
            event_type = "deleted",
            flags = {run_function = true},
            ["function"] = "mp_profiles_list_dispose"
        }
        wid.event_handlers[#wid.event_handlers + 1] = {
            event_type = "custom_activation",
            flags = {run_function = true, open_widget = true},
            ["function"] = "mp_profile_set_for_game",
            widget_tag = props.gametypes
        }
    end
    widget.createV2(widgetPath, wid)
    return widgetPath
end
