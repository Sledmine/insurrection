local widget = require "lua.scripts.widget"
local ustr = require "lua.scripts.modules.ustr"
local constants = require "lua.scripts.ui.components.constants"
local image = require "lua.scripts.ui.componentsV2.image"
local floor = math.floor

---@class rankDashboardProps
---@field name string
---@field text? string
---@field justification? "left_justify" | "center_justify" | "right_justify"
---@field variant "overlay" | "icon" | "text_rank_name" | "text_spec_info" | "text_level_info" | "text_credits_info"
---@field childs? invaderWidgetChildWidget[]

---Generic rank dashboard for info
---@param props rankDashboardProps
---@return string
return function(props)
    local name = props.name
    local text = props.text
    local variant = props.variant or "overlay"
    local widgetPath = widget.path .. "buttons/" .. name .. "_rank_dashboard.ui_widget_definition"

    local stringsTagPath
    if text then
        -- Generate strings tag
        stringsTagPath = widget.path .. "strings/" .. name .. "_rank_dashboard.unicode_string_list"
        ustr(stringsTagPath, {text})
    end

    local rankIconSize = {
        width = 200,
        height = 280,
        scale = 0.24
    }

    ---@type invaderWidget
    local wid = {
        widget_type = "text_box",
        bounds = widget.bounds(0, 0, 78, 58),
        background_bitmap = [[insurrection/ui/bitmaps/rank_overlay.bitmap]],
        text_label_unicode_strings_list = stringsTagPath,
        string_list_index = 0,
        text_font = constants.fonts.button,
        text_color = constants.color.subtitle,
        justification = props.justification or "right_justify",
        horiz_offset = 16,
        vert_offset = -2
    }

    if variant == "icon" then
        wid.background_bitmap = [[insurrection/ui/bitmaps/rank_dummy.bitmap]]
        wid.bounds = widget.scale(rankIconSize.width, rankIconSize.height, rankIconSize.scale)
    end

    if variant == "text_rank_name" then
        wid.background_bitmap = [[insurrection/ui/bitmaps/rank_text_box.bitmap]]
        --wid.bounds = widget.scale(rankTextBoxSize.width, rankTextBoxSize.height, rankTextBoxSize.scale)
        wid.text_color = constants.color.title
        wid.bounds = widget.bounds(0, 0, 61, 128)
    elseif variant == "text_spec_info" then
        wid.background_bitmap = [[insurrection/ui/bitmaps/rank_text_box.bitmap]]
        --wid.bounds = widget.scale(rankTextBoxSize.width, rankTextBoxSize.height, rankTextBoxSize.scale)
        wid.text_color = constants.color.subtitle
        wid.bounds = widget.bounds(0, 0, 61, 128)
    elseif variant == "text_level_info" then
        wid.background_bitmap = [[insurrection/ui/bitmaps/rank_text_box.bitmap]]
        --wid.bounds = widget.scale(rankTextBoxSize.width, rankTextBoxSize.height, rankTextBoxSize.scale)
        wid.text_color = constants.color.selected
        wid.bounds = widget.bounds(0, 0, 61, 128)
    elseif  variant == "text_credits_info" then
        wid.background_bitmap = [[insurrection/ui/bitmaps/rank_text_box.bitmap]]
        --wid.bounds = widget.scale(rankTextBoxSize.width, rankTextBoxSize.height, rankTextBoxSize.scale)
        wid.text_color = constants.color.title
        wid.bounds = widget.bounds(0, 0, 61, 128)
    end

    widget.createV2(widgetPath, wid)
    return widgetPath
end
