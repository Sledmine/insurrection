local component = require "ui.component"
local constants = require "insurrection.constants"
local button = require "ui.button"
local list = require "ui.list"
local input = require "ui.input"
local core = require "insurrection.core"
local blam = require "blam"
local getState = require "insurrection.redux.getState"
local checkbox = require "ui.checkbox"
local bar = require "ui.bar"
local t = require"insurrection.utils".snakeCaseToTitleCase
local getMapMetadata = core.getMapMetadata
local lobbyData = require "insurrection.constants.lobbyData"
local engine = Engine

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
    gametypeIcons = engine.tag.filterTags("bitmap", "lobby_gametype_icon")[1],
    templateIcons = engine.tag.filterTags("bitmap", "lobby_template_icon")[1]
}

return function()
    local state = getState()
    local lobby = state.lobby
    local definition = "map"

    local isPlayerLobbyOwner = api.session.player and state.lobby and api.session.player.publicId ==
                                   state.lobby.owner

    local lobbyMenu = component.new(constants.widgets.lobby.handle.value)
    local summary = component.new(lobbyMenu:findChildWidgetTag("summary").handle.value)
    local description = component.new(summary:findChildWidgetTag("text").handle.value)

    local options = component.new(lobbyMenu:findChildWidgetTag("options").handle.value)

    local definitionList = component.new(options:findChildWidgetTag("definitions").handle.value)

    local template = button.new(definitionList:findChildWidgetTag("template").handle.value)
    local map = button.new(definitionList:findChildWidgetTag("map").handle.value)
    local gametype = button.new(definitionList:findChildWidgetTag("gametype").handle.value)

    -- local skulls = button.new(definitionList:findChildWidgetTag("skulls").handle.value)
    -- local lobbySettings = button.new(lobbyDefs:findChildWidgetTag("settings").handle.value)
    -- local skullsPanel = component.new(engine.tag.filterTags("ui_widget_definition", "skulls_panel")[1].handle.value)

    local elementsList = list.new(options:findChildWidgetTag("elements").handle.value)
    local mapsList = list.new(engine.tag.filterTags("ui_widget_definition", "lobby_maps_options")[1]
                                  .handle.value)

    local fullMapListWrapper = component.new(engine.tag.filterTags("ui_widget_definition",
                                                                   "lobby_maps_panel")[1].handle
                                                 .value)

    local mapsListScroll = bar.new(fullMapListWrapper:get("maps_scroll"), "scroll")
    mapsList:setScrollBar(mapsListScroll)

    local mapPreview = component.new(fullMapListWrapper:get("map_small_preview"))
    local mapName = component.new(fullMapListWrapper:get("map_name"))
    local mapAuthor = component.new(fullMapListWrapper:get("map_author"))
    local mapDescription = component.new(fullMapListWrapper:get("map_description"))
    component.new(mapPreview:findChildWidgetTag("overlay_scanner").handle.value):setAnimated(true,
                                                                                             true,
                                                                                             2.3, 1)

    local search = input.new(options:findChildWidgetTag("search").handle.value)
    local play = button.new(options:findChildWidgetTag("play").handle.value)
    local back = button.new(options:findChildWidgetTag("back").handle.value)
    local makePublic = checkbox.new(options:findChildWidgetTag("make_public").handle.value)
    local key = input.new(options:findChildWidgetTag("lobby_key").handle.value)

    key:onFocus(function()
        key:setText(api.session.lobbyKey)
        description:setText("Click to copy the lobby key.")
    end)
    key:onClick(function()
        core.copyToClipboard(api.session.lobbyKey)
        key:setText(string.rep("*", #api.session.lobbyKey))
    end)

    local mapPreview = component.new(engine.tag.filterTags("ui_widget_definition",
                                                           "map_small_preview")[1].handle.value)
    local playersList = list.new(lobbyMenu:findChildWidgetTag("players").handle.value)
    playersList:scrollable(false)

    description:setText("Play with your friends, define your rules and enjoy.")

    local function setMapBackgroundBitmap(mapName)
        mapPreview.widgetDefinition.backgroundBitmap.tagHandle.value =
            core.getMapBackgroundBitmap(mapName)
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

    local function setMapData(selectedMapName)
        setMapBackgroundBitmap(selectedMapName)
        local mapMetadata = getMapMetadata(selectedMapName)
        if not mapMetadata then
            mapName:setText(t(selectedMapName))
            mapAuthor:setText("Unknown")
            mapDescription:setText("No description available")
            return
        end
        -- local displayName = mapMetadata.name
        -- if mapMetadata.title then
        --    displayName = mapMetadata.title .. " (" .. mapMetadata.name .. ")"
        -- end
        -- mapName:setText(displayName)
        mapName:setText(mapMetadata.title or t(mapMetadata.name))
        mapAuthor:setText(mapMetadata.author)
        mapDescription:setText(mapMetadata.description)
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
            setMapData(value)
        end)

        ---Change current definition of data in lobby
        ---@param lobbyDefComponent uiComponentButton
        ---@param newDefinition string
        ---@param filter string?
        local handleDefinition = function(lobbyDefComponent, newDefinition, filter)
            local component = elementsList
            local isMapDefinition = newDefinition == "map"
            if isMapDefinition then
                component = mapsList
            end
            local elements = state.available[newDefinition .. "s"]
            local itemsList = table.map(elements, function(element)
                ---@type uiComponentListItem
                local item = {
                    label = t(element),
                    value = {component = lobbyDefComponent, text = element}
                }
                if isMapDefinition then
                    local mapMetadata = getMapMetadata(element)
                    if mapMetadata then
                        item.label = mapMetadata.title
                    end
                end
                if newDefinition == "template" or newDefinition == "gametype" then
                    item.bitmap = function(uiComponent)
                        local icon = component.new(
                                         uiComponent:findChildWidgetTag("button_icon").handle.value)
                        local iconBitmaps = newDefinition == "template" and bitmaps.templateIcons or
                                                bitmaps.gametypeIcons
                        assert(iconBitmaps, "No icon bitmaps found")
                        icon.widgetDefinition.backgroundBitmap.tagHandle.value = iconBitmaps.handle
                                                                                     .value
                        local iconsToUse = newDefinition == "template" and templateIcons or
                                               gametypeIcons
                        local iconToUse = table.find(iconsToUse, function(icon)
                            return element:includes(icon)
                        end)
                        local backgroundBitmapIndex =
                            (table.indexof(iconsToUse, iconToUse) or 1) - 1
                        if backgroundBitmapIndex then
                            icon:setBitmapIndex(backgroundBitmapIndex)
                        end
                    end
                end
                return item
            end)
            if filter then
                itemsList = table.filter(itemsList, function(item)
                    local byValue = item.value.text:lower():includes(filter:lower())
                    local isLabelText = type(item.label) == "string"
                    local byLabel = isLabelText and item.label:lower():includes(filter:lower())
                    return byValue or byLabel
                end)
            end
            if not filter then
                search:setText("")
            end
            if newDefinition == "gametype" or newDefinition == "template" then
                component:onFocus(function(item)
                    local definitionData = lobbyData[newDefinition .. "s"][item.value.text]
                    if definitionData then
                        description:setText(definitionData.description)
                    end
                end)
            else
                mapsList:onFocus(function(item)
                    -- setMapData(item.value.text)
                end)
            end
            component:setItems(itemsList)
            definition = newDefinition
        end

        local function showMapsListPanel()
            -- skullsPanel:replace(search.tagId)
            elementsList:replace(fullMapListWrapper.handleValue)
            summary:hide()
            description:hide()
            makePublic:show()
            key:show()
        end

        local function showElementsListPanel()
            -- skullsPanel:replace(search.handleValue)
            fullMapListWrapper:replace(elementsList.handleValue)
            summary:show()
            description:show()
            makePublic:hide()
            key:hide()
        end

        local function showSkullsPanel()
            elementsList:replace(fullMapListWrapper.handleValue)
            fullMapListWrapper:replace(elementsList.handleValue)
            fullMapListWrapper:hide()
            elementsList:hide()
            -- summary:hide()
            -- description:hide()
            -- search:replace(skullsPanel.handleValue)
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
                "Choose a map from the available list to play on, you need\nto have the map installed.")
        end)
        map.events.onClick()

        gametype:onClick(function()
            showElementsListPanel()
            handleDefinition(gametype, "gametype")
        end)
        gametype:onFocus(function()
            description:setText(
                "Game type defines the rules of the game, defines team\nplay, scoring, etc.")
        end)

        template:onClick(function()
            showElementsListPanel()
            handleDefinition(template, "template")
        end)
        template:onFocus(function()
            description:setText(
                "Template defines a set of changes to the base server\nthat will be applied when the lobby is created.")
        end)

        -- skulls:onClick(function()
        --    showSkullsPanel()
        -- end)

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
        makePublic:setValue(state.lobby.isPublic)
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
    makePublic:onFocus(function()
        -- description:setText("Toggle whether the lobby is public or private. Public lobbies can be joined by anyone,\n private lobbies require an invite or the lobby key.")
    end)

    return function()
        template:setText(t(state.lobby.template))
        template:setValue(state.lobby.template)

        local mapMeta = getMapMetadata(state.lobby.map)
        if not mapMeta then
            map:setText(t(state.lobby.map))
        else
            map:setText(mapMeta.title or t(state.lobby.map))
        end
        map:setValue(state.lobby.map)

        gametype:setText(t(state.lobby.gametype))
        gametype:setValue(state.lobby.gametype)

        if api.session.lobbyKey then
            key:setText(string.rep("*", #api.session.lobbyKey))
        end
        setMapData(state.lobby.map)

        local playerPlateItems = table.map(state.lobby.players, function(player)
            local nameplateTag = constants.nameplates[player.nameplate] or {}
            ---@type uiComponentListItem
            return {
                label = function(item)
                    local plate = component.new(item:findChildWidgetTag("overlay").handle.value)
                    plate:setText(player.name)
                end,
                value = player,
                bitmap = nameplateTag.handle and nameplateTag.handle.value
            }
        end)

        playersList:setItems(playerPlateItems)
    end
end
