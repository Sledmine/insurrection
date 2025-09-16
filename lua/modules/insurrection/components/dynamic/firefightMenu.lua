local component = require "insurrection.components"
local constants = require "insurrection.constants"
local button = require "insurrection.components.button"
local list = require "insurrection.components.list"
local input = require "insurrection.components.input"
local core = require "insurrection.core"
local blam = require "blam"
local getState = require "insurrection.redux.getState"
local checkbox = require "insurrection.components.checkbox"
local t = require"insurrection.utils".snakeCaseToTitleCase

return function()
    local firefightMenu = component.new(constants.widgets.firefight.id)
    local options = component.new(firefightMenu:findChildWidgetTag("options").id)
    local mapsList = component.new(options:findChildWidgetTag("firefight_maps").id)
    local mapsListScroll = component.new(firefightMenu:findChildWidgetTag("maps_scroll").id)
    local mapPreview = component.new(firefightMenu:findChildWidgetTag("preview").id)
    local mapName = component.new(firefightMenu:findChildWidgetTag("map_name").id)
    local mapAuthor = component.new(firefightMenu:findChildWidgetTag("map_author").id)
    local mapDescription = component.new(firefightMenu:findChildWidgetTag("map_description").id)


    local definitions = component.new(options:findChildWidgetTag("definitions").id)
    local summary = component.new(firefightMenu:findChildWidgetTag("summary").id)
    local description = component.new(summary:findChildWidgetTag("text").id)
    local searchLabel = component.new(firefightMenu:findChildWidgetTag("search_label").id)
    local search = input.new(options:findChildWidgetTag("search").id)

    local map = button.new(definitions:findChildWidgetTag("definition_map").id)
    local settings = button.new(definitions:findChildWidgetTag("definition_options").id)

    local settingsList = list.new(blam.findTag("firefight_config",
                                               blam.tagClasses.uiWidgetDefinition).id)

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
