local widget = require "lua.scripts.widget"
local button = require "lua.scripts.ui.componentsV2.button"

---Checkbox component
---@param name string Name of the component
---@param text string Text to display
---@param props? {variant: "large_button"} Properties of the menu container component
---@return string
return function(name, text, props)
    local props = props or {}
    local widgetPath = widget.path .. name .. "_checkbox.ui_widget_definition"
    ---@type invaderWidget
    local checkbox = {
        widget_type = "text_box",
        bounds = "0, 0, 14, 14",
        flags = {pass_unhandled_events_to_focused_child = true},
        background_bitmap = [[insurrection/ui/bitmaps/checkbox.bitmap]],
        event_handlers = {{event_type = "a_button"}}
    }
    widget.createV2(widgetPath, checkbox)
    -- TODO Add large button variant
    if props.variant == "large_button" then
    end
    return button(name .. "_checkbox", text, {
        childs = {{widget_tag = widgetPath, horizontal_offset = 184 - 14 - 5, vertical_offset = 5}}
    })
end
