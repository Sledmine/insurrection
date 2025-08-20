local constants = require "lua.scripts.ui.components.constants"
local widget = require "lua.scripts.widget"

---@class boxProps
---@field name string
---@field childs? invaderWidgetChildWidget[]

---Box component it only acts as a container of widgets
---@param props boxProps
---@return string
return function(props)
    local name = props.name
    local childWidgets = props[1] or props.childs

    local widgetPath = widget.path .. name .. ".ui_widget_definition"
    ---@type invaderWidget
    local wid = {
        bounds = constants.getScreenBounds(),
        flags = {pass_unhandled_events_to_focused_child = true},
        child_widgets = childWidgets or {}
    }
    widget.createV2(widgetPath, wid)
    return widgetPath
end
