DebugMode = false
require "insecticide"
local blam = require "blam"
local components = require "insurrection.components"
constants = require "insurrection.constants"
local isNull = blam.isNull
local harmony = require "mods.harmony"
local optic = harmony.optic
local chimera = require "insurrection.mods.chimera"
local core = require "insurrection.core"
local interface = require "insurrection.interface"
store = require "insurrection.redux.store"
local _, balltze = pcall(require, "mods.balltze")
require "luna"
local menus = require "insurrection.menus"

clua_version = 2.056
-- Import API after setting up debug mode
api = require "insurrection.api"
IsUICompatible = false
math.randomseed(os.time() + ticks())
local gameStarted = false
---@type uiWidgetDefinition?
local editableWidget
---@type tag?
local editableWidgetTag
---@type tag
local lastOpenWidgetTag
---@type tag
local lastClosedWidgetTag
---@type tag
local lastListFocusedWidgetTag
---@type tag
local lastFocusedWidgetTag
-- Multithread lanes
Lanes = {}
-- Stores values that are masked in the UI
VirtualInputValue = {}
-- Stores animations for UI Widgets
WidgetAnimations = {}
ScreenCornerText = ""
LoadingText = nil
local lastMap = ""
local playerCount = 0

discord = require "insurrection.discord"

-- Setup loading orb sprite
local loadingSprite = optic.create_sprite("loading_orb.png", 32, 32)
local rotateOrbAnimation = optic.create_animation(5000)
optic.set_animation_property(rotateOrbAnimation, "linear", "rotation", 360)
local screenWidth, screenHeight = core.getScreenResolution()

---This event will run when at least one tick has passed after the game has loaded.
---
---Allowing you to safely run code that requires a full loaded game state.
local function onPostGameLoad()
    dprint("Game started!", "success")
    if map == "ui" then
        -- Change UI aspect ratio
        harmony.menu.set_aspect_ratio(16, 9)
        -- Enable menu blur
        execute_script("menu_blur_on")

        -- Set network timeout to 10 seconds (keeps connection alive at loading huge maps)
        execute_script("network_connect_timeout 30000")
    else
        harmony.menu.set_aspect_ratio(4, 3)
    end
    -- Load insurrection interface, load constants, widgets, etc.
    interface.load()
end

function OnTick()
    -- Post game load event
    if lastMap ~= map then
        gameStarted = false
        lastMap = map
        if not gameStarted then
            gameStarted = true
            onPostGameLoad()
        end
    end
    -- Multithread callback resolve
    for laneIndex, lane in ipairs(Lanes) do
        if lane.thread.status == "done" then
            harmony.menu.block_input(false)
            table.remove(Lanes, laneIndex)
            lane.callback(lane.thread)
            dprint("Async task finished!", "success")
        elseif lane.thread.status == "error" then
            harmony.menu.block_input(false)
            dprint(lane.thread[1], "error")
            table.remove(Lanes, laneIndex)
        else
            dprint(lane.thread.status, "warning")
        end
    end
    if server_type == "dedicated" or server_type == "local" then
        local newPlayerCount = 0
        for playerIndex = 0, 15 do
            local player = blam.player(get_player(playerIndex))
            if player then
                newPlayerCount = newPlayerCount + 1
            end
        end
        if newPlayerCount < playerCount then
            OnPlayerLeave()
        elseif newPlayerCount > playerCount then
            OnPlayerJoin()
        end
        playerCount = newPlayerCount
    end
end

function OnPlayerJoin()
    interface.sound("join")
end

function OnPlayerLeave()
    interface.sound("leave")
end

function OnKeypress(modifiers, char, keycode)
    if editableWidget and editableWidgetTag then
        -- Get pressed key from the keyboard
        local pressedKey
        if char then
            pressedKey = char
        elseif keycode then
            pressedKey = core.translateKeycode(keycode)
        end
        -- If we pressed a key, update our editable widget
        if pressedKey then
            local inputString = core.getStringFromWidget(editableWidgetTag.id)
            local text = core.mapKeyToText(pressedKey, inputString)
            if text then
                -- TODO Use widget text flags from widget tag instead (add support for that in lua-blam)
                if editableWidget.name:find "password" then
                    core.setStringToWidget(text, editableWidgetTag.id, "*")
                else
                    core.setStringToWidget(text, editableWidgetTag.id)
                end
                interface.onInputText(editableWidgetTag.id, text)
            end
        end
    end
