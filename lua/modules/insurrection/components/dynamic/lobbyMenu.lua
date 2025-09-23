local component = require "insurrection.components"
local constants = require "insurrection.constants"
local button = require "insurrection.components.button"
local list = require "insurrection.components.list"
local input = require "insurrection.components.input"
local core = require "insurrection.core"
local blam = require "blam"
local getState = require "insurrection.redux.getState"
local checkbox = require "insurrection.components.checkbox"
local t = require"insurrection.utils".snakeCaseToTitleCase

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

local templateIcons = {"stock", "fiesta"}

local bitmaps = {
    gametypeIcons = blam.findTag("lobby_gametype_icon", blam.tagClasses.bitmap),
    templateIcons = blam.findTag("lobby_template_icon", blam.tagClasses.bitmap)
}

return function()
    local state = getState()
    local lobby = state.lobby
    local definition = "map"

    local isPlayerLobbyOwner = api.session.player and state.lobby and api.session.player.publicId ==
                                   state.lobby.owner

    local lobbyMenu = component.new(constants.widgets.lobby.id)
    local summary = component.new(lobbyMenu:findChildWidgetTag("summary").id)
    local description = component.new(summary:findChildWidgetTag("text").id)

    local options = component.new(lobbyMenu:findChildWidgetTag("options").id)

    local definitionList = component.new(options:findChildWidgetTag("definitions").id)

    local template = button.new(definitionList:findChildWidgetTag("template").id)
    local map = button.new(definitionList:findChildWidgetTag("map").id)
    local gametype = button.new(definitionList:findChildWidgetTag("gametype").id)
    local skulls = button.new(definitionList:findChildWidgetTag("skulls").id)

    -- local lobbySettings = button.new(lobbyDefs:findChildWidgetTag("settings").id)
    local skullsPanel = component.new(blam.findTag("skulls_panel",
                                                   blam.tagClasses.uiWidgetDefinition).id)

    local elementsList = list.new(options:findChildWidgetTag("elements").id)
    local mapsList = list.new(blam.findTag("lobby_maps_options", blam.tagClasses.uiWidgetDefinition)
                                  .id)
    local fullMapList = component.new(blam.findTag("lobby_maps_wrapper",
                                                   blam.tagClasses.uiWidgetDefinition).id)
    local mapDescription = component.new(blam.findTag("map_small",
                                                      blam.tagClasses.uiWidgetDefinition).id)
    -- Add scanner animation to map preview
    component.new(mapDescription:findChildWidgetTag("overlay_scanner").id):setAnimated(true, true, 2.3, 1)

    local search = input.new(options:findChildWidgetTag("search").id)
    local play = button.new(options:findChildWidgetTag("play").id)
    local back = button.new(options:findChildWidgetTag("back").id)
    local makePublic = checkbox.new(options:findChildWidgetTag("make_public").id)
    local key = input.new(options:findChildWidgetTag("lobby_key").id)

    key:onFocus(function()
        key:setText(api.session.lobbyKey)
    end)
    key:onClick(function()
        core.copyToClipboard(api.session.lobbyKey)
        key:setText(string.rep("*", #api.session.lobbyKey))
    end)

    local mapPreview = component.new(blam.findTag("map_small_preview",
                                                  blam.tagClasses.uiWidgetDefinition).id)
    local playersList = list.new(lobbyMenu:findChildWidgetTag("players").id)
    playersList:scrollable(false)

    description:setText("Play with your friends, define your rules and enjoy.")

    local function getMapBackgroundBitmap(mapName)
        local mapCollection = blam.tagCollection(constants.tagCollections.maps.id)
        assert(mapCollection, "No map preview collection found")
        for k, v in pairs(mapCollection.tagList) do
            local bitmapTag = blam.getTag(v) --[[@as tag]]
            local mapBitmapName = core.getTagName(bitmapTag.path):lower()
            if mapBitmapName == mapName:lower() then
                return bitmapTag.id
            end
        end
        return constants.bitmaps.unknownMapPreview.id
    end

    local function setMapBackgroundBitmap(mapName)
        mapPreview.widgetDefinition.backgroundBitmap = getMapBackgroundBitmap(mapName)
    end

    local function editLobbyData()
        local template = template:getValue()
        local map = map:getValue()
        local gametype = gametype:getValue()
        -- Just send the data we want to change
        api.editLobby(api.session.lobbyKey, {
            template = template and template:lower() or nil,
            map = map,
            gametype = gametype and gametype:lower() or nil
        })
    end

    local function setDefinitionList()

    end

    if lobby and isPlayerLobbyOwner then
        elementsList:onSelect(function(item)
            local defComponent = item.value.component
            local value = item.value.text
            defComponent:setText(item.label)
            defComponent:setValue(value)
            editLobbyData()
        end)
        mapsList:onSelect(function(item)
            local defComponent = item.value.component
            local value = item.value.text
            defComponent:setText(item.label)
            defComponent:setValue(value)
            editLobbyData()
            setMapBackgroundBitmap(value)
        end)

        ---Change current definition of data in lobby
        ---@param lobbyDefComponent uiComponentButton
        ---@param newDefinition string
        ---@param filter string?
        local handleDefinition = function(lobbyDefComponent, newDefinition, filter)
            local component = elementsList
            if newDefinition == "map" then
                component = mapsList
            end
            local elements = state.available[newDefinition .. "s"]
            if filter then
                elements = table.filter(elements, function(element)
                    return element:lower():includes(filter:lower())
                end)
            end
            if not filter then
                search:setText("")
            end
            component:setItems(table.map(elements, function(element)
                ---@type uiComponentListItem
                local item = {
                    label = t(element),
                    value = {component = lobbyDefComponent, text = element}
                }
                if newDefinition == "template" or newDefinition == "gametype" then
                    item.bitmap = function(uiComponent)
                        local icon = component.new(uiComponent:findChildWidgetTag("button_icon").id)
                        local iconBitmaps = newDefinition == "template" and bitmaps.templateIcons or
                                                bitmaps.gametypeIcons
                        assert(iconBitmaps, "No icon bitmaps found")
                        icon.widgetDefinition.backgroundBitmap = iconBitmaps.id
                        local iconsToUse = newDefinition == "template" and templateIcons or
                                               gametypeIcons
                        local iconToUse = table.find(iconsToUse, function(icon)
                            return element:includes(icon)
                        end)
                        local backgroundBitmapIndex =
                            (table.indexof(iconsToUse, iconToUse) or 1) - 1
                        if backgroundBitmapIndex then
                            icon:setWidgetValues({bitmapIndex = backgroundBitmapIndex})
                        end
                    end
                end
                return item
            end))
            definition = newDefinition
        end

        local function showMapsListPanel()
            skullsPanel:replace(search.tagId)
            elementsList:replace(fullMapList.tagId)
            summary:show()
            description:show()
            makePublic:show()
            key:show()
        end

        local function showElementsListPanel()
            skullsPanel:replace(search.tagId)
            fullMapList:replace(elementsList.tagId)
            summary:show()
            description:show()
            makePublic:show()
            key:show()
        end

        local function showSkullsPanel()
            elementsList:replace(fullMapList.tagId)
            fullMapList:replace(elementsList.tagId)
            fullMapList:hide()
            elementsList:hide()
            summary:hide()
            description:hide()
            search:replace(skullsPanel.tagId)
            makePublic:hide()
            key:hide()
        end

        local definitionsToComponent = {template = template, map = map, gametype = gametype}
        search:onInputText(function(text)
            handleDefinition(definitionsToComponent[definition], definition, text)
        end)

        -- Force selection of map definition when opening the lobby menu
        map:onClick(function()
            showMapsListPanel()
            handleDefinition(map, "map")
        end)
        map:onFocus(function()
            description:setText(
                "Choose a map from the available list to play on, you need to have the map installed.")
        end)
        map.events.onClick()

        gametype:onClick(function()
            showElementsListPanel()
            handleDefinition(gametype, "gametype")
        end)
        gametype:onFocus(function()
            description:setText(
                "Game type defines the rules of the game, defines team play, scoring, etc.")
        end)

        template:onClick(function()
            showElementsListPanel()
            handleDefinition(template, "template")
        end)
        template:onFocus(function()
            description:setText(
                "Template defines a set of changes to the base server that will be applied when the lobby is created.")
        end)

        skulls:onClick(function()
            showSkullsPanel()
        end)

        play:onClick(function()
            if isPlayerLobbyOwner then
                local template = template:getValue()
                local map = map:getValue()
                local gametype = gametype:getValue()
                api.borrow(template:lower(), map, gametype:lower())
            else
                interface.dialog("WARNING", "", "You are not the owner of the lobby.")
            end
        end)

    end

    lobbyMenu:onOpen(function()
        if map.events.onClick then
            map.events.onClick()
        end
    end)
    lobbyMenu:onClose(function()
        api.deleteLobby()
    end)
    back:onClick(function()
        lobbyMenu.events.onClose()
    end)
    makePublic:onToggle(function(value)
        api.editLobby(api.session.lobbyKey, {isPublic = value})
    end)

    return function()
        template:setText(t(state.lobby.template))
        template:setValue(state.lobby.template)

        map:setText(t(state.lobby.map))
        map:setValue(state.lobby.map)

        gametype:setText(t(state.lobby.gametype))
        gametype:setValue(state.lobby.gametype)

        makePublic:setValue(state.lobby.isPublic)
        if api.session.lobbyKey then
            key:setText(string.rep("*", #api.session.lobbyKey))
        end
        setMapBackgroundBitmap(state.lobby.map)

        playersList:setItems(table.map(state.lobby.players, function(player)
            local nameplateTag = constants.nameplates[player.nameplate] or {}
            return {label = player.name, value = player, bitmap = nameplateTag.id}
        end))
    end
end
