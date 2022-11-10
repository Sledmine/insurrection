local widget = require "lua.scripts.widget"
local ustr = require "lua.scripts.modules.ustr"
local constants = require "lua.scripts.ui.components.constants"

---Generic button component, recycled in multiple components
---@param name string Name of the button component (also used for inner tags generation)
---@param text? string Auto generated unicode string inside this button
---@param props? {back: boolean, opens: string, script: string, branch: boolean, func: string | string[], select: boolean, justification: '"left_justify"' | '"center_justify"' | '"right_justify"', legacy: boolean, close: boolean, childs: invaderWidgetChildWidget[]} Button properties
---@return string
return function(name, text, props)
    local props = props or {}
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
        bounds = "0, 0, 24, 184",
        flags = {pass_unhandled_events_to_focused_child = true},
        background_bitmap = [[insurrection\ui\bitmaps\normal_button.bitmap]],
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
                widget_tag = props.opens or ".ui_widget_definition",
                script = props.script or ""
            },
            {
                flags = {run_function = true},
                event_type = "left_mouse",
                ["function"] = "mouse_emit_accept_event"
            }
        },
        text_label_unicode_strings_list = stringsTagPath,
        string_list_index = 0,
        text_font = constants.fonts.text,
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
            widgetText.text_label_unicode_strings_list = stringsTagPath
        end
        local widgetTextPath = widget.path .. "buttons/" .. name ..
                                   "_button_text.ui_widget_definition"
        widget.createV2(widgetTextPath, widgetText)
        wid.child_widgets = {
            {
                widget_tag = widgetTextPath,
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
            },
            {
                widget_tag = [[insurrection/ui/shared/void.ui_widget_definition]],
                horizontal_offset = 0,
                vertical_offset = 0
            }
        }
    end
    if props.func then
        if type(props.func) == "table" then
            for i, func in ipairs(props.func) do
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
    widget.create(widgetPath, wid)
    return widgetPath
end
