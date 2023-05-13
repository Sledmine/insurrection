local components = require "insurrection.components"
local constants = require "insurrection.constants"
local button = require "insurrection.components.button"
local list = require "insurrection.components.list"
local input = require "insurrection.components.input"
local blam = require "blam"

return function()
    local lobby = components.new(constants.widgets.lobby.id)
    local lobbySummary = components.new(
                             components.new(lobby:findChildWidgetTag("summary").id):findChildWidgetTag(
                                 "text").id)

    local lobbyOptions = components.new(lobby:findChildWidgetTag("options").id)
    local lobbyDefs = components.new(lobbyOptions:findChildWidgetTag("definitions").id)
    local lobbyDef1 = button.new(lobbyDefs:findChildWidgetTag("template").id)
    local lobbyDef2 = button.new(lobbyDefs:findChildWidgetTag("map").id)
    local lobbyDef3 = button.new(lobbyDefs:findChildWidgetTag("gametype").id)
    -- local lobbySettings = button.new(lobbyDefs:findChildWidgetTag("settings").id)

    local lobbyElementsList = list.new(lobbyOptions:findChildWidgetTag("elements").id)
    local lobbyMapsList =
        list.new(blam.findTag("lobby_maps", blam.tagClasses.uiWidgetDefinition).id)
    local lobbyFullMaps = components.new(blam.findTag("full_maps", blam.tagClasses.uiWidgetDefinition).id)
    local mapDescription = components.new(blam.findTag("map_small",
                                                       blam.tagClasses.uiWidgetDefinition).id)
    local mapOverlay =
        components.new(mapDescription:findChildWidgetTag("overlay_scanner").id):animate()
    local lobbySearch = input.new(lobbyOptions:findChildWidgetTag("search").id)
    local lobbyPlay = button.new(lobbyOptions:findChildWidgetTag("play").id)
    local lobbyBack = button.new(lobbyOptions:findChildWidgetTag("back").id)

    local lobbyPlayers = list.new(lobby:findChildWidgetTag("players").id)
    lobbyPlayers:scrollable(false)

    shared.lobby = lobby
    shared.lobbySummary = lobbySummary
    shared.lobbyDefs = lobbyDefs
    shared.lobbyDef1 = lobbyDef1
    shared.lobbyDef2 = lobbyDef2
    shared.lobbyDef3 = lobbyDef3
    -- shared.lobbySettings = lobbySettings
    shared.lobbyPlay = lobbyPlay
    shared.lobbyElementsList = lobbyElementsList
    shared.lobbyMapsList = lobbyMapsList
    shared.lobbyPlayers = lobbyPlayers
    shared.lobbySearch = lobbySearch
    shared.lobbyFullMaps = lobbyFullMaps

    lobby:onClose(function()
        api.deleteLobby()
    end)
    lobbyBack:onClick(function()
        lobby.events.onClose()
    end)
end
