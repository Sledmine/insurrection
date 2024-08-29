local components = require "insurrection.components"
local constants = require "insurrection.constants"
local button = require "insurrection.components.button"
local input = require "insurrection.components.input"
local list = require "insurrection.components.list"
local interface = require "insurrection.interface"
local getState = require "insurrection.redux.getState"
local blam = require "blam"
local utils = require "insurrection.utils"
local t = require "insurrection.utils".snakeCaseToUpperTitleCase

return function()
    local state = getState()
    local browser = components.new(constants.widgets.browser.id)

    local lobbies = list.new(browser:findChildWidgetTag("lobby_browser_list").id, 1, 6)
    lobbies:onSelect(function(item)
        local lobby = state.lobbies[item.value]
        if lobby then
            api.lobby(lobby.key)
        end
    end)

    browser:onOpen(function(previousWidgetTag)
        if previousWidgetTag and previousWidgetTag.handle.value == constants.widgets.dashboard.id then
            api.getLobbies()
        end
        api.stopRefreshLobby()
    end)

    return function()
        lobbies:setItems(table.map((state.lobbies or {}), function(lob, lobbyIndex)
            return {
                -- label = v.name,
                value = lobbyIndex,
                bitmap = function(element)
                    local mapPreview = components.new(element:findChildWidgetTag("preview").id)
                    local template = components.new(element:findChildWidgetTag("template").id)
                    --local gametypeIcon = components.new(element:findChildWidgetTag("gametype_icon").id)
                    local description = components.new(element:findChildWidgetTag("description").id)
                    local owner = components.new(element:findChildWidgetTag("owner").id)
                    local players = components.new(element:findChildWidgetTag("players").id)

                    mapPreview.widgetDefinition.backgroundBitmap = constants.bitmaps
                                                                       .unknownMapPreview.id
                    local mapCollection = blam.tagCollection(constants.tagCollections.maps.id)
                    assert(mapCollection, "No map preview collection found")
                    for k, v in pairs(mapCollection.tagList) do
                        local bitmapTag = blam.getTag(v)
                        assert(bitmapTag, "No bitmap tag found")
                        local mapName = utils.path(bitmapTag.path).name:lower()
                        if mapName == lob.map then
                            mapPreview.widgetDefinition.backgroundBitmap = bitmapTag.id
                        end
                    end

                    template:setText(t(lob.template))
                    description:setText(t(lob.gametype) .. " on " .. t(lob.map))
                    local lobbyOwner = table.find(lob.players, function(player)
                        return player.publicId == lob.owner
                    end)
                    owner:setText(lobbyOwner.name)
                    players:setText(#lob.players .. "/" .. 16)
                end
            }
        end))
    end
end
