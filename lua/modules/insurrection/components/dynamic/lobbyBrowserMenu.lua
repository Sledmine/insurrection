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

return function()
    local state = getState()
    local browser = components.new(constants.widgets.browser.id)
    local lobbies = list.new(browser:findChildWidgetTag("table_row_list").id)
    local scrollBar = bar.new(browser:findChildWidgetTag("table_scroll").id, "scroll")
    local mapPreview = components.new(browser:findChildWidgetTag("table_preview").id)
    local mapName = components.new(browser:findChildWidgetTag("table_map_name").id)
    local options = components.new(browser:findChildWidgetTag("lobby_browser_table_options_list").id)
    local joinGame = button.new(options:findChildWidgetTag("join_game_button").id)

    local function getMapBackgroundBitmap(mapName)
        local mapCollection = blam.tagCollection(constants.tagCollections.maps.id)
        assert(mapCollection, "No map preview collection found")
        for k, v in pairs(mapCollection.tagList) do
            local bitmapTag = blam.getTag(v) --[[@as tag]]
            -- bitmapTag.
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

    lobbies:onFocus(function(item)
        local lobby = state.lobbies[item.value]
        setMapBackgroundBitmap(lobby.map)
        mapName:setText(t(lobby.map))
    end)
    joinGame:onClick(function()
        local lobby = state.lobbies[lobbies:getSelectedItem().value]
        if lobby then
            api.lobby(lobby.key)
        end
    end)
    lobbies:setScrollBar(scrollBar)
    lobbies:scrollable(false)
    lobbies:selectable(true)

    local loadLobbies = function()
        lobbies:setItems(table.map((state.lobbies or {}), function(lobby, lobbyIndex)
            return {
                value = lobbyIndex,
                ---@param item uiComponent
                label = function(item)
                    local owner = components.new(item:findChildWidgetTag("owner_header_label").id)
                    local map = components.new(item:findChildWidgetTag("map_header_label").id)
                    local gameType = components.new(
                                         item:findChildWidgetTag("gametype_header_label").id)
                    local players = components.new(
                                        item:findChildWidgetTag("players_header_label").id)
                    local template = components.new(item:findChildWidgetTag("template_header_label").id)

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

    browser:onOpen(function(previousWidgetTag)
        if previousWidgetTag and previousWidgetTag.handle.value == constants.widgets.dashboard.id then
            api.getLobbies()
        end
        api.stopRefreshLobby()
        loadLobbies()
    end)
end
