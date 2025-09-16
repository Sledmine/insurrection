local component = require "insurrection.components"
local constants = require "insurrection.constants"
local button = require "insurrection.components.button"
local list = require "insurrection.components.list"
local bar = require "insurrection.components.bar"
local input = require "insurrection.components.input"
local core = require "insurrection.core"
local blam = require "blam"
local checkbox = require "insurrection.components.checkbox"
local firefight = require "insurrection.constants.projects.firefight"
local firefightMaps = firefight.maps.singleplayer
local t = require"insurrection.utils".snakeCaseToTitleCase

return function()
    local firefightMenu = component.new(constants.widgets.firefight.id)
    local options = component.new(firefightMenu:findChildWidgetTag("options").id)
    local mapsList = list.new(options:findChildWidgetTag("firefight_maps").id)
    local mapsListScroll = bar.new(firefightMenu:findChildWidgetTag("maps_scroll").id)
    mapsList:setScrollBar(mapsListScroll)
    local mapPreview = component.new(firefightMenu:findChildWidgetTag("preview").id)
    component.new(mapPreview:findChildWidgetTag("overlay_scanner").id):animate()
    local mapName = component.new(firefightMenu:findChildWidgetTag("map_name").id)
    local mapAuthor = component.new(firefightMenu:findChildWidgetTag("map_author").id)
    local mapDescription = component.new(firefightMenu:findChildWidgetTag("map_description").id)


    local definitions = component.new(options:findChildWidgetTag("definitions").id)
    local summary = component.new(firefightMenu:findChildWidgetTag("summary").id)
    local description = component.new(summary:findChildWidgetTag("text").id)
    local searchLabel = component.new(firefightMenu:findChildWidgetTag("search_label").id)
    local search = input.new(options:findChildWidgetTag("search").id)
    search:setAllowEmptyCharacters(false)

    local map = button.new(definitions:findChildWidgetTag("definition_map").id)
    local settings = button.new(definitions:findChildWidgetTag("definition_options").id)

    local settingsList = list.new(blam.findTag("firefight_config",
                                               blam.tagClasses.uiWidgetDefinition).id)

    local setMapBackgroundBitmap = function(mapName)
        mapPreview.widgetDefinition.backgroundBitmap = core.getMapBackgroundBitmap(mapName)
    end

    mapsList:onSelect(function(item)
        --local mapData = table.find(firefightMaps, function(map)
        --    return map.name == item.value
        --end)
        --if mapData then
        --end
        Engine.core.consolePrint("Loading map: " .. item.value)
        execute_script("sv_map " .. item.value .. " slayer")
    end)
    mapsList:onFocus(function(item)
        local mapData = table.find(firefightMaps, function(map)
            return map.name == item.value
        end)
        if mapData then
            setMapBackgroundBitmap(mapData.name)
            mapName:setText(mapData.title or t(mapData.name))
            mapAuthor:setText(mapData.author or "Unknown")
            mapDescription:setText(mapData.description or "No description available")
        else
            mapPreview.widgetDefinition.backgroundBitmap = constants.bitmaps.unknownMapPreview.id
            mapName:setText("Map Name")
            mapAuthor:setText("Unknown")
            mapDescription:setText("No description available")
        end
    end)
    mapsList:setItems(table.map(firefightMaps, function(map)
        local mapData = table.find(firefightMaps, function(m)
            return m.name == map.name
        end)
        return {
            label = mapData and (mapData.title or t(map.name)) or t(map.name),
            value = map.name
        }
    end))

    local function displayMapsPanel(isVisible)
        if isVisible then
            mapsList:show()
            mapsListScroll:show()
            mapPreview:show()
            search:show()
            searchLabel:show()
            mapName:show()
            mapAuthor:show()
            mapDescription:show()
            return
        end
        mapsList:hide()
        mapsListScroll:hide()
        mapPreview:hide()
        search:hide()
        searchLabel:hide()
        mapName:hide()
        mapAuthor:hide()
        mapDescription:hide()
    end

    map:onClick(function()
        settingsList:replace(mapsList.tag.id)
        displayMapsPanel(true)
    end)

    settings:onClick(function()
        mapsList:replace(settingsList.tag.id)
        displayMapsPanel(false)
    end)

    return function()

    end
end
