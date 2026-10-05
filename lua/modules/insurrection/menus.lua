local engine = Engine
local constants = require "insurrection.constants"
-- Balltze v2 has no direct playSound equivalent for the old userInterface API.
local playSound = function() end
local core = require "insurrection.core"

local menus = {}

-- Wrapper function for opening a widget, plays sound and does internal logic
---@param widgetDefinition integer|string|EngineTagHandle @The handle or path of the widget definition
---@param pushHistory? boolean @If the widget should be pushed to the history; false by default
---@return MetaEngineWidget|nil @Created widget; nil if failed
local function openWidget(widgetDefinition, pushHistory)
    playSound(constants.sounds.success.handle.value)
    -- BALLTZE MIGRATE
    --return engine.uiWidget.launchWidget(widgetDefinition, pushHistory)
    return engine.uiWidget.launchWidget(widgetDefinition)
end

function menus.dashboard()
    openWidget(constants.widgets.dashboard.handle.value, true)
end

function menus.customization()
    openWidget(constants.widgets.customization.handle.value, true)
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
        isRejoiningLobby = currentWidgetTag.handle.value == constants.widgets.legacyModalError.handle.value
        logger.debug("Rejoining lobby: {}", isRejoiningLobby)
    end
    if client then
        logger.debug("Opening lobby client")
        openWidget(constants.widgets.lobbyClient.handle.value, not isRejoiningLobby)
        return
    end
    openWidget(constants.widgets.lobby.handle.value, not isRejoiningLobby)
end

function menus.pause()
    openWidget(constants.widgets.pause.handle.value, false)
end

function menus.open(widget, replace)
    openWidget(widget, replace or false)
end

function menus.biped()
    openWidget(constants.widgets.biped.handle.value, true)
end

function menus.lobbies()
    openWidget(constants.widgets.browser.handle.value, true)
end

function menus.bipedColor()
    openWidget(constants.widgets.bipedColor.handle.value, true)
end

return menus

