local widget = require "lua.scripts.widget"
local menuContainer = require "lua.scripts.ui.components.menuContainer"
local menuHeader = require "lua.scripts.ui.components.menuHeader"
local button = require "lua.scripts.ui.components.button"

local menuPath = [[insurrection\ui\menus\chimera_servers_menu\]]
local containerHistoryPath = menuPath .. [[chimera_history_menu.ui_widget_definition]]
local containerBookmarksPath = menuPath .. [[chimera_bookmarks_menu.ui_widget_definition]]
local headerHistoryPath = menuPath .. [[chimera_history_menu_header.ui_widget_definition]]
local headerBookmarksPath = menuPath .. [[chimera_bookmarks_menu_header.ui_widget_definition]]
local chimeraServersPath = menuPath .. [[chimera_servers_options.ui_widget_definition]]
local optionsButtonPath = menuPath .. [[chimera_server_button_%s.ui_widget_definition]]

widget.create(headerHistoryPath, menuHeader("chimera_history", "HISTORY",
                                     "ATTEMPT TO JOIN A SERVER IN THE HISTORY"))
widget.create(headerBookmarksPath, menuHeader("chimera_bookmarks", "BOOKMARKS",
                                     "ATTEMPT TO REJOIN A BOOKMARKED SERVER"))

---@type invaderWidget
local options = {
    widget_type = "column_list",
    bounds = "0 0 480 856",
    flags = {pass_unhandled_events_to_focused_child = true, dpad_up_down_tabs_thru_children = true},
    child_widgets = {}
}
for buttonIndex = 1, 10 do
    local currentOptionPath = optionsButtonPath:format(buttonIndex)
    widget.create(currentOptionPath, button("left_justify","chimera_server_option_entry_" .. buttonIndex, "CHIMERA_SERVER_OPTION_PLACEHOLDER_ENTRY"))
    options.child_widgets[buttonIndex] = {
        horizontal_offset = 40,
        vertical_offset = 84 + (26 * (buttonIndex - 1)),
        widget_tag = currentOptionPath
    }
end
widget.create(chimeraServersPath, options)

---@type invaderWidget
local historyMenu = menuContainer()
widget.merge(historyMenu, {
    child_widgets = {
        {horizontal_offset = 40, vertical_offset = 20, widget_tag = headerHistoryPath},
        {horizontal_offset = 0, vertical_offset = 0, widget_tag = chimeraServersPath}
    }
})
---@type invaderWidget
local bookmarksMenu = menuContainer()
widget.merge(bookmarksMenu, {
    child_widgets = {
        {horizontal_offset = 40, vertical_offset = 20, widget_tag = headerBookmarksPath},
        {horizontal_offset = 0, vertical_offset = 0, widget_tag = chimeraServersPath}
    }
})
widget.create(containerHistoryPath, historyMenu)
widget.create(containerBookmarksPath, bookmarksMenu)
