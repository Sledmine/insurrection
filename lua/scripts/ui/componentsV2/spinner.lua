local widget = require "lua.scripts.widget"
local ustr = require "lua.scripts.modules.ustr"
local constants = require "lua.scripts.ui.components.constants"

---Spinner component
---@param name string Name of the component
---@param text? string Text to display
---@param values string[] Value to display
---@param props? {variant: '"normal"' | '"large"', func?: string, length?: number} Component properties
---@return string
return function(name, text, values, props)
    local props = props or {}
    props.variant = props.variant or "normal"
    local stringsTagPath
    -- Generate strings tag
    stringsTagPath = widget.path .. "strings/" .. name .. "_spinner.unicode_string_list"
    ustr(stringsTagPath, values)
    -- Variables
    local longestValueStringLength = props.length or 0
    for _, value in ipairs(values) do
        if #value > longestValueStringLength then
            longestValueStringLength = #value
        end
    end
    local textLengthScaleFactor = 4
    local widgetPath = widget.path .. "buttons/" .. name .. "_spinner.ui_widget_definition"
    local width, height = constants.components.button[props.variant].width,
                          constants.components.button[props.variant].height
    ---@type invaderWidget
    local wid = {
        widget_type = "container",
        flags = {pass_unhandled_events_to_focused_child = true},
        bounds = "0, 0, " .. height .. ", " .. width,
        background_bitmap = constants.components.button[props.variant].bitmap,
        event_handlers = {
            {
                event_type = "left_mouse",
                ["function"] = "mouse_emit_accept_event",
                flags = {run_function = true}
            }
        },
        child_widgets = {}
    }
    -- Arrow data for left and right
    local arrowX = width - 48 - longestValueStringLength * textLengthScaleFactor
    local arrowY = -1
    local arrowHeight = constants.components.arrow.left.height
    local arrowWidth = constants.components.arrow.left.width
    local arrowMargin = 32 + longestValueStringLength * textLengthScaleFactor
    local arrowBoundWidth = width - arrowX

    if text then
        -- Generate label
        local labelPath = widget.path .. "buttons/" .. name .. "_spinner_label.ui_widget_definition"
        local stringsTagPath = widget.path .. "strings/" .. name ..
                                   "_spinner_label.unicode_string_list"
        ustr(stringsTagPath, {text})
        ---@type invaderWidget
        local labelWidget = {
            widget_type = "text_box",
            bounds = wid.bounds,
            text_label_unicode_strings_list = stringsTagPath,
            string_list_index = 0,
            justification = "left_justify",
            text_color = constants.color.text,
            text_font = constants.fonts.button,
            horiz_offset = 10,
            vert_offset = 5
        }
        widget.createV2(labelPath, labelWidget)
        table.insert(wid.child_widgets, {labelPath})
    end
    local arrowsPath = widget.path .. "buttons/" .. name .. "_spinner_arrows.ui_widget_definition"
    ---@type invaderWidget
    local arrowsWidget = {
        widget_type = "spinner_list",
        bounds = "0, 0, " .. height .. ", " .. arrowBoundWidth,
        flags = {
            pass_unhandled_events_to_focused_child = true,
            dpad_left_right_tabs_thru_list_items = true
        },
        event_handlers = {
            {
                flags = {run_function = true},
                event_type = "a_button",
                ["function"] = props.func or "mouse_spinner_1wide_click"
            }
        },
        text_label_unicode_strings_list = stringsTagPath,
        string_list_index = 0,
        text_font = constants.fonts.text,
        text_color = constants.color.text,
        justification = "center_justify",
        horiz_offset = 0,
        vert_offset = 0
    }
    if not text then
        arrowsWidget.justification = "left_justify"
        wid.child_widgets[#wid.child_widgets + 1] = {arrowsPath, 10, 5}
    else
        wid.child_widgets[#wid.child_widgets + 1] = {arrowsPath, arrowX, 5}
    end
    if #values > 1 then
        arrowsWidget.flags_2 = {list_items_from_string_list_tag = true}
        arrowsWidget.list_header_bitmap = constants.components.arrow.left.bitmap
        arrowsWidget.list_footer_bitmap = constants.components.arrow.right.bitmap
        arrowsWidget.header_bounds = widget.bounds(arrowY, 0, arrowY + arrowHeight, arrowWidth)
        arrowsWidget.footer_bounds = widget.bounds(arrowY, arrowMargin, arrowY + arrowHeight,
                                                   arrowMargin + arrowWidth)
    else
        arrowsWidget.bounds = "0, 0, " .. height .. ", " .. arrowBoundWidth - 10
        arrowsWidget.widget_type = "text_box"
        arrowsWidget.string_list_index = 0
        arrowsWidget.text_label_unicode_strings_list = nil
        arrowsWidget.justification = "right_justify"
    end
    widget.createV2(arrowsPath, arrowsWidget)

    widget.createV2(widgetPath, wid)
    return widgetPath
end
