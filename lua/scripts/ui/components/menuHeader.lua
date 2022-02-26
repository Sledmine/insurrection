local widget = require "lua.scripts.widget"
---@param title string
---@param subtitle string
---@return invaderWidget
return function (name, title, subtitle)
    -- Generate strings tag
    --local stringsTagPath = [[insurrection\ui\shared\headers\strings\]] .. name .. [[.unicode_string_list]]
    --widget.string(stringsTagPath, {
    --    title,
    --    subtitle
    --})
    ---- Generate title
    --local titlePath = [[insurrection\ui\shared\headers\titles\]] .. name .. [[.ui_widget.definition]]
    --widget.create(titlePath, {
    --    type = "text box",
    --    bounds = "0 0 20 343",
    --    text_label_unicode_strings_list = stringsTagPath,
    --    text_font = [[ui\large_ui.font]],
    --    string_list_index = 0
    --})
    ---- Generate subtitle
    --local subtitlePath = [[insurrection\ui\shared\headers\subtitles\]] .. name .. [[.ui_widget.definition]]
    --widget.create(subtitlePath, {
    --    type = "text box",
    --    bounds = "0 0 20 343",
    --    text_label_unicode_strings_list = stringsTagPath,
    --    text_font = [[ui\large_ui.font]],
    --    string_list_index = 1
    --})
    return {child_widgets = {
        {
            widget_tag = [[insurrection\ui\menus\settings_menu\titles\header_title.ui_widget_definition]],
            vertical_offset = 0,
            horizontal_offset = 0
        },
        {
            widget_tag = [[insurrection\ui\menus\settings_menu\titles\header_subtitle.ui_widget_definition]],
            vertical_offset = 15,
            horizontal_offset = 0
        }
    }}
end
