local components = require "insurrection.components"
local constants = require "insurrection.constants"
local list = require "insurrection.components.list"
local bar = require "insurrection.components.bar"
local button = require "insurrection.components.button"
local getState = require "insurrection.redux.getState"
local blam = require "blam"
local t = require"insurrection.utils".snakeCaseToTitleCase
local core = require "insurrection.core"
local interface = require "insurrection.interface"
local input = require("insurrection.components.input")
local interface = require "insurrection.interface"

return function()
    local state = getState()
    local browser = components.new(constants.widgets.browser.id)
    local lobbies = list.new(browser:findChildWidgetTag("table_row_list").id)
    local scrollBar = bar.new(browser:findChildWidgetTag("table_scroll").id, "scroll")
    local mapPreview = components.new(browser:findChildWidgetTag("table_preview").id)
    local mapName = components.new(browser:findChildWidgetTag("table_map_name").id)
    local author = components.new(browser:findChildWidgetTag("table_author").id)
    local description = components.new(browser:findChildWidgetTag("table_map_description").id)
    local options =
        components.new(browser:findChildWidgetTag("lobby_browser_table_options_list").id)
    local joinGame = button.new(options:findChildWidgetTag("join_game_button").id)
    local searchInput = input.new(browser:findChildWidgetTag("search_browser_input").id)
    local lobbyKeyInput = input.new(browser:findChildWidgetTag("table_key_input").id)

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

    local function resetSelectLobby()
        mapPreview.widgetDefinition.backgroundBitmap = constants.bitmaps.unknownMapPreview.id
        mapName:setText("Map Name")
        author:setText("Unknown")
        description:setText("No description available")
        lobbies:clearSelectedItem()
    end

    local function resetState()
        state.lobbies = {}
        resetSelectLobby()
        lobbyKeyInput:setValue("")
        lobbyKeyInput:setText("")
        searchInput:setValue("")
        searchInput:setText("")
    end
    lobbyKeyInput:onFocus(function()
        resetSelectLobby()
    end)
    lobbyKeyInput:onInputText(function()
        resetSelectLobby()
    end)

    local function setMapBackgroundBitmap(mapName)
        mapPreview.widgetDefinition.backgroundBitmap = getMapBackgroundBitmap(mapName)
    end

    lobbies:onFocus(function (item)
        local lobby = state.lobbies[item.value]
        assert(lobby, "No lobby found")
        setMapBackgroundBitmap(lobby.map)
        mapName:setText(t(lobby.map))
        local mapMetadata = table.find(constants.maps, function(map)
            return map.name == lobby.map
        end)
        if mapMetadata then
            author:setText(mapMetadata.author)
            description:setText(mapMetadata.description)
        else
            author:setText("Unknown")
            description:setText("No description available")
        end
    end)

    lobbies:onSelect(function(item)
        lobbyKeyInput:setValue("")
        lobbyKeyInput:setText("")
    end)

    joinGame:onClick(function()
        local selectedItem = lobbies:getSelectedItem()
        if selectedItem and selectedItem.value then
            local lobby = state.lobbies[selectedItem.value]
            api.lobby(lobby.key)
        else
            local lobbyKey = lobbyKeyInput:getText():trim()
            if lobbyKey and lobbyKey ~= "" then
                api.lobby(lobbyKey)
            else
                interface.dialog("ATTENTION", "ERROR", "Please select a lobby or enter a lobby key.")
            end
        end

    end)
    lobbies:setScrollBar(scrollBar)
    lobbies:scrollable(false)
    lobbies:selectable(true)

    local searchOwnerPlayer = function(query, players, owner)
        local ownerPlayer = table.find(players, function(player)
            return player.publicId == owner
        end)

        if not ownerPlayer then
            return nil
        end
        return ownerPlayer.name:lower():find(query)
    end

    local function renderLobbies(lobbiesTable)
        lobbies:setItems(table.map((lobbiesTable or {}), function(lobby, lobbyIndex)
            return {
                value = lobbyIndex,
                label = function(item)
                    local owner = components.new(item:findChildWidgetTag("owner_header_label").id)
                    local map = components.new(item:findChildWidgetTag("map_header_label").id)
                    local gameType = components.new(
                                         item:findChildWidgetTag("gametype_header_label").id)
                    local players = components.new(
                                        item:findChildWidgetTag("players_header_label").id)
                    local template = components.new(
                                         item:findChildWidgetTag("template_header_label").id)

                    local ownerPlayer = table.find(lobby.players, function(player)
                        return player.publicId == lobby.owner
                    end)
                    assert(ownerPlayer, "No owner found")
                    owner:setText(ownerPlayer.name)
                    map:setText(t(lobby.map))
                    gameType:setText(t(lobby.gametype))
                    players:setText(tostring(#lobby.players))
                    template:setText(t(lobby.template))
                end
            }
        end))
    end

    local loadLobbies = function()
        renderLobbies(state.lobbies or {})
    end
    searchInput:onInputText(function(data)
        local query = data:lower()

        local filteredLobbies = table.filter(state.lobbies or {}, function(lobby)
            return searchOwnerPlayer(query, lobby.players, lobby.owner) or
                       lobby.map:lower():includes(query) or lobby.template:lower():includes(query) or
                       lobby.gametype:lower():includes(query)
        end)

        renderLobbies(filteredLobbies)
    end)
    browser:onOpen(function(previousWidgetTag)
        if previousWidgetTag and previousWidgetTag.handle.value == constants.widgets.dashboard.id then
            resetState()
            api.getLobbies()
        end
        api.stopRefreshLobby()
        loadLobbies()
    end)

    return function ()
        loadLobbies()
    end
end
