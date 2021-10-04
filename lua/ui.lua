clua_version = 2.056

local harmony = require "mods.harmony"
blam = require "blam"
tagClasses = blam.tagClasses

local core = require "insurrection.core"

local scriptVersion = require "insurrection.version"

local gameStarted = false

function OnGameStart()
    local scriptVersionTag = core.findTag("variable_info", tagClasses.unicodeStringList)
    if (scriptVersionTag) then
        (harmony.ui.set_widescreen_aspect_ratio or harmony.ui.set_aspect_ratio)(16, 9)
        local scriptVersionString = blam.unicodeStringList(scriptVersionTag.id)
        if (scriptVersionString) then
            local strings = scriptVersionString.stringList
            -- Write string version to map tag
            strings[1] = scriptVersion
            scriptVersionString.stringList = strings
        end
    end
    --execute_script("menu_blur_on")
    gameStarted = nil
end

function OnTick()
    -- Game started event trick
    if (ticks() > 0 and gameStarted == false) then
        gameStarted = true
    end
    if (gameStarted) then
        OnGameStart()
        --core.getChimeraBookmarks()
    end
end

function OnUnload()
    harmony.unload()
end

set_callback("tick", "OnTick")
set_callback("unload", "OnUnload")
