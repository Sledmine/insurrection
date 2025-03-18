local engine = Engine
local constants = require "insurrection.constants"
local playSound = engine.userInterface.playSound
local core = require "insurrection.core"

local menus = {}

-- Wrapper function for opening a widget, plays sound and does internal logic
---@param widgetDefinition integer|string|EngineTagHandle @The handle or path of the widget definition
---@param pushHistory? boolean @If the widget should be pushed to the history; false by default
---@return MetaEngineWidget|nil @Created widget; nil if failed
local function openWidget(widgetDefinition, pushHistory)
    playSound(constants.sounds.success.id)
    return engine.userInterface.openWidget(widgetDefinition, pushHistory)
end

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
        log("Rejoining lobby: {}", isRejoiningLobby)
    end
    if client then
        logger:debug("Opening lobby client")
        openWidget(constants.widgets.lobbyClient.id, not isRejoiningLobby)
        return
    end
    openWidget(constants.widgets.lobby.id, not isRejoiningLobby)
end

function menus.pause()
    openWidget(constants.widgets.pause.id, false)
end

function menus.open(widget, replace)
    openWidget(widget, replace or false)
end

function menus.biped()
    openWidget(constants.widgets.biped.id, true)
end

function menus.lobbies()
    openWidget(constants.widgets.browser.id, true)
end

function menus.bipedColor()
    openWidget(constants.widgets.bipedColor.id, true)
end

return menus

