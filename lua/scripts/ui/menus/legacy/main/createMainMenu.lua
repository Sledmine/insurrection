local widget = require "lua.scripts.widget"
local menuContainer = require "lua.scripts.ui.components.menuContainer"
local normalButton = require "lua.scripts.ui.components.normalButton"
local optionsList = require "lua.scripts.ui.components.optionsList"
local button = require "lua.scripts.ui.components.button"
local glue = require "lua.lua_modules.glue"

local menuPath = [[insurrection\ui\menus\main\]]
local containerPath = menuPath .. [[main_menu.ui_widget_definition]]
local optionsPath = menuPath .. [[main_menu_options.ui_widget_definition]]
local logoPath = [[insurrection\ui\main_menu\insurrection_logo.ui_widget_definition]]
local currentProfilePath = [[insurrection\ui\shared\current_profile.ui_widget_definition]]
local optionNames = {
    {
        name = "campaign",
        opens = [[ui\shell\main_menu\campaign_select\campaign_menu.ui_widget_definition]]
    },
    {
        name = "multiplayer",
        opens = [[insurrection\ui\main_menu\menu_options\multiplayer_menu\multiplayer_menu.ui_widget_definition]],
        ["function"] = "new_game_if_no_plyr_profiles"
    },
    {
        name = "insurrection",
        opens = [[insurrection\ui\menus\insurrection_login\insurrection_login_menu.ui_widget_definition]]
    },
    {
        name = "profiles",
        opens = [[ui\shell\main_menu\profile_manager\player_profile_manager.ui_widget_definition]],
        ["function"] = "new_game_if_no_plyr_profiles"
    },
    {
        name = "settings",
        flags = {try_to_branch_on_failure = true},
        ["function"] = "profile_set_edit_begin",
        opens = [[insurrection\ui\menus\settings_menu\player_profile_edit_screen.ui_widget_definition]]
    },
    {name = "credits"},
    {name = "quit", ["function"] = "main_menu_quit_game"}
}

---@type invaderWidgetChildWidget[]
local options = {}
for buttonIndex, option in ipairs(optionNames) do
    local buttonName = "main_menu_" .. option.name .. "_button"
    local buttonPath = menuPath .. buttonName .. ".ui_widget_definition"
    local buttonWidget = button("left_justify", buttonName, option.name:upper(), option.opens)
    if option["function"] then
        buttonWidget.event_handlers[1]["function"] = option["function"]
    end
    glue.merge(buttonWidget.event_handlers[1].flags, option.flags or {})
    widget.create(buttonPath, buttonWidget)
    options[buttonIndex] = {
        vertical_offset = 266 + (26 * (buttonIndex - 1)),
        horizontal_offset = 40,
        widget_tag = buttonPath
    }
end
widget.create(optionsPath, optionsList(options))
widget.create(containerPath, widget.merge(menuContainer(), {
    event_handlers = {
        {event_type = "created", flags = {run_scenario_script = true}, script = "set_ui_background"}
    },
    child_widgets = {
        {horizontal_offset = 202, vertical_offset = 105, widget_tag = logoPath},
        {horizontal_offset = 0, vertical_offset = 0, widget_tag = optionsPath},
        {horizontal_offset = 624, vertical_offset = 20, widget_tag = currentProfilePath}
    }
}))
