local widget = require "lua.scripts.widget"
local ustr = require "lua.scripts.modules.ustr"
local constants = require "lua.scripts.ui.components.constants"

---@class spinnerProps
---@field name string
---@field text string
---@field value string
---@field variant? "normal" | "large"
---@field length? number

---Spinner component
---@param props spinnerProps
---@return string
return function(props)
    local name = props.name
    local text = props.text
    local value = props.value
    local variant = props.variant or "normal"
    local width, height = constants.components.button[variant].width,
                          constants.components.button[variant].height
    local length = props.length or #value * 4

    local arrowLeftPath = widget.path .. "buttons/" .. name ..
                              "_spinner_arrow_left.ui_widget_definition"
    ---@type invaderWidget
    local arrowWidget = {
        widget_type = "text_box",
        background_bitmap = constants.components.arrow.left.bitmap,
        bounds = widget.bounds(0, 0, constants.components.arrow.left.height,
                               constants.components.arrow.left.width),
        event_handlers = {
            {event_type = "a_button"},
            {
                event_type = "left_mouse",
                ["function"] = "mouse_emit_accept_event",
                flags = {run_function = true}
            }
        }
    }
    widget.createV2(arrowLeftPath, arrowWidget)
    local arrowRightPath = widget.path .. "buttons/" .. name ..
                               "_spinner_arrow_right.ui_widget_definition"
    arrowWidget.background_bitmap = constants.components.arrow.right.bitmap
    arrowWidget.bounds = widget.bounds(0, 0, constants.components.arrow.right.height,
                                       constants.components.arrow.right.width)
    widget.createV2(arrowRightPath, arrowWidget)

    local stringsTagPath = widget.path .. "strings/" .. name .. "_spinner.unicode_string_list"
    ustr(stringsTagPath, {text, value})

    local rightArrowX = width - 20
    local valueX = rightArrowX - length - 64
    local leftArrowX = valueX - 1
    local widgetPath = widget.path .. "buttons/" .. name .. "_spinner.ui_widget_definition"
    ---@type invaderWidget
    local spinnerWidget = {
        widget_type = "text_box",
        flags = {
            pass_unhandled_events_to_focused_child = true,
            dpad_left_right_tabs_thru_children = true
        },
        bounds = "0, 0, " .. height .. ", " .. width,
        background_bitmap = constants.components.button[variant].bitmap,
        text_label_unicode_strings_list = stringsTagPath,
        string_list_index = 0,
        justification = "left_justify",
        text_color = constants.color.text,
        text_font = constants.fonts.button,
        horiz_offset = 10,
        vert_offset = 5,
        child_widgets = {
            {widget_tag = arrowLeftPath, horizontal_offset = leftArrowX, vertical_offset = 4},
            {widget_tag = arrowRightPath, horizontal_offset = rightArrowX, vertical_offset = 4}
        }
    }

    -- Generate label
    local labelPath = widget.path .. "buttons/" .. name .. "_spinner_label.ui_widget_definition"
    ---@type invaderWidget
    local labelWidget = {
        widget_type = "text_box",
        bounds = spinnerWidget.bounds,
        text_label_unicode_strings_list = stringsTagPath,
        string_list_index = 1,
        justification = "center_justify",
        text_color = constants.color.text,
        text_font = constants.fonts.button,
        vert_offset = 5,
        horiz_offset = valueX,
    }
    widget.createV2(labelPath, labelWidget)
    table.insert(spinnerWidget.child_widgets, {labelPath})

    widget.createV2(widgetPath, spinnerWidget)
    return widgetPath
end
