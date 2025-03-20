local components = require "insurrection.components"
local constants = require "insurrection.constants"
local button = require "insurrection.components.button"
local input = require "insurrection.components.input"
local list = require "insurrection.components.list"
local bar = require "insurrection.components.bar"
local interface = require "insurrection.interface"
local getState = require "insurrection.redux.getState"
local blam = require "blam"
local utils = require "insurrection.utils"
local t = require"insurrection.utils".snakeCaseToTitleCase

return function()
    local state = getState()
    local browser = components.new(constants.widgets.browser.id)
    local preview = components.new(browser:findChildWidgetTag("preview").id)
    local lobbies = list.new(browser:findChildWidgetTag("table_row_list").id)
    local scrollBar = bar.new(browser:findChildWidgetTag("table_scroll").id, "scroll")

    lobbies:setScrollBar(scrollBar)
    lobbies:scrollable(false)

    local loadLobbies = function()
        lobbies:setItems(table.map((state.lobbies or {}), function(lobby)
            return {
                ---@param item uiComponent
                label = function(item)
                    local owner = components.new(item:findChildWidgetTag("owner_header_label").id)
                    local map = components.new(item:findChildWidgetTag("map_header_label").id)
                    local gameType = components.new(
                                         item:findChildWidgetTag("gametype_header_label").id)
                    local players = components.new(
                                        item:findChildWidgetTag("players_header_label").id)
                    local ping = components.new(item:findChildWidgetTag("ping_header_label").id)

                    local ownerPlayer = table.find(lobby.players, function(player)
                        return player.publicId == lobby.owner
                    end)
                    assert(ownerPlayer, "No owner found")
                    owner:setText(ownerPlayer.name)
                    map:setText(t(lobby.map))
                    gameType:setText(t(lobby.gametype))
                    players:setText(tostring(#lobby.players))
                    ping:setText(tostring(math.random(0, 100)))
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
