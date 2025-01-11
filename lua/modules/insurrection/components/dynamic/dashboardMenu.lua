local components = require "insurrection.components"
local constants = require "insurrection.constants"
local button = require "insurrection.components.button"
local input = require "insurrection.components.input"
local interface = require "insurrection.interface"
local menus = require "insurrection.menus"
---fd
return function()
    --local dashboard = components.new(constants.widgets.dashboard.id)
    --local createLobbyButton = button.new(dashboard:findChildWidgetTag("create_lobby_button").id)
    --createLobbyButton:onClick(function()
    --    api.lobby()
    --end)
    local dashboard = components.new(constants.widgets.dashboard.id)
    local createLobbyButton = button.new(dashboard:findChildWidgetTag("create_prompt_dashboard_button").id)
    createLobbyButton:onClick(function()
        api.lobby()
    end)
    
    --local joinLobbyButton = button.new(dashboard:findChildWidgetTag("join_lobby_button").id)
    --local joinLobbyInput = input.new(dashboard:findChildWidgetTag("lobby_key_input").id)
    --joinLobbyButton:onClick(function()
    --    local lobbyKey = joinLobbyInput:getText()
    --    if lobbyKey ~= "" then
    --        api.lobby(lobbyKey)
    --    else
    --        interface.dialog("WARNING", "", "Please specify a lobby key to join.")
    --    end
    --end)

    --local browseLobby = button.new(dashboard:findChildWidgetTag("browse_lobby").id)
    --browseLobby:onClick(function()
    --    menus.lobbies()
    --end)
    local browseLobby = button.new(dashboard:findChildWidgetTag("browse_prompt_dashboard_button").id)
    browseLobby:onClick(function()
        menus.lobbies()
    end)
    dashboard:onOpen(function()
        execute_script("set_ui_background")
        api.stopRefreshLobby()
        discord.clearParty()
        discord.setState("Playing Insurrection", "In the dashboard")
    end)
    dashboard:onClose(function()
        api.stopRefreshLobby()
        discord.clearPresence()
    end)

    --local customizationButton = button.new(dashboard:findChildWidgetTag("customization_button").id)
    --customizationButton:onClick(function()
    --    interface.fade("in", 60)
    --end)
    local customizationButton = button.new(dashboard:findChildWidgetTag("customization_prompt_dashboard_button").id)
    customizationButton:onClick(function()
        interface.fade("in", 60)
        menus.customization()
    end)
end
