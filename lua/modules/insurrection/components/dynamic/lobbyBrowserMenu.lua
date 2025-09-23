local components = require "insurrection.components"
local constants = require "insurrection.constants"
local list = require "insurrection.components.list"
local bar = require "insurrection.components.bar"
local button = require "insurrection.components.button"
local getState = require "insurrection.redux.getState"
local t = require"insurrection.utils".snakeCaseToTitleCase
local core = require "insurrection.core"
local interface = require "insurrection.interface"
local input = require "insurrection.components.input"

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
    local refreshButton = button.new(options:findChildWidgetTag("refresh_button").id)

    components.new(mapPreview:findChildWidgetTag("overlay_scanner").id):setAnimated(true, true, 2.3, 1)
    searchInput:setAllowEmptyCharacters(false)
    lobbyKeyInput:setAllowEmptyCharacters(false)
    lobbies:setScrollBar(scrollBar)
    lobbies:scrollable(false)
    lobbies:selectable(true)

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
    lobbyKeyInput:onInputText(function()
        lobbies:clearSelectedItem()
        resetSelectLobby()
    end)

    local function setMapBackgroundBitmap(mapName)
        mapPreview.widgetDefinition.backgroundBitmap = core.getMapBackgroundBitmap(mapName)
    end

    lobbies:onFocus(function(item)
        local lobby = table.find(state.lobbies, function(lobby)
            return lobby.key == item.value
        end)
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
        -- TODO Review input bevahiour for input change, as we might onChange and onInputText
        -- being triggered depending of setText or when user types
        lobbyKeyInput:setText("")
    end)

    joinGame:onClick(function()
        local selectedItem = lobbies:getSelectedItem()
        if selectedItem and selectedItem.value then
            local lobby = table.find(state.lobbies, function(lobby)
                return lobby.key == selectedItem.value
            end)
            assert(lobby, "No lobby data found for selected item")
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

    local findOwnerInLobby = function(query, players, owner)
        local ownerPlayer = table.find(players, function(player)
            return player.publicId == owner
        end)

        if not ownerPlayer then
            return nil
        end
        return ownerPlayer.name:lower():find(query)
    end

    local function renderLobbies(lobbyList)
        lobbies:setItems(table.map((lobbyList or {}), function(lobby, lobbyIndex)
            return {
                value = lobby.key,
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

    local filterLobbies = function(query)
        return table.filter(state.lobbies or {}, function(lobby)
            return findOwnerInLobby(query, lobby.players, lobby.owner) or
                       lobby.map:lower():includes(query) or lobby.template:lower():includes(query) or
                       lobby.gametype:lower():includes(query)
        end)
    end

    local loadLobbies = function()
        renderLobbies(filterLobbies(searchInput:getText():lower()))
    end
    searchInput:onInputText(function(data)
        resetSelectLobby()
        renderLobbies(filterLobbies(data:lower():trim()))
    end)
    browser:onOpen(function(previousWidgetTag)
        if previousWidgetTag and previousWidgetTag.handle.value == constants.widgets.dashboard.id then
            resetState()
            api.getLobbies()
        end
        resetSelectLobby()
        api.stopRefreshLobby()
        loadLobbies()
    end)

    refreshButton:onClick(function()
        resetSelectLobby()
        api.getLobbies()
    end)

    return function()
        loadLobbies()
    end
end
