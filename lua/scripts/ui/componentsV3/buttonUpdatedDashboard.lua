local widget = require "lua.scripts.widget"
local ustr = require "lua.scripts.modules.ustr"
local constants = require "lua.scripts.ui.components.constants"
local image = require "lua.scripts.ui.componentsV2.image"
local floor = math.floor

---@class buttonUpdatedDashboardProps
---@field name string
---@field text? string
---@field justification? "left_justify" | "center_justify" | "right_justify"
---@field variant "browse_lobbies" | "create_lobby" | "join_lobby_by_key" | "customization"
---@field childs? invaderWidgetChildWidget[]

---Generic table button for table usage
---@param props buttonUpdatedDashboardProps
---@return string
return function(props)
    local name = props.name
    local text = props.text
    local variant = props.variant or "browse_lobbies"
    local justification = props.justification or "left_justify"
    local widgetPath = widget.path .. "buttons/" .. name .. "_dashboard_button.ui_widget_definition"
    
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
        background_bitmap = [[insurrection/ui/bitmaps/dashboard_warning.bitmap]],
        flags = {pass_unhandled_events_to_focused_child = true},
        text_label_unicode_strings_list = stringsTagPath,
        string_list_index = 0,
        text_font = constants.fonts.title,
        text_color = constants.color.text,
        justification = justification,
        horiz_offset = 425,
        vert_offset = 102,
    }
    if variant == "create_lobby" then
        wid.background_bitmap = [[insurrection/ui/bitmaps/dashboard_create_lobby.bitmap]]
    elseif variant == "join_lobby_by_key" then
        wid.background_bitmap = [[insurrection/ui/bitmaps/dashboard_warning.bitmap]]
    elseif variant == "customization" then
        wid.background_bitmap = [[insurrection/ui/bitmaps/dashboard_warning.bitmap]]
    end

    widget.createV2(widgetPath, wid)
    return widgetPath
end
