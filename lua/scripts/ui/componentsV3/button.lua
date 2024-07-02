local widget = require "lua.scripts.widget"
local ustr = require "lua.scripts.modules.ustr"
local constants = require "lua.scripts.ui.components.constants"
local image = require "lua.scripts.ui.componentsV2.image"
local floor = math.floor

---@class buttonProps
---@field name string
---@field text? string
---@field back? boolean
---@field opens? string
---@field script? string
---@field branch? boolean
---@field func? string | string[]
---@field select? boolean
---@field justification? "left_justify" | "center_justify" | "right_justify"
---@field legacy? boolean
---@field close? boolean
---@field arrow? "up" | "down"
---@field variant? "small" | "normal" | "large"
---@field childs? invaderWidgetChildWidget[]

---Generic button component, recycled in multiple components
---@param props buttonProps
---@return string
return function(props)
    local name = props.name
    local text = props.text
    local variant = props.variant or "normal"

    local stringsTagPath
    if text then
        -- Generate strings tag
        stringsTagPath = widget.path .. "strings/" .. name .. "_button.unicode_string_list"
        ustr(stringsTagPath, {text})
    end
    local widgetPath = widget.path .. "buttons/" .. name .. "_button.ui_widget_definition"
    ---@type invaderWidget
    local wid = {
        widget_type = "text_box",
        bounds = widget.bounds(0, 0, constants.components.button[variant].height,
                               constants.components.button[variant].width),
        flags = {pass_unhandled_events_to_focused_child = true},
        background_bitmap = constants.components.button[variant].bitmap,
        event_handlers = {
            {
                flags = {
                    open_widget = props.opens ~= nil,
                    run_function = props.func ~= nil,
                    go_back_to_previous_widget = props.back or false,
                    try_to_branch_on_failure = props.branch or false,
                    close_all_widgets = props.close or false
                },
                event_type = "a_button",
                widget_tag = props.opens,
                script = props.script
            }
        },
        text_label_unicode_strings_list = stringsTagPath,
        string_list_index = 0,
        text_font = constants.fonts.button,
        text_color = constants.color.text,
        justification = props.justification or "left_justify",
        horiz_offset = 10,
        vert_offset = 5,
        child_widgets = props.childs or {}
    }
    if props.justification == "center_justify" then
        -- Because of rescale stuff
        wid.horiz_offset = 0
    end
    if props.select then
        wid.text_color = constants.color.selected
        wid.background_bitmap = [[insurrection/ui/bitmaps/normal_button_select.bitmap]]
    end
    if props.legacy then
        ---@type invaderWidget
        local widgetText = {
            widget_type = "text_box",
            bounds = wid.bounds,
            string_list_index = 0,
            text_font = constants.fonts.text,
            text_color = wid.text_color,
            justification = props.justification or "left_justify",
            horiz_offset = 10,
            vert_offset = 5
        }
        if text then
            wid.text_label_unicode_strings_list = nil
            widgetText.text_label_unicode_strings_list = stringsTagPath
        end
        local widgetTextPath = widget.path .. "buttons/" .. name ..
                                   "_button_text.ui_widget_definition"
        widget.createV2(widgetTextPath, widgetText)
        wid.child_widgets = {
            {widget_tag = widgetTextPath, horizontal_offset = 0, vertical_offset = 0},
            {
                widget_tag = [[insurrection/ui/shared/void.ui_widget_definition]],
                horizontal_offset = 0,
                vertical_offset = 0
            },
            {
                widget_tag = [[insurrection/ui/shared/void.ui_widget_definition]],
                horizontal_offset = 0,
                vertical_offset = 0
            },
            {
                widget_tag = [[insurrection/ui/shared/void.ui_widget_definition]],
                horizontal_offset = 0,
                vertical_offset = 0
            }
        }
    end
    if props.func then
        -- We want to run multiple functions on the same button
        if type(props.func) == "table" then
            -- Replace first function with the first function from props
            wid.event_handlers[1]["function"] = props.func[1]
            table.remove(props.func --[[@as table]] , 1)
            for i, func in ipairs(props.func --[=[@as string[]]=] ) do
                wid.event_handlers[#wid.event_handlers + 1] = {
                    flags = {run_function = true},
                    ["function"] = func,
                    event_type = "a_button"
                }
            end
        elseif type(props.func) == "string" then
            wid.event_handlers[1]["function"] = props.func --[[@as string]]
        end
    end
    -- Add mouse event handler
    wid.event_handlers[#wid.event_handlers + 1] = {
        flags = {run_function = true},
        event_type = "left_mouse",
        ["function"] = "mouse_emit_accept_event"
    }
    if props.arrow then
        local arrowX = floor(constants.components.button[variant].width / 2)
        local arrowY = 8
        local arrowHeight = constants.components.arrow[props.arrow].height
        local arrowWidth = constants.components.arrow[props.arrow].width
        local arrowBitmap = constants.components.arrow[props.arrow].bitmap

        wid.list_header_bitmap = constants.components.arrow[props.arrow].bitmap
        wid.header_bounds = widget.bounds(arrowY, arrowX, arrowY + arrowHeight, arrowX + arrowWidth)

        wid.child_widgets[#wid.child_widgets + 1] = {
            image("arrow_" .. props.arrow, arrowBitmap, arrowWidth, arrowHeight),
            arrowX,
            arrowY
        }
    end
    widget.createV2(widgetPath, wid)
    return widgetPath
end
