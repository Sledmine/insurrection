local constants = require "lua.scripts.ui.components.constants"
local widget = require "lua.scripts.widget"

---Menu container component, this is the first component that holds a screen
---@param name string Name of the menu container component
---@param childWidgets invaderWidgetChildWidget[] Child widgets to add to this menu container
---@param props? {script?: string, func?: string, branch?: boolean, conditionalWidgets?: invaderWidgetConditionalWidget[]} Properties of the menu container component
---@return string
return function(name, childWidgets, props)
    local props = props or {}
    local widgetPath = widget.path .. name .. ".ui_widget_definition"
    ---@type invaderWidget
    local wid = {
        bounds = constants.getScreenBounds(),
        background_bitmap = [[insurrection/ui/bitmaps/background_transparent.bitmap]],
        flags = {pass_unhandled_events_to_focused_child = true},
        event_handlers = {
            {
                event_type = "created",
                flags = {
                    run_scenario_script = props.script ~= nil and props.script ~= false,
                    try_to_branch_on_failure = props.branch or false,
                    run_function = props.func ~= nil and props.script ~= false
                },
                script = props.script,
                ["function"] = props.func
            }
        },
        child_widgets = childWidgets or {}
    }
    widget.createV2(widgetPath, wid)
    return widgetPath
end
