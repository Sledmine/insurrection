local glue = require "glue"
clua_version = 2.056
local blam = require "blam"
local harmony = require "mods.harmony"
inspect = require "inspect"
local chimera = require "insurrection.chimera"
local core = require "insurrection.core"

math.randomseed(os.time() + ticks())
local gameStarted = false
local isUIInsurrectionCompatible = false
local pressedKey
---@type uiWidgetDefinition
local editableWidget
-- Multithread lanes
Lanes = {}

local function onGameStart()
    -- Load Insurrection features
    if (core.loadInsurrectionPatches()) then
        harmony.ui.set_aspect_ratio(16, 9)
        core.loadNameplates()
        execute_script("menu_blur_on")
        isUIInsurrectionCompatible = true
        core.cleanAllEditableWidgets()
    end
    -- Workaround fix to prevent players from getting stuck in a game server at menu
    execute_script("disconnect")
end

function OnTick()
    -- Multithread callback resolve
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
    if isUIInsurrectionCompatible then
        -- Get pressed key from the keyboard
        local pressedKey = core.readKeyboard()
        -- If we pressed a key and we are focusing a editable widget, then update it
        if pressedKey and editableWidget then
            local usernameStrings = blam.unicodeStringList(editableWidget.unicodeStringListTag)
            local stringList = usernameStrings.stringList
            local text = core.mapKeyToText(pressedKey, stringList[1])
            if text then
                stringList[1] = text
            end
            usernameStrings.stringList = stringList
        end
        -- local currentMenu = core.getCurrentUIWidget()
        -- if currentMenu then
        --    local widget = blam.uiWidgetDefinition(currentMenu.id)
        --    -- console_out(currentMenu.id)
        --    -- console_out(widget.name)
        -- end
    end
end

function OnMenuAccept(widgetTagId)
    local allow = not (chimera.onButton(widgetTagId) or core.onButton(widgetTagId) or false)
    return allow
end

function OnMenuListTab(pressedKey, listWidgetId, previousFocusedWidgetId)
    local widgetList = blam.uiWidgetDefinition(listWidgetId)
    local widget = blam.uiWidgetDefinition(previousFocusedWidgetId)
    local focusedWidget
    for childIndex, child in pairs(widgetList.childWidgets) do
        if child.widgetTag == previousFocusedWidgetId then
            local nextChildIndex
            if pressedKey == "up" or pressedKey == "left" then
                if childIndex - 1 < 1 then
                    nextChildIndex = widgetList.childWidgetsCount
                else
                    nextChildIndex = childIndex - 1
                end
            elseif pressedKey == "down" or pressedKey == "right" then
                if childIndex + 1 > widgetList.childWidgetsCount then
                    nextChildIndex = 1
                else
                    nextChildIndex = childIndex + 1
                end
            end
            focusedWidget = blam.uiWidgetDefinition(widgetList.childWidgets[nextChildIndex].widgetTag)
        end
    end
    -- TODO Use widget text flags from widget tag instead (add support for that in lua-blam)
    if focusedWidget and (focusedWidget.name == "username_input" or focusedWidget.name == "password_input") then
        editableWidget = focusedWidget
    else
        editableWidget = nil
    end
    return true
end

set_callback("tick", "OnTick")
harmony.set_callback("menu accept", "OnMenuAccept")
harmony.set_callback("menu list tab", "OnMenuListTab")
-- harmony.set_callback("key press", "OnKeyPress")
-- local keyMapping = {escape = 27, delete = 127, espace = 32, backspace = 8, tab = 9}
-- function OnKeyPress(modifier, character, keycode)
--    if character > 31 and character < 127 then
--        pressedKey = string.char(character)
--    else
--        pressedKey = glue.index(keyMapping)[character]
--    end
--    console_out("Pressed:" .. tostring(pressedKey))
--    console_out(modifier .. " " .. character .. " " .. keycode)
-- end