end

function OnMenuAccept(widgetInstanceIndex)
    local widgetTagId = harmony.menu.get_widget_values(widgetInstanceIndex).tag_id
    local component = components.widgets[widgetTagId]
    if component then
        if component.events.onClick then
            return not component.events.onClick()
        end
    end
    return true
end

local function onWidgetFocus(widgetTagId)
    local component = components.widgets[widgetTagId]
    if component and component.events.onFocus then
        component.events.onFocus()
    end
    local focusedWidget = blam.uiWidgetDefinition(widgetTagId)
    local tag = blam.getTag(widgetTagId)
    -- TODO Use widget text flags from widget tag instead (add support for that in lua-blam)
    -- if focusedWidget and ends(focusedWidget.name, "_input") then
    if focusedWidget and focusedWidget.name:endswith "_input" then
        editableWidget = focusedWidget
        editableWidgetTag = tag
    else
        editableWidget = nil
        editableWidgetTag = nil
    end
end

function OnMenuListTab(pressedKey,
                       listWidgetInstanceIndex,
                       previousFocusedWidgetInstanceIndex)
    local listWidgetTagId = harmony.menu.get_widget_values(listWidgetInstanceIndex).tag_id
    local previousFocusedWidgetId = harmony.menu.get_widget_values(
                                        previousFocusedWidgetInstanceIndex).tag_id
    local widgetListTag = blam.getTag(listWidgetTagId) --[[@as tag]]
    local widgetList = blam.uiWidgetDefinition(listWidgetTagId)
    -- local widget = blam.uiWidgetDefinition(previousFocusedWidgetId)
    assert(widgetList, "Invalid widget list tag id")
    for childIndex, child in pairs(widgetList.childWidgets) do
        if child.widgetTag == previousFocusedWidgetId then
            local nextChildIndex
            if pressedKey == "dpad up" or pressedKey == "dpad left" then
                if childIndex - 1 < 1 then
                    nextChildIndex = widgetList.childWidgetsCount
                else
                    nextChildIndex = childIndex - 1
                end
            elseif pressedKey == "dpad down" or pressedKey == "dpad right" then
                if childIndex + 1 > widgetList.childWidgetsCount then
                    nextChildIndex = 1
                else
                    nextChildIndex = childIndex + 1
                end
            end
            local widgetTagId = widgetList.childWidgets[nextChildIndex].widgetTag
            if widgetTagId and not isNull(widgetTagId) then
                -- local widgetTag = blam.getTag(widgetTagId)
                onWidgetFocus(widgetTagId)
            end
        end
    end
    return true
end

function OnMouseFocus(widgetInstanceId)
    local widgetTagId = harmony.menu.get_widget_values(widgetInstanceId).tag_id
    local component = components.widgets[widgetTagId]
    if component and component.events.onFocus then
        component.events.onFocus()
    end
    onWidgetFocus(widgetTagId)
    return true
end

function OnFrame()
    local bounds = {left = 0, top = 460, right = 640, bottom = 480}
    local textColor = {1, 1, 1, 1}
    draw_text(ScreenCornerText or "", bounds.left, bounds.top, bounds.right, bounds.bottom,
              "console", "right", table.unpack(textColor))
    -- Draw loading text on the left side of the screen
    if LoadingText then
        draw_text(LoadingText or "", bounds.left + 16, bounds.top, bounds.left + 200, bounds.bottom,
                  "console", "left", table.unpack(textColor))
        optic.render_sprite(loadingSprite, 8, screenHeight - 32 - 8, 255, ticks() * 8, 1,
                            rotateOrbAnimation, optic.create_animation(0))
    end

    -- Process widget animations queue only if we have a widget open
    local widgetTag = core.getCurrentUIWidgetTag()
    --[[
    if widgetTag then
        for _, component in pairs(components.widgets) do
            for _, animation in pairs(component.animations) do
                if not animation.finished then
                    animation.play()
                end
            end
        end
    end]]
