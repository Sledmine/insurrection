local widget = require "lua.scripts.widget"
local ustr = require "lua.scripts.modules.ustr"
local menuContainer = require "lua.scripts.ui.components.menuContainer"
local dialogHeader = require "lua.scripts.ui.components.dialogHeader"
local button = require "lua.scripts.ui.components.button"
local options = require "lua.scripts.ui.components.options"

local menuPath = [[insurrection/ui/menus/dialog/]]
local dialogBackgroundPath = [[insurrection/ui/bitmaps/message_dialog_background.bitmap]]
local dialogPath = menuPath .. [[dialog_menu.ui_widget_definition]]
local dialogHeaderPath = menuPath .. [[dialog_header.ui_widget_definition]]
local dialogBodyPath = menuPath .. [[dialog_body.ui_widget_definition]]
local dialogBackButtonPath = menuPath .. [[buttons/dialog_back_button.ui_widget_definition]]
local dialogOptionsPath = menuPath .. [[dialog_options.ui_widget_definition]]
local dialogIconPath = menuPath .. [[dialog_icon.ui_widget_definition]]

widget.create(dialogHeaderPath, dialogHeader("dialog", string.rep(" ", 64), string.rep(" ", 128)))

local bodyStringsPathPath = [[insurrection/ui/shared/strings/content/dialog.unicode_string_list]]
ustr(bodyStringsPathPath, {string.rep(" ", 4096)})
widget.create(dialogBodyPath, {
    widget_type = "text_box",
    bounds = "0 0 85 856",
    text_label_unicode_strings_list = bodyStringsPathPath,
    string_list_index = 0,
    text_color = "1 1 1 1",
    text_font = [[ui/large_ui.font]],
    justification = "center_justify"
})
widget.create(dialogBackButtonPath,
              button("center_justify", "dialog_back_button", "     OK     ", nil, nil, true))
widget.create(dialogIconPath, {
    bounds = "-32 -32 32 32",
    background_bitmap = [[insurrection/ui/bitmaps/warning_icon.bitmap]]
})
widget.create(dialogOptionsPath, options(
                  {
        {horizontal_offset = 328, vertical_offset = 342, widget_tag = dialogBackButtonPath}
    }))
local container = widget.update(menuContainer(), {
    background_bitmap = dialogBackgroundPath,
    child_widgets = {
        {horizontal_offset = 0, vertical_offset = 129, widget_tag = dialogHeaderPath},
        {horizontal_offset = 305, vertical_offset = 134, widget_tag = dialogIconPath},
        {horizontal_offset = 0, vertical_offset = 240, widget_tag = dialogBodyPath},
        {horizontal_offset = 0, vertical_offset = 0, widget_tag = dialogOptionsPath}
    }
})
widget.create(dialogPath, container)
