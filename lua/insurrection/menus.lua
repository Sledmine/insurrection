local harmony = require "mods.harmony"
local openWidget = harmony.menu.open_widget
local constants = require "insurrection.constants"

local menus = {}

function menus.dashboard()
    openWidget(constants.widgets.dashboard.id, true)
end

function menus.customization()
    openWidget(constants.widgets.customization.id, true)
end

function menus.lobby()
    openWidget(constants.widgets.lobby.id, true)
end

function menus.pause()
    openWidget(constants.widgets.pause.id, false)
end

return menus
