local actions = require "insurrection.redux.actions"
clua_version = 2.056
local blam = require "blam"
local isNull = blam.isNull
local harmony = require "mods.harmony"
inspect = require "inspect"
local chimera = require "insurrection.chimera"
local core = require "insurrection.core"
local interface = require "insurrection.interface"
api = require "insurrection.api"
store = require "insurrection.redux.store"
local version = require "insurrection.version"
local ends = require"glue".string.ends

-- UI state and stuff
math.randomseed(os.time() + ticks())
local gameStarted = false
local isUIInsurrectionCompatible = false
local pressedKey
---@type uiWidgetDefinition
local editableWidget
-- Multithread lanes
Lanes = {}
-- Stores values that are masked in the UI
VirtualInputValue = {}
-- Stores animations for UI Widgets
WidgetAnimations = {}
ScreenCornerText = ""

local function onGameStart()
    -- Load Insurrection features
    if (core.loadInsurrectionPatches()) then
        harmony.menu.set_aspect_ratio(16, 9)
        core.loadNameplates()
        execute_script("menu_blur_on")
        isUIInsurrectionCompatible = true
        core.cleanAllEditableWidgets()

        local introMenuWidgetTag = blam.findTag([[ui\shell\main_menu]],
                                                blam.tagClasses.uiWidgetDefinition)
        local introMenuWidget = blam.uiWidgetDefinition(introMenuWidgetTag.id)
        local mainMenuWidgetTag = blam.findTag([[menus\main\main_menu]],
                                               blam.tagClasses.uiWidgetDefinition)
        local mainMenuWidget = blam.uiWidgetDefinition(mainMenuWidgetTag.id)
        local mainMenuList = blam.uiWidgetDefinition(mainMenuWidget.childWidgets[2].widgetTag)

        local containerId = mainMenuWidgetTag.id
        local widgetToAnimateId = mainMenuWidget.childWidgets[1].widgetTag
        local initial = introMenuWidget.childWidgets[1].verticalOffset
        local final = mainMenuWidget.childWidgets[1].verticalOffset

        interface.animation(widgetToAnimateId, containerId, 0.3, "vertical", initial, final)
        for _, childWidget in pairs(mainMenuList.childWidgets) do
            interface.animation(childWidget.widgetTag, containerId, _ * 0.08, "horizontal",
                                childWidget.horizontalOffset - 50, childWidget.horizontalOffset)
            interface.animation(childWidget.widgetTag, containerId, _ * 0.08, "opacity", 0, 1)
        end
    end
    -- Workaround fix to prevent players from getting stuck in a game server at menu
    execute_script("disconnect")
end

function OnTick()
    -- Multithread callback resolve
    for laneIndex, lane in ipairs(Lanes) do
        if lane.thread.status == "done" then
            table.remove(Lanes, laneIndex)
            lane.callback(lane.thread)
            harmony.menu.block_input(false)
        elseif lane.thread.status == "error" then
            console_out(lane.thread[1])
            table.remove(Lanes, laneIndex)
        else
        end
        console_out(lane.thread.status)
    end
    -- Game started event trick
    if (not gameStarted and map:find("ui")) then
        gameStarted = true
        onGameStart()
    end
end

function OnKeypress(modifiers, char, keycode)
    if isUIInsurrectionCompatible then
        -- Get pressed key from the keyboard
        local pressedKey = nil
        if(char) then
            pressedKey = char
        elseif(keycode) then
            pressedKey = core.translateKeycode(keycode)
        end
        -- If we pressed a key and we are focusing a editable widget, then update it
        if pressedKey and editableWidget then
            local usernameStrings = blam.unicodeStringList(editableWidget.unicodeStringListTag)
            local stringList = usernameStrings.stringList
            local text = core.mapKeyToText(pressedKey,
                                           VirtualInputValue[editableWidget.name] or stringList[1])
            if text then
                if editableWidget.name:find "password" then
                    VirtualInputValue[editableWidget.name] = text
                    stringList[1] = string.rep("*", #text)
                else
                    stringList[1] = text
                end
            end
            usernameStrings.stringList = stringList
        end
    end
end

function OnMenuAccept(widgetInstanceIndex)
    local widgetTagId = harmony.menu.get_widget_values(widgetInstanceIndex).tag_id
    local allow = not (chimera.onButton(widgetTagId) or interface.onButton(widgetTagId) or false)
    return allow
end

local function setEditableWidgetFocus(widgetTagId)
    local focusedWidget = blam.uiWidgetDefinition(widgetTagId)
    -- TODO Use widget text flags from widget tag instead (add support for that in lua-blam)
    if focusedWidget and ends(focusedWidget.name, "_input") then
        editableWidget = focusedWidget
    else
        editableWidget = nil
    end
end

function OnMenuListTab(pressedKey,
                       listWidgetInstanceIndex,
                       previousFocusedWidgetInstanceIndex)
    local listWidgetId = harmony.menu.get_widget_values(listWidgetInstanceIndex).tag_id
    local previousFocusedWidgetId = harmony.menu.get_widget_values(
                                        previousFocusedWidgetInstanceIndex).tag_id
    local widgetList = blam.uiWidgetDefinition(listWidgetId)
    --local widget = blam.uiWidgetDefinition(previousFocusedWidgetId)
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
            if not isNull(widgetTagId) then
                setEditableWidgetFocus(widgetTagId)
            end
        end
    end
    return true
end

function OnMouseFocus(widgetInstanceId)
    local widgetTagId = harmony.menu.get_widget_values(widgetInstanceId).tag_id
    setEditableWidgetFocus(widgetTagId)
    return true
end

function OnFrame()
    local bounds = {left = 0, top = 460, right = 640, bottom = 480}
    local textColor = {1, 1, 1, 1}
    draw_text(ScreenCornerText or "", bounds.left, bounds.top, bounds.right, bounds.bottom, "small",
              "right", table.unpack(textColor))

    -- Create menu scrolling
    local scroll = tonumber(read_char(0x64C73C + 8))
    if scroll > 0 then
        store:dispatch(actions.scroll(true))
    elseif scroll < 0 then
        store:dispatch(actions.scroll(false))
    end

    -- Process widget animations queue
    local widgetTag = core.getCurrentUIWidget()
    if widgetTag then
        for animationWidgetId, animation in pairs(WidgetAnimations) do
            if widgetTag.id == animation.widgetContainerTagId and not animation.finished then
                animation.animate()
            end
        end
    end
end

function OnWidgetOpen(widgetInstanceIndex)
    -- Reset widgets animation data
    local widgetValues = harmony.menu.get_widget_values(widgetInstanceIndex)
    for _, animation in pairs(WidgetAnimations) do
        if animation.widgetContainerTagId == widgetValues.tag_id then
            animation.timestamp = nil
            animation.finished = false
        end
    end

    --local widgetTag = blam.getTag(widgetValues.tag_id, blam.tagClasses.uiWidgetDefinition)
    --debugScreenText = widgetTag.path
    return true
end

function OnWidgetClose()
    ScreenCornerText = ""
    return true
end

function refreshLobby()
    if api.session.token then
        api.refreshLobby()
    end
end

set_callback("tick", "OnTick")
set_callback("preframe", "OnFrame")
harmony.set_callback("widget accept", "OnMenuAccept")
harmony.set_callback("widget list tab", "OnMenuListTab")
harmony.set_callback("widget mouse focus", "OnMouseFocus")
harmony.set_callback("widget back", "OnWidgetClose")
harmony.set_callback("widget open", "OnWidgetOpen")
harmony.set_callback("key press", "OnKeypress")
