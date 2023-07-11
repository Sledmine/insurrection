local components = require "insurrection.components"
local constants = require "insurrection.constants"
local button = require "insurrection.components.button"
local list = require "insurrection.components.list"
local input = require "insurrection.components.input"
local actions = require "insurrection.redux.actions"
local getState = require "insurrection.redux.getState"
local core = require "insurrection.core"
local blam = require "blam"
local findTag = blam.findTag
local tagClasses = blam.tagClasses
local s = require"insurrection.utils".snakeCaseToUpperSentenceCase

local shared = {}

local function render()
    local state = getState()
    shared.template:setText(s(state.lobby.template))

    local mapPreview = shared.mapPreview
    mapPreview.widgetDefinition.backgroundBitmap = constants.bitmaps.unknownMapPreview.id
    local mapCollection = blam.tagCollection(constants.tagCollections.maps.id)
    assert(mapCollection, "No map preview collection found")
    for k, v in pairs(mapCollection.tagList) do
        local bitmapTag = blam.getTag(v) --[[@as tag]]
        local mapName = core.getTagName(bitmapTag.path):lower()
        if mapName == state.lobby.map then
            mapPreview.widgetDefinition.backgroundBitmap = bitmapTag.id
        end
    end

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

    local iconToUse = table.find(gametypeIcons, function(icon)
        if state.lobby.gametype:find(icon, 1, true) then
            return true
        end
        return false
    end)
    local backgroundBitmapIndex = (table.indexof(gametypeIcons, iconToUse) or 1) - 1
    if backgroundBitmapIndex then
        shared.gametypeIcon:setWidgetValues({background_bitmap_index = backgroundBitmapIndex})
    end

    shared.description:setText(s(state.lobby.gametype:upper()) .. " on " .. s(state.lobby.map))

    shared.playersList:setItems(table.map(state.lobby.players, function(player)
        local nameplateTag = constants.nameplates[player.nameplate] or {}
        return {label = player.name, value = player, bitmap = nameplateTag.id}
    end))
end

local function init()
    local lobby = components.new(constants.widgets.lobbyClient.id)

    local template = components.new(lobby:findChildWidgetTag("template").id)

    local mapPreview = components.new(findTag("lobby_client_map", tagClasses.uiWidgetDefinition).id)
    mapPreview.widgetDefinition.backgroundBitmap = constants.bitmaps.unknownMapPreview.id

    local gametypeIcon = components.new(lobby:findChildWidgetTag("gametype_icon").id)

    local description = components.new(lobby:findChildWidgetTag("description").id)

    local playersList = list.new(lobby:findChildWidgetTag("players").id)
    playersList:scrollable(false)

    shared.mapPreview = mapPreview
    shared.playersList = playersList
    shared.template = template
    shared.gametypeIcon = gametypeIcon
    shared.description = description

    render()
end

return {init = init, update = render}
