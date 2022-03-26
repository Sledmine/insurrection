clua_version = 2.056

local harmony = require "mods.harmony"
inspect = require "inspect"

local chimera = require "insurrection.chimera"
local core = require "insurrection.core"

math.randomseed(os.time() + ticks())
local gameStarted = false
local isUIInsurrectionCompatible = false
-- Multithread lanes
Lanes = {}

local function onGameStart()
    -- Load Insurrection features
    if (core.loadInsurrectionPatches()) then
        harmony.ui.set_aspect_ratio(16, 9)
        core.loadNameplates()
        execute_script("menu_blur_on")
        isUIInsurrectionCompatible = true
    end
    -- Workaround fix to prevent players from getting stuck in a game server at menu
    execute_script("disconnect")
end

function OnTick()
    -- Multithread resolving support
    for _, lane in ipairs(Lanes) do
        if lane.thread.status == "done" then
            lane.callback(lane.thread)
            table.remove(Lanes, _)
        elseif lane.thread.status == "error" then
            console_out(lane.thread[1])
            table.remove(Lanes, _)
        else
            console_out(lane.thread.status)
        end
    end

    -- Game started event trick
    if (not gameStarted and map:find("ui")) then
        gameStarted = true
        onGameStart()
    end
end

function OnMenuAccept(widgetTagId)
    local allow = not (chimera.onButton(widgetTagId) or core.OnButton(widgetTagId) or false)
    return allow
end

set_callback("tick", "OnTick")
harmony.set_callback("menu accept", "OnMenuAccept")
