local widget = require "lua.scripts.widget"
local ustr = require "lua.scripts.modules.ustr"
local constants = require "lua.scripts.ui.components.constants"
local image = require "lua.scripts.ui.componentsV2.image"
local floor = math.floor

---@class colorProps
---@field name string
---@field color string
---@field text? string

---Generic color button component
---@param props colorProps
---@return string
return function(props)
    local name = props.name
    local color = props.color
    local text = props.text

    local widgetPath = widget.path .. "buttons/" .. name .. "_color_button.ui_widget_definition"
    ---@type invaderWidget
    local wid = {
        widget_type = "text_box",
        bounds = widget.bounds(0, 0, 32, 32),
        flags = {pass_unhandled_events_to_focused_child = true},
        background_bitmap = "insurrection/ui/bitmaps/solid_red.bitmap",
        event_handlers = {
            {event_type = "a_button"},
            {
                event_type = "left_mouse",
                ["function"] = "mouse_emit_accept_event",
                flags = {run_function = true}
            }
        }
    }
    widget.createV2(widgetPath, wid)
    return widgetPath
end
