local widget = require "lua.scripts.widget"
local ustr = require "lua.scripts.modules.ustr"
local constants = require "lua.scripts.ui.components.constants"
local image = require "lua.scripts.ui.componentsV2.image"
local floor = math.floor

---@class buttonGamesProps
---@field name string
---@field text? string
---@field justification? "left_justify" | "center_justify" | "right_justify"
---@field variant "stock" | "the_flood" | "community" | "kart" | "random"
---@field childs? invaderWidgetChildWidget[]

---Generic table button for table usage
---@param props buttonGamesProps
---@return string
return function(props)
    local name = props.name
    local text = props.text
    local variant = props.variant or "custom"
    local justification = props.justification or "left_justify"
    local widgetPath = widget.path .. "buttons/" .. name .. "_games_button.ui_widget_definition"
    
    local size = {
        width = 300,
        height = 450,
        scale = 0.5
    }

    local stringsTagPath
    if text then
        -- Generate strings tag
        stringsTagPath = widget.path .. "strings/" .. name .. "_games_button.unicode_string_list"
        ustr(stringsTagPath, {text})
    end


    ---@type invaderWidget
    local wid = {
        widget_type = "text_box",
        bounds = widget.scale(size.width, size.height, size.scale),
        background_bitmap = [[insurrection/ui/bitmaps/games_stock_button.bitmap]],
        flags = {pass_unhandled_events_to_focused_child = true},
        text_label_unicode_strings_list = stringsTagPath,
        string_list_index = 0,
        text_font = constants.fonts.title,
        text_color = constants.color.text,
        justification = justification,
        horiz_offset = 150,
        vert_offset =410,
    }
    if variant == "the_flood" then
        wid.background_bitmap = [[insurrection/ui/bitmaps/games_the_flood_button.bitmap]]
    elseif variant == "community" then
        wid.background_bitmap = [[insurrection/ui/bitmaps/games_community_button.bitmap]]
    elseif variant == "kart" then
        wid.background_bitmap = [[insurrection/ui/bitmaps/games_kart_button.bitmap]]
    end

    widget.createV2(widgetPath, wid)
    return widgetPath
end
