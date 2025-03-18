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

    local lobbies = list.new(browser:findChildWidgetTag("lobby_browser_table_row_list").id)
    
    lobbies:scrollable(false)
    lobbies:setItems({
        {value = "Lobby 1"},
        {value = "Lobby 2"},
        {value = "Lobby 3"},
        {value = "Lobby 4"},
        {value = "Lobby 5"},
        {value = "Lobby 6"},
        {value = "Lobby 7"},
        {value = "Lobby 8"},
        {value = "Lobby 9"},
    })

end
