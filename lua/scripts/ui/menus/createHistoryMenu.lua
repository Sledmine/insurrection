local inspect = require "inspect"
local widget = require "lua.scripts.widget"
local glue = require "lua.glue"
local menuContainer = require "lua.scripts.ui.components.menuContainer"
local menuHeader = require "lua.scripts.ui.components.menuHeader"
local normalButton = require "lua.scripts.ui.components.normalButton"

local menuPath = [[insurrection\ui\menus\chimera_servers_menu\]]
local containerPath = menuPath .. [[chimera_history_menu.ui_widget_definition]]
local headerPath = menuPath .. [[chimera_history_menu_header.ui_widget_definition]]
local optionsPath = menuPath .. [[chimera_history_menu_options.ui_widget_definition]]
local optionsButtonPath = menuPath .. [[option_%s.ui_widget_definition]]

widget.create(headerPath, menuHeader("chimera_history", "HISTORY",
                                     "ATTEMPT TO JOIN A SERVER IN THE HISTORY"))

---@type invaderWidget
local options = {
    widget_type = "column_list",
    bounds = "0 0 480 856",
    flags = {pass_unhandled_events_to_focused_child = true, dpad_up_down_tabs_thru_children = true},
    child_widgets = {}
}
for buttonIndex = 1, 10 do
    local currentOptionPath = optionsButtonPath:format(buttonIndex)
    widget.create(currentOptionPath, normalButton("left_justify"))
    options.child_widgets[buttonIndex] = {
        horizontal_offset = 40,
        vertical_offset = 84 + (26 * (buttonIndex - 1)),
        widget_tag = currentOptionPath
    }
end
widget.create(optionsPath, options)

---@type invaderWidget
local historyMenu = menuContainer()
widget.merge(historyMenu, {
    child_widgets = {
        {horizontal_offset = 40, vertical_offset = 20, widget_tag = headerPath},
        {horizontal_offset = 0, vertical_offset = 0, widget_tag = optionsPath}
    }
})
widget.create(containerPath, historyMenu)
