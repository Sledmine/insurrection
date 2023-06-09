local components = require "insurrection.components"
local constants = require "insurrection.constants"
local button = require "insurrection.components.button"
local list = require "insurrection.components.list"
local input = require "insurrection.components.input"
local actions = require "insurrection.redux.actions"
local core = require "insurrection.core"
local blam = require "blam"

local function init()
    local time = os.clock()
    ---@type interfaceState
    local state = store:getState()

    local isPlayerLobbyOwner = api.session.player and api.session.player.publicId ==
                                   state.lobby.owner

    local summary = shared.lobbySummary
    local template = shared.lobbyDef1
    local map = shared.lobbyDef2
    local gametype = shared.lobbyDef3
    local play = shared.lobbyPlay
    local elementsList = shared.lobbyElementsList
    local mapsList = shared.lobbyMapsList
    local fullMapList = shared.lobbyFullMaps
    local mapPreview = components.new(blam.findTag("map_small_preview",
                                                   blam.tagClasses.uiWidgetDefinition).id)
    local playersList = shared.lobbyPlayers
    local search = shared.lobbySearch
    summary:setText("Play with your friends, define your rules and enjoy.")

    if not isPlayerLobbyOwner then
        -- core.setWidgetValues(elementsList.tagId, {opacity = 0})
        elementsList:setWidgetValues({opacity = 0})
        -- core.setWidgetValues(search.tagId, {opacity = 0})
        search:setWidgetValues({opacity = 0})
        -- core.setWidgetValues(play.tagId, {opacity = 0})
        play:setWidgetValues({opacity = 0})
    end

    template:setText(state.lobby.template)
    map:setText(state.lobby.map)
    gametype:setText(state.lobby.gametype)

    if isPlayerLobbyOwner then
        elementsList:onSelect(function(item)
            item.value:setText(item.label)
            api.editLobby(api.session.lobbyKey, {
                template = template:getText(),
                map = map:getText(),
                gametype = gametype:getText()
            })
        end)
        mapsList:onSelect(function(item)
            item.value:setText(item.label)
            api.editLobby(api.session.lobbyKey, {
                template = template:getText(),
                map = map:getText(),
                gametype = gametype:getText()
            })
            mapPreview.widgetDefinition.backgroundBitmap = constants.bitmaps.unknownMapPreview.id
            local mapCollection = blam.tagCollection(constants.tagCollections.maps.id)
            assert(mapCollection, "No map preview collection found")
            for k, v in pairs(mapCollection.tagList) do
                local bitmapTag = blam.getTag(v) --[[@as tag]]
                local mapName = core.getTagName(bitmapTag.path):lower()
                if mapName == item.label:lower() then
                    mapPreview.widgetDefinition.backgroundBitmap = bitmapTag.id
                end
            end
        end)

        local definitionClick = function(lobbyDef, definition)
            search:setText("")
            ---@type interfaceState
            local state = store:getState()
            local component = elementsList
            if definition == "map" then
                component = mapsList
            end
            component:setItems(table.map(state.available[definition .. "s"], function(element)
                ---@type uiComponentListItem
                local item = {label = element, value = lobbyDef}
                if definition ~= "map" then
                    local gametypeIcons = {
                        "unknown",
                        "assault",
                        "ctf",
                        "forge",
                        "infection",
                        "juggernaut",
                        "king",
                        "oddball",
                        "race",
                        "slayer",
                        "team_slayer"
                    }
                    item.bitmap = function(uiComponent)
                        local icon = component.new(uiComponent:findChildWidgetTag("button_icon").id)
                        local iconToUse = table.find(gametypeIcons, function(icon)
                            if element:find(icon, 1, true) then
                                return true
                            end
                            return false
                        end)
                        local backgroundBitmapIndex =
                            (table.indexof(gametypeIcons, iconToUse) or 1) - 1
                        if backgroundBitmapIndex then
                            icon:setWidgetValues({background_bitmap_index = backgroundBitmapIndex})
                        end
                    end
                end
                return item
            end))
            store:dispatch(actions.setLobbyDefinition(definition))
        end

        template:onClick(function()
            definitionClick(template, "template")
            fullMapList:replace(elementsList.tagId)
        end)
        -- Force selection of template at start
        template.events.onClick()
        template:onFocus(function()
            summary:setText(
                "Template defines a set of changes to the base server that will be applied when the lobby is created.")
        end)

        map:onClick(function()
            definitionClick(map, "map")
            elementsList:replace(fullMapList.tagId)
        end)
        map:onFocus(function()
            summary:setText(
                "Choose a map from the available list to play on, you need to have the map installed.")
        end)

        gametype:onClick(function()
            definitionClick(gametype, "gametype")
            fullMapList:replace(elementsList.tagId)
        end)
        gametype:onFocus(function()
            summary:setText(
                "Game type defines the rules of the game, defines team play, scoring, etc.")
        end)

        play:onClick(function()
            if isPlayerLobbyOwner then
                local template = template:getText()
                local map = map:getText()
                local gametype = gametype:getText()
                api.borrow(template:lower(), map, gametype:lower())
            else
                interface.dialog("WARNING", "", "You are not the owner of the lobby.")
            end
        end)

    end

    playersList:setItems(table.map(state.lobby.players, function(player)
        local nameplateTag = constants.nameplates[player.nameplate] or {}
        return {label = player.name, value = player, bitmap = nameplateTag.id}
    end))

    local definitionsToComponent = {template = template, map = map, gametype = gametype}
    search:onInputText(function(text)
        ---@type interfaceState
        local state = store:getState()
        local definition = state.definition or "template"
        if definition then
            local filtered = {}
            for _, element in pairs(state.available[definition .. "s"]) do
                if element:lower():find(text:lower(), 1, true) then
                    table.insert(filtered, element)
                end
            end
            local component = elementsList
            if definition == "map" then
                component = mapsList
            end
            component:setItems(table.map(filtered, function(element)
                return {label = element, value = definitionsToComponent[definition]}
            end))
        end
    end)

    if renderedWidgetId then
        dprint(string.format("Interface update time: %.6f\n", os.clock() - time, "warning"))
    end
end

local function update()
    ---@type interfaceState
    local state = store:getState()

    local lobbyDef1 = shared.lobbyDef1
    local lobbyDef2 = shared.lobbyDef2
    local lobbyDef3 = shared.lobbyDef3
    local lobbyPlayers = shared.lobbyPlayers

    local isPlayerLobbyOwner = api.session.player and api.session.player.publicId ==
                                   state.lobby.owner
    if not isPlayerLobbyOwner then
        lobbyDef1:setText(state.lobby.template)
        lobbyDef2:setText(state.lobby.map)
        lobbyDef3:setText(state.lobby.gametype)
    end

    lobbyPlayers:setItems(table.map(state.lobby.players, function(player)
        local nameplateTag = constants.nameplates[player.nameplate] or {}
        return {label = player.name, value = player, bitmap = nameplateTag.id}
    end))
end

local function render()
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
    local lobbyMapsList = list.new(blam.findTag("lobby_maps_options",
                                                blam.tagClasses.uiWidgetDefinition).id)
    local lobbyFullMaps = components.new(blam.findTag("lobby_maps_wrapper",
                                                      blam.tagClasses.uiWidgetDefinition).id)
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

return {init = init, update = update, render = render}
