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

function menus.lobby(client)
    if client then
        openWidget(constants.widgets.lobbyClient.id, true)
        return
    end
    openWidget(constants.widgets.lobby.id, true)
end

function menus.pause()
    openWidget(constants.widgets.pause.id, false)
end

function menus.open(widget)
    openWidget(widget, false)
end

function menus.main()
    execute_script("fade_screen_in")
    execute_script("set_ui_background")
    load_ui_widget(constants.widgets.main.path)
end

return menus

