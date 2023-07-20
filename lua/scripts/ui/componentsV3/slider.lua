local widget = require "lua.scripts.widget"

---@class sliderProps
---@field name string
---@field direction "left" | "right"
---@field func? string
---@field legacy? boolean

---Slider button component
---@param props sliderProps
---@return string
return function(props)
    local name = props.name
    local direction = props.direction or "left"
    
    local backgroundBitmap = [[insurrection/ui/bitmaps/arrow_button_left.bitmap]]
    if direction == "right" then
        backgroundBitmap = [[insurrection/ui/bitmaps/arrow_button_right.bitmap]]
    end
    local widgetPath = widget.path .. "buttons/" .. name .. "_slider_button.ui_widget_definition"
    ---@type invaderWidget
    local wid = {
        widget_type = "text_box",
        bounds = "0, 0, 97, 15",
        flags = {pass_unhandled_events_to_focused_child = true},
        background_bitmap = backgroundBitmap,
        event_handlers = {
            {event_type = "a_button", flags = {run_function = true}, ["function"] = props.func},
            {
                flags = {run_function = true},
                event_type = "left_mouse",
                ["function"] = "mouse_emit_accept_event"
            }
        },
        child_widgets = {}
    }
    if props.legacy then
        wid.child_widgets[#wid.child_widgets + 1] = {
            [[insurrection/ui/shared/void.ui_widget_definition]]
        }
        wid.child_widgets[#wid.child_widgets + 1] = {
            [[insurrection/ui/shared/void.ui_widget_definition]]
        }
        wid.child_widgets[#wid.child_widgets + 1] = {
            [[insurrection/ui/shared/void.ui_widget_definition]]
        }
        wid.child_widgets[#wid.child_widgets + 1] = {
            [[insurrection/ui/shared/void.ui_widget_definition]]
        }
    end
    widget.createV2(widgetPath, wid)
    return widgetPath
end
