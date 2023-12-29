local constants = require "lua.scripts.ui.components.constants"
local widget = require "lua.scripts.widget"

---@class wrapperProps
---@field name string
---@field width? number
---@field height? number
---@field childs? invaderWidgetChildWidget[]
---@field background? string
---@field isClickable? boolean

---Wrapper component serves the purpose of wrapping widgets as a container given size
---@param props wrapperProps
---@return string
return function(props)
    local name = props.name
    local childWidgets = props[1] or props.childs
    local width = props.width or constants.screen.width
    local height = props.height or constants.screen.height
    local path = widget.path .. name .. "_wrapper.ui_widget_definition"
    local background = props.background
    local isClickable = props.isClickable

    ---@type invaderWidget
    local wid = {
        widget_type = isClickable and "text_box" or "container",
        bounds = widget.bounds(0, 0, height, width),
        background_bitmap = background,
        flags = {pass_unhandled_events_to_focused_child = true},
        child_widgets = childWidgets or {}
    }
    if isClickable then
        wid.flags.pass_unhandled_events_to_focused_child = false
        wid.event_handlers = {
            {event_type = "a_button"},
            {
                event_type = "left_mouse",
                flags = {run_function = true},
                ["function"] = "mouse_emit_accept_event"
            }
        }
    end

    widget.createV2(path, wid)
    return path
end
