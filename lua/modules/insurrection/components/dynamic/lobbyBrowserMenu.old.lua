local engine = Engine
local component = require "ui.component"
local constants = require "insurrection.constants"
local button = require "ui.button"
local input = require "ui.input"
local list = require "ui.list"
local interface = require "insurrection.interface"
local getState = require "insurrection.redux.getState"
local blam = require "blam"
local utils = require "insurrection.utils"
local t = require "insurrection.utils".snakeCaseToUpperTitleCase

return function()
    local state = getState()
    local browser = component.new(constants.widgets.browser.handle.value)

    local lobbies = list.new(browser:findChildWidgetTag("lobby_browser_list").handle.value, 1, 6)
    lobbies:onSelect(function(item)
        local lobby = state.lobbies[item.value]
        if lobby then
            api.lobby(lobby.key)
        end
    end)

    browser:onOpen(function(previousWidgetTag)
        if previousWidgetTag and previousWidgetTag.handle.value == constants.widgets.dashboard.handle.value then
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
                    local mapPreview = component.new(element:findChildWidgetTag("preview").handle.value)
                    local template = component.new(element:findChildWidgetTag("template").handle.value)
                    --local gametypeIcon = component.new(element:findChildWidgetTag("gametype_icon").handle.value)
                    local description = component.new(element:findChildWidgetTag("description").handle.value)
                    local owner = component.new(element:findChildWidgetTag("owner").handle.value)
                    local players = component.new(element:findChildWidgetTag("players").handle.value)

                    mapPreview.widgetDefinition.backgroundBitmap = constants.bitmaps
                                                                       .unknownMapPreview.handle.value
                    local mapCollection = engine.tag.getTagData(constants.tagCollections.maps.handle.value,
                                                              "tag_collection")
                    assert(mapCollection, "No map preview collection found")
                    for _, tagHandle in ipairs(mapCollection.tagList or {}) do
                        local bitmapTagEntry = engine.tag.getTagEntry(tagHandle)
                        assert(bitmapTagEntry, "No bitmap tag found")
                        local mapName = utils.path(bitmapTagEntry.path).name:lower()
                        if mapName == lob.map then
                            mapPreview.widgetDefinition.backgroundBitmap = bitmapTagEntry.handle.value
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
