local widget = require "lua.scripts.widget"
local constants = require "lua.scripts.ui.components.constants"

---@class optionsProps
---@field name string
---@field alignment? '"vertical"' | '"horizontal"'
---@field [1]? invaderWidgetChildWidget[]
---@field childs? invaderWidgetChildWidget[]
---@field description? string Tag path for description to display
---@field func? string
---@field branch? boolean
---@field conditionalWidgets? invaderWidgetConditionalWidget[]
---@field dataInput? string
---@field eventsToChildren? boolean
---@field useItems? boolean
---@field campaignMaps? boolean
---@field multiplayerMaps? string
---@field gametypes? string
---@field colorPicker? boolean
---@field width? number
---@field height? number

---Options list component, scroll trough elements using dpad, etc
---@param props optionsProps
---@return string
return function(props)
    local name = props.name
    local alignment = props.alignment or "vertical"
    local childWidgets = props[1] or props.childs
    local description = props.description

    local widgetPath = widget.path .. name .. "_options.ui_widget_definition"
    local bounds
    if props.width or props.height then
        bounds = widget.bounds(0, 0, props.height or 0, props.width or 0)
    end
    local isHorizontal = alignment == "horizontal"
    ---@type invaderWidget
    local wid = {
        widget_type = "column_list",
        -- For debug purposes
        --background_bitmap = [[insurrection/ui/bitmaps/solid_green.bitmap]],
        bounds = bounds or constants.getScreenBounds(),
        flags = {
            pass_unhandled_events_to_focused_child = true,
            dpad_up_down_tabs_thru_children = not isHorizontal,
            dpad_left_right_tabs_thru_children = isHorizontal,
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
        wid.flags.dpad_up_down_tabs_thru_list_items = not isHorizontal
        wid.flags.dpad_left_right_tabs_thru_list_items = isHorizontal
    end
    if props.dataInput then
        wid.game_data_inputs = {{["function"] = props.dataInput}}
    end
    if props.func or props.branch then
        wid.event_handlers = {
            {
                event_type = "created",
                flags = {run_function = true, try_to_branch_on_failure = props.branch ~= nil},
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
            -- ["function"] = "init_sp_level_list"
            ["function"] = "solo_level_set_map",
            widget_tag = [[insurrection/ui/menus/classic_campaign_difficulty_select/classic_campaign_difficulty_select_menu.ui_widget_definition]]
        }
    elseif props.multiplayerMaps then
        wid.event_handlers[#wid.event_handlers + 1] = {
            event_type = "created",
            flags = {run_function = true},
            ["function"] = "mp_level_list_initialize"
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
            ["function"] = "mp_profiles_list_initialize"
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
    elseif props.colorPicker then
        wid.event_handlers[#wid.event_handlers + 1] = {
            event_type = "created",
            flags = {run_function = true},
            ["function"] = "color_picker_menu_initialize"
        }
        wid.event_handlers[#wid.event_handlers + 1] = {
            event_type = "deleted",
            flags = {run_function = true},
            ["function"] = "color_picker_menu_dispose"
        }
        wid.event_handlers[#wid.event_handlers + 1] = {
            event_type = "custom_activation",
            flags = {run_function = true},
            ["function"] = "color_picker_select_color"
        }
    end
    widget.createV2(widgetPath, wid)
    return widgetPath
end
