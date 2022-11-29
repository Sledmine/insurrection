local widget = require "lua.scripts.widget"
local ustr = require "lua.scripts.modules.ustr"
local image = require "lua.scripts.ui.componentsV2.image"
local constants = require "lua.scripts.ui.components.constants"

---Complex button component
---@param name string Name of the component
---@param text string Text to display
---@param label string? Label of the button
---@param props? {back: boolean, opens: string, script: string, branch: boolean, func: string, close: boolean, variant: '"normal"' | '"vertical"' | '"horizontal"', icon?: string} Button properties
---@return string
return function(name, text, label, props)
    local props = props or {}
    props.variant = props.variant or "normal"
    local stringsTagPath
    if text then
        -- Generate strings tag
        stringsTagPath = widget.path .. "strings/" .. name .. "_button.unicode_string_list"
        ustr(stringsTagPath, {text, label})
    end
    local width, height = constants.components.complexButton[props.variant].width,
                          constants.components.complexButton[props.variant].height
    local widgetPath = widget.path .. "buttons/" .. name .. "_button.ui_widget_definition"
    ---@type invaderWidget
    local wid = {
        widget_type = "text_box",
        bounds = widget.bounds(0, 0, height, width),
        flags = {pass_unhandled_events_to_focused_child = true},
        background_bitmap = constants.components.complexButton[props.variant].bitmap,
        event_handlers = {
            {
                flags = {
                    open_widget = true,
                    run_function = props.func ~= nil,
                    go_back_to_previous_widget = props.back or false,
                    close_all_widgets = props.close or false
                },
                event_type = "a_button",
                widget_tag = openTag or ".ui_widget_definition",
                ["function"] = props.func,
                script = script or ""
            },
            {
                flags = {run_function = true},
                event_type = "left_mouse",
                ["function"] = "mouse_emit_accept_event",
                widget_tag = openTag or ".ui_widget_definition"
            }
        },
        text_label_unicode_strings_list = stringsTagPath,
        string_list_index = 0,
        text_font = constants.fonts.button,
        text_color = constants.color.text,
        justification = "left_justify",
        horiz_offset = 10,
        vert_offset = height - 25,
        child_widgets = {}
    }
    if props.icon then
        wid.child_widgets[#wid.child_widgets + 1] = {
            image(name .. "_button_icon", props.icon, 512, 512, 0.25),
            8,
            2
        }
    end
    if label then
        if props.variant == "vertical" then
            wid.vert_offset = wid.vert_offset - 10
        elseif props.variant == "horizontal" then
            wid.vert_offset = wid.vert_offset - 6
        end
        local labelPath = widget.path .. "buttons/" .. name .. "_button_label.ui_widget_definition"
        widget.createV2(labelPath, {
            widget_type = "text_box",
            bounds = wid.bounds,
            text_label_unicode_strings_list = stringsTagPath,
            string_list_index = 1,
            text_font = constants.fonts.text,
            text_color = constants.color.selected,
            justification = "left_justify",
            horiz_offset = wid.horiz_offset,
            vert_offset = wid.vert_offset + 12
        })
        wid.child_widgets[#wid.child_widgets + 1] = {labelPath}
    end
    widget.createV2(widgetPath, wid)
    return widgetPath
end
