local harmony = require "mods.harmony"
local openWidget = harmony.menu.open_widget
local constants = require "insurrection.constants"
local core = require "insurrection.core"

local menus = {}

function menus.dashboard()
    openWidget(constants.widgets.dashboard.id, true)
end

function menus.customization()
    openWidget(constants.widgets.customization.id, true)
end

--- Open the lobby widget
---@param client? boolean
function menus.lobby(client)
    local currentWidgetTag = core.getCurrentUIWidgetTag()
    local isRejoiningLobby = false
    if currentWidgetTag then
        -- This is a workaround for the game's behavior when rejoining the lobby
        --
        -- Game throws a legacy message saying "The game has closed down" when rejoining the lobby
        -- Because the normal game ended, we need to rejoin the lobby and get rid of this message
        isRejoiningLobby = currentWidgetTag.id == constants.widgets.legacyModalError.id
    end
    if client then
        openWidget(constants.widgets.lobbyClient.id, not isRejoiningLobby)
        return
    end
    openWidget(constants.widgets.lobby.id, not isRejoiningLobby)
end

function menus.pause()
    openWidget(constants.widgets.pause.id, false)
end

function menus.open(widget)
    openWidget(widget, false)
end

function menus.biped()
    openWidget(constants.widgets.biped.id, true)
end

function menus.lobbies()
    openWidget(constants.widgets.browser.id, true)
end

return menus

