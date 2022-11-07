require "insecticide"
local actions = require "insurrection.redux.actions"
local blam = require "blam"
local components = require "insurrection.components"
local isNull = blam.isNull
local harmony = require "mods.harmony"
local optic = harmony.optic
local chimera = require "insurrection.chimera"
local core = require "insurrection.core"
local interface = require "insurrection.interface"
store = require "insurrection.redux.store"
local ends = require"glue".string.ends
local constants = require "insurrection.constants"
-- Useful debug global tools

-- UI state and stuff
clua_version = 2.056
DebugMode = false
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

-- Setup loading orb sprite
local loadingSprite = optic.create_sprite("loading_orb.png", 32, 32)
local rotateOrbAnimation = optic.create_animation(5000)
optic.set_animation_property(rotateOrbAnimation, "linear", "rotation", 360)
local screenWidth = read_word(0x637CF2)
local screenHeight = read_word(0x637CF0)

local function onGameStart()
    interface.load()
    -- chimera.getConfiguration()
end

function OnTick()
    -- Game started event trick
    if lastMap ~= map then
        gameStarted = false
        lastMap = map
        if not gameStarted then
            gameStarted = true
            onGameStart()
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
end

function OnKeypress(modifiers, char, keycode)
    if IsUICompatible and editableWidget then
        -- Get pressed key from the keyboard
        local pressedKey
        if (char) then
            pressedKey = char
        elseif (keycode) then
            pressedKey = core.translateKeycode(keycode)
        end
        -- If we pressed a key, update our editable widget
        if pressedKey then
            local inputString = core.getStringFromWidget(editableWidgetTag.id)
            local text = core.mapKeyToText(pressedKey, inputString)
            if text then
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
    -- local allow = not (chimera.onButton(widgetTagId) or interface.onButton(widgetTagId) or false
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
    dprint(tag.path)
    -- TODO Use widget text flags from widget tag instead (add support for that in lua-blam)
    if focusedWidget and ends(focusedWidget.name, "_input") then
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
    local listWidgetId = harmony.menu.get_widget_values(listWidgetInstanceIndex).tag_id
    local previousFocusedWidgetId = harmony.menu.get_widget_values(
                                        previousFocusedWidgetInstanceIndex).tag_id
    local widgetList = blam.uiWidgetDefinition(listWidgetId)
    -- local widget = blam.uiWidgetDefinition(previousFocusedWidgetId)
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
                -- dprint(widgetTag.path)
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
    draw_text(ScreenCornerText or "", bounds.left, bounds.top, bounds.right, bounds.bottom, "small",
              "right", table.unpack(textColor))
    -- Draw loading text on the left side of the screen
    if LoadingText then
        draw_text(LoadingText or "", bounds.left + 12, bounds.top, bounds.left + 200, bounds.bottom,
                  "small", "left", table.unpack(textColor))
        optic.render_sprite(loadingSprite, 8, screenHeight - 32 - 8, 255, ticks() * 8, 1,
                            rotateOrbAnimation, optic.create_animation(0))
    end

    -- Process widget animations queue
    local widgetTag = core.getCurrentUIWidgetTag()
    if widgetTag then
        for animationWidgetId, animation in pairs(WidgetAnimations) do
            if not animation.finished then
                if widgetTag.id == animation.widgetContainerTagId then
                    if animation.animateOn == "show" then
                        animation.animate()
                    elseif animation.animateOn == "focus" then
                        if lastFocusedWidgetTag and lastFocusedWidgetTag.id ==
                            animation.targetWidgetTagId then
                            animation.animate()
                        end
                    end
                end
            end
        end
    end
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
            dprint("Opened widget: " .. widgetTag.path)
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
    stop_timer(animationsTimerId)
    gameStarted = false
    editableWidget = nil
    editableWidgetTag = nil

    Lanes = {}
    VirtualInputValue = {}
    WidgetAnimations = {}

    ScreenCornerText = ""
    LoadingText = nil
end

set_callback("tick", "OnTick")
set_callback("preframe", "OnFrame")
set_callback("command", "OnCommand")
-- set_callback("map load", "OnMapLoad")
harmony.set_callback("widget accept", "OnMenuAccept")
harmony.set_callback("widget list tab", "OnMenuListTab")
harmony.set_callback("widget mouse focus", "OnMouseFocus")
harmony.set_callback("widget close", "OnWidgetClose")
harmony.set_callback("widget open", "OnWidgetOpen")
harmony.set_callback("key press", "OnKeypress")
