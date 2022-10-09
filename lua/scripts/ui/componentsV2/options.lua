local widget = require "lua.scripts.widget"
local constants = require "lua.scripts.ui.components.constants"
---Options list component, scroll trough elements using dpad, etc
---@param childWidgets invaderWidgetChildWidget
---@param alignment '"vertical"' | '"horizontal"'
---@param description? string Tag path for description to display
---@param props? {func?: string, branch?: true, conditionalWidgets?: invaderWidgetConditionalWidget[], dataInput?: string, eventsToChildren?: boolean, useItems?: boolean} Props of the component
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
    widget.createV2(widgetPath, wid)
    return widgetPath
end
