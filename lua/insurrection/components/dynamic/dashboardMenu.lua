local components = require "insurrection.components"
local constants = require "insurrection.constants"
local button = require "insurrection.components.button"
local input = require "insurrection.components.input"
local interface = require "insurrection.interface"

return function()
    local dashboard = components.new(constants.widgets.dashboard.id)
    local createLobbyButton = button.new(dashboard:findChildWidgetTag("create_lobby_button").id)
    createLobbyButton:onClick(function()
        dprint("Create lobby button clicked")
        api.lobby()
    end)
    local joinLobbyButton = button.new(dashboard:findChildWidgetTag("join_lobby_button").id)
    local joinLobbyInput = input.new(dashboard:findChildWidgetTag("lobby_key_input").id)
    joinLobbyButton:onClick(function()
        local lobbyKey = joinLobbyInput:getText()
        if lobbyKey ~= "" then
            api.lobby(lobbyKey)
        else
            interface.dialog("WARNING", "", "Please specify a lobby key to join.")
        end
    end)

    dashboard:onOpen(function()
        execute_script("set_ui_background")
        api.stopRefreshLobby()
        discord.updatePresence("Playing Insurrection", "In the dashboard")
    end)
    dashboard:onClose(function()
        api.stopRefreshLobby()
        discord.updatePresence("Playing Insurrection", "In the main menu")
    end)
end
