local widget = require "lua.scripts.widget"
local menuContainer = require "lua.scripts.ui.components.menuContainer"
local menuHeader = require "lua.scripts.ui.components.menuHeader"
local button = require "lua.scripts.ui.components.button"
local inputText = require "lua.scripts.ui.components.inputText"
local complexButton = require "lua.scripts.ui.components.complexButton"
local optionsList = require "lua.scripts.ui.components.optionsList"
local nameplate = require "lua.scripts.ui.components.nameplate"

local menuName = "customization"
local menuPath = [[insurrection\ui\menus\]] .. menuName .. [[\]]
local buttonPath = menuPath .. [[buttons\]]
local containerPath = menuPath .. menuName .. [[_menu.ui_widget_definition]]
local headerPath = menuPath .. menuName .. [[_header.ui_widget_definition]]
local optionsPath = menuPath .. menuName .. [[_options.ui_widget_definition]]
local backButtonPath = [[insurrection/ui/shared/common_back.ui_widget_definition]]
local currentVersionPath = [[insurrection\ui\main_menu\version.ui_widget_definition]]

-- Create menu header
widget.create(headerPath, menuHeader("insurrection_customization", "INSURRECTION CUSTOMIZATION",
                                     "CUSTOMIZE DIFFERENT ASPECTS FROM YOUR INSURRECTION ACCOUNT"))
-- Create options elements
local nameplateCustomizeButtonPath = buttonPath ..
                                         [[nameplate_customize_button.ui_widget_definition]]
widget.create(nameplateCustomizeButtonPath,
              complexButton("left_justify", "nameplate_customize_button", "NAMEPLATE", nil, nil,
                            nil, "CUSTOMIZE YOUR NAMEPLATE"))

local scrollUpButtonPath = buttonPath .. [[scroll_up_button.ui_widget_definition]]
widget.create(scrollUpButtonPath, button("left_justify", "scroll_up_button", "SCROLL UP"))

local scrollDownButtonPath = buttonPath .. [[scroll_down_button.ui_widget_definition]]
widget.create(scrollDownButtonPath, button("left_justify", "scroll_down_button", "SCROLL DOWN"))

local saveCustomizationButtonPath = buttonPath .. [[save_customization_button.ui_widget_definition]]
widget.create(saveCustomizationButtonPath, button("left_justify", "save_customization_button", "SAVE"))

local initialPosition = 165
---@type invaderWidgetChildWidget[]
local options = {}
options[1] = {
    horizontal_offset = 40,
    vertical_offset = 55,
    widget_tag = nameplateCustomizeButtonPath
}
options[2] = {
    horizontal_offset = 40,
    vertical_offset = initialPosition,
    widget_tag = scrollUpButtonPath
}

for i = 1, 7 do
    local nameplateButtonPath = buttonPath .. [[nameplate_button_]] .. i ..
                                    [[.ui_widget_definition]]
    widget.create(nameplateButtonPath, nameplate("nameplate_button_" .. i, string.rep(" ", 32)))
    options[i + 2] = {
        horizontal_offset = 40,
        vertical_offset = widget.offset(initialPosition, 26, 3, i + 1),
        widget_tag = nameplateButtonPath
    }
end

options[10] = {
    horizontal_offset = 40,
    vertical_offset = widget.offset(initialPosition, 24, 2, 10),
    widget_tag = scrollDownButtonPath
}
options[11] = {
    horizontal_offset = 630,
    vertical_offset = 389,
    widget_tag = saveCustomizationButtonPath
}
options[12] = {
    horizontal_offset = 630,
    vertical_offset = 415,
    widget_tag = backButtonPath
}

widget.create(optionsPath, optionsList(options))

---@type invaderWidget
local menu = menuContainer()
widget.merge(menu, {
    child_widgets = {
        {horizontal_offset = 40, vertical_offset = 20, widget_tag = headerPath},
        {horizontal_offset = 253, vertical_offset = 78, widget_tag = dialogPath},
        {horizontal_offset = 0, vertical_offset = 0, widget_tag = optionsPath},
        {horizontal_offset = 0, vertical_offset = 460, widget_tag = currentVersionPath}
    }
})
widget.create(containerPath, menu)
