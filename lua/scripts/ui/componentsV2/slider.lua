local widget = require "lua.scripts.widget"

---Slider button component
---@param name string
---@param direction "left" | "right"
---@param props? {func?: string, legacy?: boolean}
---@return string
return function(name, direction, props)
    local props = props or {}
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
