clua_version = 2.056
local blam = require "blam"
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

local capsLock = false
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
    
    local pressedKey = core.readKeyboard()
    if pressedKey then
        local usernameStrings = blam.unicodeStringList(core.findTag("username", blam.tagClasses.unicodeStringList).id)
        local stringList = usernameStrings.stringList
        local currentText = stringList[1]
        if pressedKey == "backspace" then
            if #currentText == 1 then
                stringList[1] = " "
            else
                stringList[1] = currentText:sub(1, #currentText - 1)
            end
        elseif pressedKey == "space" then
            stringList[1] = currentText .. " "
        elseif pressedKey == "caps_lock" then
            capsLock = not capsLock
            console_out(capsLock)
        elseif #pressedKey == 1 and string.byte(pressedKey) > 31 and string.byte(pressedKey) < 127 then
            if capsLock then
                pressedKey = pressedKey:upper()
            end
            stringList[1] = currentText .. pressedKey
        end
        usernameStrings.stringList = stringList
    end
end

function OnMenuAccept(widgetTagId)
    local allow = not (chimera.onButton(widgetTagId) or core.onButton(widgetTagId) or false)
    return allow
end

set_callback("tick", "OnTick")
harmony.set_callback("menu accept", "OnMenuAccept")