end

function OnWidgetOpen(widgetInstanceIndex)
    local widgetExists, widgetValues = pcall(harmony.menu.get_widget_values, widgetInstanceIndex)
    if widgetExists then
        local widgetTagId = widgetValues.tag_id
        local widgetTag = blam.getTag(widgetTagId, blam.tagClasses.uiWidgetDefinition)
        local component = components.widgets[widgetTagId]
        if component and component.events.onOpen then
            component.events.onOpen()
        end

        if widgetTag then
            local widget = blam.uiWidgetDefinition(widgetTag.id)
            if widget and widget.childWidgetsCount > 0 then
                local optionsWidget = blam.uiWidgetDefinition(
                                          widget.childWidgets[widget.childWidgetsCount].widgetTag)
                -- Auto focus on the first editable widget
                if optionsWidget and optionsWidget.childWidgets[1] then
                    onWidgetFocus(optionsWidget.childWidgets[1].widgetTag)
                end

                interface.animationsReset(widgetTag.id)

            end
            if DebugMode then
                ScreenCornerText = widgetTag.path
            end
        end
    end
    return false
end

function OnWidgetClose(widgetInstanceIndex)
    local widgetExists, widgetValues = pcall(harmony.menu.get_widget_values, widgetInstanceIndex)
    if widgetExists then
        local widgetTagId = widgetValues.tag_id
        local component = components.widgets[widgetTagId]
        if component and component.events.onClose then
            component.events.onClose()
        end
        editableWidget = nil
        ScreenCornerText = ""
    end
    return true
end

function OnCommand(command)
    if command == "insurrection_debug" then
        DebugMode = not DebugMode
        console_out("Debug mode: " .. tostring(DebugMode))
        return false
    elseif command == "insurrection_fonts" then
        chimera.setupFonts()
        interface.dialog("SUCCESS", "Fonts have been setup",
                         "Please restart the game to see changes.")
        return false
    elseif command == "insurrection_revert_fonts" then
        chimera.setupFonts(true)
        interface.dialog("SUCCESS", "Fonts have been reverted",
                         "Please restart the game to see changes.")
        return false
    end
end

function OnMapLoad()
    -- Reset post map load state
    gameStarted = false
    lastMap = ""
    -- Reset script state
    editableWidget = nil
    editableWidgetTag = nil
    Lanes = {}
    VirtualInputValue = {}
    WidgetAnimations = {}
    ScreenCornerText = ""
    LoadingText = nil
end

function OnUnload()
    dprint("Unloading Insurrection...")
    discord.stopPresence()
end

--- Execute before the game loads a map file, used to load custom tags
---@param currentMapName string
function OnMapFileLoad(currentMapName)
    if balltze and currentMapName ~= "ui" then
        balltze.import_tag_data("ui", constants.path.nameplateCollection, "tag_collection")
        balltze.import_tag_data("ui", constants.path.pauseMenu, "ui_widget_definition")
        balltze.import_tag_data("ui", constants.path.dialog, "ui_widget_definition")
        balltze.import_tag_data("ui", constants.path.customSounds, "tag_collection")
    end
end

set_callback("tick", "OnTick")
set_callback("preframe", "OnFrame")
set_callback("command", "OnCommand")
set_callback("map load", "OnMapLoad")
set_callback("unload", "OnUnload")
harmony.set_callback("widget accept", "OnMenuAccept")
harmony.set_callback("widget list tab", "OnMenuListTab")
harmony.set_callback("widget mouse focus", "OnMouseFocus")
harmony.set_callback("widget close", "OnWidgetClose")
harmony.set_callback("widget open", "OnWidgetOpen")
harmony.set_callback("key press", "OnKeypress")
if balltze then
    balltze.set_callback("map file load", "OnMapFileLoad")
end
