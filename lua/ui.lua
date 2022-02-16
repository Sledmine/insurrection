clua_version = 2.056

local harmony = require "mods.harmony"
local inspect = require "inspect"

local chimera = require "insurrection.chimera"
local core = require "insurrection.core"

math.randomseed(os.time() + ticks())
local gameStarted = false

local function onGameStart()
    -- Load Insurrection features
    if (core.loadInsurrectionPatches()) then
        harmony.ui.set_aspect_ratio(16, 9)
        --chimera.loadBookmarks()
        core.loadNameplates()
        execute_script("menu_blur_on")
    end
    -- Workaround fix to prevent players from getting stuck in a game server at menu
    execute_script("disconnect")
end

function OnTick()
    -- Game started event trick
    if (not gameStarted and map:find("ui")) then
        gameStarted = true
        onGameStart()
    end
    local currentUiWidget = core.getCurrentUIWidget()
    if (currentUiWidget) then
        --console_out(currentUiWidget.path)
        if (currentUiWidget.path:find("multiplayer_menu") or "chimera_servers_menu") then
            chimera.loadBookmarks()
        else
            chimera.resetBookmarks()
        end
    end
end

function OnMenuAccept(widgetTagId)
    return chimera.mapBookMarks(widgetTagId) or true
end

set_callback("tick", "OnTick")
harmony.set_callback("menu accept", "OnMenuAccept")
