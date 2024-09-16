local component = require "insurrection.components"
local constants = require "insurrection.constants"
local button = require "insurrection.components.button"
local list = require "insurrection.components.list"
local input = require "insurrection.components.input"
local core = require "insurrection.core"
local blam = require "blam"
local getState = require "insurrection.redux.getState"
local checkbox = require "insurrection.components.checkbox"

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

local templateIcons = {
    "stock",
    "fiesta"
}

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
    local summary = component.new(
                        component.new(lobbyMenu:findChildWidgetTag("summary").id):findChildWidgetTag(
                            "text").id)

    local options = component.new(lobbyMenu:findChildWidgetTag("options").id)

    local definitionList = component.new(options:findChildWidgetTag("definitions").id)
    local template = button.new(definitionList:findChildWidgetTag("template").id)

    local map = button.new(definitionList:findChildWidgetTag("map").id)
    local gametype = button.new(definitionList:findChildWidgetTag("gametype").id)

    -- local lobbySettings = button.new(lobbyDefs:findChildWidgetTag("settings").id)

    local elementsList = list.new(options:findChildWidgetTag("elements").id)
    local mapsList = list.new(blam.findTag("lobby_maps_options", blam.tagClasses.uiWidgetDefinition)
                                  .id)
    local fullMapList = component.new(blam.findTag("lobby_maps_wrapper",
                                                   blam.tagClasses.uiWidgetDefinition).id)
    local mapDescription = component.new(blam.findTag("map_small",
                                                      blam.tagClasses.uiWidgetDefinition).id)
    local mapOverlay =
        component.new(mapDescription:findChildWidgetTag("overlay_scanner").id):animate()
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

    summary:setText("Play with your friends, define your rules and enjoy.")

    local function getMapBackgroundBitmap(mapName)
        local mapCollection = blam.tagCollection(constants.tagCollections.maps.id)
        assert(mapCollection, "No map preview collection found")
        for k, v in pairs(mapCollection.tagList) do
            local bitmapTag = blam.getTag(v) --[[@as tag]]
            local mapBitmaName = core.getTagName(bitmapTag.path):lower()
            if mapBitmaName == mapName:lower() then
                return bitmapTag.id
            end
        end
        return constants.bitmaps.unknownMapPreview.id
    end

    local function setMapBackgroundBitmap(mapName)
        mapPreview.widgetDefinition.backgroundBitmap = getMapBackgroundBitmap(mapName)
    end

    if lobby and isPlayerLobbyOwner then
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
            setMapBackgroundBitmap(item.label)
        end)

        local handleDefinition = function(lobbyDef, newDefinition)
            log("Changing definition to " .. newDefinition)
            search:setText("")
            local component = elementsList
            if newDefinition == "map" then
                component = mapsList
            end
            component:setItems(table.map(state.available[newDefinition .. "s"], function(element)
                ---@type uiComponentListItem
                local item = {label = element, value = lobbyDef}
                if newDefinition == "template" or newDefinition == "gametype" then
                    item.bitmap = function(uiComponent)
                        local icon = component.new(uiComponent:findChildWidgetTag("button_icon").id)
                        local iconBitmaps = newDefinition == "template" and bitmaps.templateIcons or
                                                   bitmaps.gametypeIcons
                        assert(iconBitmaps, "No icon bitmaps found")
                        icon.widgetDefinition.backgroundBitmap = iconBitmaps.id
                        local iconsToUse = newDefinition == "template" and templateIcons or gametypeIcons
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

        template:onClick(function()
            fullMapList:replace(elementsList.tagId)
            handleDefinition(template, "template")
        end)
        template:onFocus(function()
            summary:setText(
                "Template defines a set of changes to the base server that will be applied when the lobby is created.")
        end)

        -- Force selection of map definition when opening the lobby menu
        map:onClick(function()
            elementsList:replace(fullMapList.tagId)
            handleDefinition(map, "map")
        end)
        map:onFocus(function()
            summary:setText(
                "Choose a map from the available list to play on, you need to have the map installed.")
        end)
        map.events.onClick()

        gametype:onClick(function()
            fullMapList:replace(elementsList.tagId)
            handleDefinition(gametype, "gametype")
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

    local definitionsToComponent = {template = template, map = map, gametype = gametype}
    search:onInputText(function(text)
        local elements = state.available[definition .. "s"] --[=[@as string[]]=]
        elements = table.filter(elements, function(element)
            return element:lower():includes(text:lower())
        end)
        local component = elementsList
        if definition == "map" then
            component = mapsList
        end

        component:setItems(table.map(elements, function(element)
            ---@type uiComponentListItem
            local item = {label = element, value = definitionsToComponent[definition]}
            if definition ~= "map" then
                item.bitmap = function(uiComponent)
                    local icon = component.new(uiComponent:findChildWidgetTag("button_icon").id)
                    local iconToUse = table.find(gametypeIcons, function(icon)
                        return element:includes(icon)
                    end)
                    local backgroundBitmapIndex = (table.indexof(gametypeIcons, iconToUse) or 1) - 1
                    if backgroundBitmapIndex then
                        icon:setWidgetValues({bitmapIndex = backgroundBitmapIndex})
                    end
                end
            end
            return item
        end))
    end)

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
        template:setText(state.lobby.template)
        map:setText(state.lobby.map)
        gametype:setText(state.lobby.gametype)
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
