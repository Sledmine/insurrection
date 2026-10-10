local engine = Engine
local component = require "ui.component"
local constants = require "insurrection.constants"
local button = require "ui.button"
local list = require "ui.list"
local input = require "ui.input"
local actions = require "insurrection.redux.actions"
local getState = require "insurrection.redux.getState"
local core = require "insurrection.core"
local s = require"insurrection.utils".snakeCaseToUpperTitleCase
local getMapMetadata = core.getMapMetadata

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

local function lobbyMenuClient()
    local state = getState()

    local lobby = component.new(constants.widgets.lobbyClient.handle.value)
    local template = component.new(lobby:findChildWidgetTag("template").handle.value)
    local mapPreviewTag = engine.tag.filterTags("ui_widget_definition", "lobby_client_map")[1]
    assert(mapPreviewTag, "Could not locate lobby_client_map ui widget definition")
    local mapPreview = component.new(mapPreviewTag.handle.value)
    local gametypeIcon = component.new(lobby:findChildWidgetTag("gametype_icon").handle.value)
    local description = component.new(lobby:findChildWidgetTag("description").handle.value)
    local playersList = list.new(lobby:findChildWidgetTag("players").handle.value)
    playersList:scrollable(false)

    -- Render
    return function()
        mapPreview.widgetDefinition.backgroundBitmap.tagHandle.value = constants.bitmaps.unknownMapPreview.handle.value
        local mapCollection = engine.tag.getTagData(constants.tagCollections.maps.handle.value, "tag_collection")
        assert(mapCollection, "No map preview collection found")
        for _, tagHandle in ipairs(mapCollection.tagList or {}) do
            local bitmapTagEntry = engine.tag.getTagEntry(tagHandle)
            if bitmapTagEntry then
                local mapName = core.getTagName(bitmapTagEntry.path):lower()
                if mapName == state.lobby.map then
                    mapPreview.widgetDefinition.backgroundBitmap.tagHandle.value = bitmapTagEntry.handle.value
                end
            end
        end

        local iconToUse = table.find(gametypeIcons, function(icon)
            if state.lobby.gametype:find(icon, 1, true) then
                return true
            end
            return false
        end)
        local backgroundBitmapIndex = (table.indexof(gametypeIcons, iconToUse) or 1) - 1
        if backgroundBitmapIndex then
            gametypeIcon:setBitmapIndex(backgroundBitmapIndex)
        end

        local mapMeta = getMapMetadata(state.lobby.map)
        local mapName = s(state.lobby.map)
        if mapMeta then
            mapName = mapMeta.title or mapName
        end
        description:setText(s(state.lobby.gametype:upper()) .. " on " .. mapName)

        playersList:setItems(table.map(state.lobby.players, function(player)
            local nameplateTag = constants.nameplates[player.nameplate] or {}
            return {label = player.name, value = player, bitmap = nameplateTag.handle and nameplateTag.handle.value}
        end))

        template:setText(s(state.lobby.template))
    end
end

return lobbyMenuClient
