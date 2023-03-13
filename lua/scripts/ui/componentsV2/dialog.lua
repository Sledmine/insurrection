local widget = require "lua.scripts.widget"
local ustr = require "lua.scripts.modules.ustr"
local constants = require "lua.scripts.ui.components.constants"
local luna = require "lua.scripts.modules.luna"
local options = require "lua.scripts.ui.componentsV2.options"
local button = require "lua.scripts.ui.componentsV2.button"

---@param title string
---@param subtitle string
---@param props? {icon?: "warning" | "error" | "info" | "question"}
---@return string
return function(name, title, subtitle, props)
    local props = props or {}
    props.icon = props.icon or "warning"

    local widgetPath = widget.path .. name .. "_dialog.ui_widget_definition"

    local stringsTagPath = widget.path .. "strings/" .. name .. "_button.unicode_string_list"
    ustr(stringsTagPath, {title, subtitle})

    local titlePath = widget.path .. name .. "_dialog_title.ui_widget_definition"
    widget.createV2(titlePath, {
        widget_type = "text_box",
        bounds = widget.bounds(0, 0, 40, constants.screenWidth),
        text_label_unicode_strings_list = stringsTagPath,
        text_font = constants.fonts.title,
        text_color = constants.color.title,
        justification = "center_justify",
        string_list_index = 0,
        vert_offset = 12
    })

    local subtitlePath = widget.path .. name .. "_dialog_subitle.ui_widget_definition"
    widget.createV2(subtitlePath, {
        widget_type = "text_box",
        bounds = widget.bounds(0, 0, 20, constants.screenWidth),
        text_label_unicode_strings_list = stringsTagPath,
        text_font = constants.fonts.subtitle,
        text_color = constants.color.text,
        justification = "center_justify",
        string_list_index = 1
    })

    ---@type invaderWidget
    local wid = {
        background_bitmap = [[insurrection/ui/bitmaps/message_dialog_background.bitmap]],
        bounds = constants.getScreenBounds(),
        child_widgets = {
            {titlePath},
            {subtitlePath, 75, 0},
            {
                image(name .. "_dialog_icon",
                      ("insurrection/ui/bitmaps/{icon}.bitmap"):template({icon = props.icon}), 512,
                      512, 0.16)
            },
            {
                options(name .. "_dialog", "horizontal",
                        {{button(name .. "_ok", "OK", {variant = "normal"}), 328, 342}})
            }
        }
    }
    widget.createV2(widgetPath, wid)
    return widgetPath
end
