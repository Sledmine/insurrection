local widget = require "lua.scripts.widget"
local ustr = require "lua.scripts.modules.ustr"
local constants = require "lua.scripts.ui.components.constants"
local image = require "lua.scripts.ui.componentsV2.image"
local floor = math.floor

---@class buttonUpdatedDashboardProps
---@field name string
---@field text? string
---@field back? boolean
---@field opens? string
---@field script? string
---@field branch? boolean
---@field func? string | string[]
---@field select? boolean
---@field close? boolean
---@field justification? "left_justify" | "center_justify" | "right_justify"
---@field variant "browse_lobbies" | "create_lobby" | "join_lobby_by_key" | "customization"
---@field childs? invaderWidgetChildWidget[]

---Generic table button for table usage
---@param props buttonUpdatedDashboardProps
---@return string
return function(props)
    local name = props.name
    local text = props.text
    local childWidgets = props[1] or props.childs
    local variant = props.variant or "browse_lobbies"
    local justification = props.justification or "left_justify"
    local widgetPath = widget.path .. "buttons/" .. name .. "_dashboard_button.ui_widget_definition"
    
    -- Scale Widget Background Bitmap
    local size = {
        width = 816,
        height = 180,
        scale = 0.5
    }

    local stringsTagPath
    if text then
        -- Generate strings tag
        stringsTagPath = widget.path .. "strings/" .. name .. "_dashboard_button.unicode_string_list"
        ustr(stringsTagPath, {text})
    end


    ---@type invaderWidget
    local wid = {
        widget_type = "text_box",
        bounds = widget.scale(size.width, size.height, size.scale),
        background_bitmap = [[insurrection/ui/bitmaps/dashboard_browse.bitmap]],
        flags = {pass_unhandled_events_to_focused_child = true},
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
        text_font = constants.fonts.title,
        text_color = constants.color.text,
        justification = justification,
        horiz_offset = 455,
        vert_offset = 102,
        child_widgets = childWidgets or {}
    }
    if variant == "create_lobby" then
        wid.background_bitmap = [[insurrection/ui/bitmaps/dashboard_create_lobby.bitmap]]
    elseif variant == "join_lobby_by_key" then
        wid.background_bitmap = [[insurrection/ui/bitmaps/dashboard_warning.bitmap]]
    elseif variant == "customization" then
        wid.background_bitmap = [[insurrection/ui/bitmaps/dashboard_customization.bitmap]]
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
    widget.createV2(widgetPath, wid)
    return widgetPath
end
