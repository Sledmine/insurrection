local harmony = require "mods.harmony"
local createBezierCurve = harmony.math.create_bezier_curve
local bezierCurve = harmony.math.get_bezier_curve_point
local openWidget = harmony.menu.open_widget
local reloadWidget = harmony.menu.reload_widget
local findWidgets = harmony.menu.find_widgets
local playSound = harmony.menu.play_sound
local blam = require "blam"
local findTag = blam.findTag
local actions = require "insurrection.redux.actions"
local core = require "insurrection.core"
local getWidgetString = core.getStringFromWidget
local setWidgetString = core.setStringToWidget
local glue = require "glue"
local split = glue.string.split
local ends = glue.string.ends
local append = glue.append
local unicodeStringTag = blam.unicodeStringList
local uiWidgetTag = blam.uiWidgetDefinition

local function findWidgetTag(partialName)
    return findTag(partialName, blam.tagClasses.uiWidgetDefinition)
end

local interface = {}
-- Common tags
-- Get tags before using them to improve performance
-- Menus
local dialogWidgetTag = findWidgetTag("dialog_menu")
local lobbyWidgetTag = findWidgetTag("lobby_menu")
local dashboardWidgetTag = findWidgetTag("dashboard_menu")
-- Sounds
local errorSoundTag = findTag("flag_failure", blam.tagClasses.sound)
-- Lobby elements
lobbyElement2Tag = findWidgetTag("lobby_element_button_2")
lobbyElement3Tag = findWidgetTag("lobby_element_button_3")
lobbyElement4Tag = findWidgetTag("lobby_element_button_4")
lobbyElement5Tag = findWidgetTag("lobby_element_button_5")
lobbyPlayersNameplatesTag = findWidgetTag("lobby_players_nameplates")
-- Input elements
usernameInputTag = findWidgetTag("username_input")
passwordInputTag = findWidgetTag("password_input")
local nameplateBitmapTags = blam.findTagsList("nameplates\\", blam.tagClasses.bitmap)
local nameplatesBitmapTagIds = {}
for _, tag in ipairs(nameplateBitmapTags) do
    nameplatesBitmapTagIds[tonumber(core.getTagName(tag.path))] = tag.id
end
-- General UI Elements
local nameplateTag = findWidgetTag("shared\\current_profile")

interface.widgets = {
    lobbyWidgetTag = lobbyWidgetTag,
    dashboardWidgetTag = dashboardWidgetTag,
    usernameInputTag = usernameInputTag,
    passwordInputTag = passwordInputTag
}

function interface.load()
    -- Load Insurrection features
    if (core.loadInsurrectionPatches()) then
        -- Change aspect ratio
        harmony.menu.set_aspect_ratio(16, 9)

        -- Execute basic Halo commands
        execute_script("menu_blur_on")

        IsUICompatible = true

        interface.loadProfileNameplate()
        core.cleanAllEditableWidgets()

        interface.animate()

        -- Load login data
        local username, password = core.loadCredentials()
        if username and password then
            core.setStringToWidget(username, interface.widgets.usernameInputTag.id)
            core.setStringToWidget(password, interface.widgets.passwordInputTag.id, "*")
        end
    end
    -- Workaround fix to prevent players from getting stuck in a game server at menu
    execute_script("disconnect")
end

function interface.loadProfileNameplate(nameplateIndex)
    local nameplate = uiWidgetTag(nameplateTag.id)
    if nameplateIndex then
        if nameplateIndex > #nameplatesBitmapTagIds then
            dprint("Invalid nameplate index: " .. nameplateIndex, "warning")
            nameplateIndex = #nameplatesBitmapTagIds
        end
        nameplate.backgroundBitmap = nameplatesBitmapTagIds[nameplateIndex]
        return
    end
    local settings = core.loadSettings()
    if settings and settings.nameplate then
        nameplate.backgroundBitmap = nameplatesBitmapTagIds[settings.nameplate]
    end
end

---Animates UI elements by animating background bitmap
---@param widgetTagId number
function interface.animateUIWidgetBackground(widgetTagId)
    local isUIRendering = core.getRenderedUIWidgetTagId()
    if isUIRendering then
        local widgetRender = interface.getWidgetValues(widgetTagId)
        if widgetRender then
            local widgetBitmap = blam.bitmap(uiWidgetTag(widgetTagId).backgroundBitmap)
            if widgetBitmap then
                if widgetBitmap.bitmapsCount > 1 then
                    if widgetRender then
                        if widgetRender.background_bitmap_index < widgetBitmap.bitmapsCount then
                            interface.setWidgetValues(widgetTagId, {
                                background_bitmap_index = widgetRender.background_bitmap_index + 1
                            })
                        else
                            interface.setWidgetValues(widgetTagId, {background_bitmap_index = 0})
                        end
                    end
                end
            end
        end
    end
end

--- Animates player nameplates, including profile nameplate
function interface.animateNameplates()
    interface.animateUIWidgetBackground(nameplateTag.id)
    -- TODO Animate other player in lobby nameplates
end

---Show a dialog message on the screen
---@param titleText '"WARNING"' | '"INFORMATION"' | '"ERROR"' | string
---@param subtitleText string
---@param bodyText string
function interface.dialog(titleText, subtitleText, bodyText)
    playSound(errorSoundTag.path)
    local dialog = uiWidgetTag(dialogWidgetTag.id)
    local header = uiWidgetTag(dialog.childWidgets[1].widgetTag)
    local title = uiWidgetTag(header.childWidgets[1].widgetTag)
    local headerStrings = blam.unicodeStringList(title.unicodeStringListTag)
    local strings = headerStrings.stringList
    strings[1] = titleText
    strings[2] = subtitleText
    headerStrings.stringList = strings
    local body = uiWidgetTag(dialog.childWidgets[3].widgetTag)
    local bodyStrings = unicodeStringTag(body.unicodeStringListTag)
    local strings = bodyStrings.stringList
    strings[1] = bodyText
    bodyStrings.stringList = strings

    openWidget(dialogWidgetTag.id, true)
end

---Play a special interface sound
---@param sound '"error"'
function interface.sound(sound)
    if sound == "error" then
        playSound(errorSoundTag.path)
    end
end

function interface.lobby(force)
    openWidget(lobbyWidgetTag.id, true)
end

local lobbyDefinitions = {
    template = "lobby_definition_button_1",
    map = "lobby_definition_button_2",
    gametype = "lobby_definition_button_3"
}

--- Map selected button from the UI
---@param widgetTagId number
function interface.onButton(widgetTagId)
    local buttonPath = blam.getTag(widgetTagId).path
    if ends(buttonPath, "login_button") then
        local username = getWidgetString(findWidgetTag("username_input").id)
        local password = getWidgetString(findWidgetTag("password_input").id)
        if username and password and username ~= "" and password ~= "" then
            -- dprint("Login with username: " .. username .. " and password: " .. password)
            core.saveCredentials(username, password)
            api.login(username, password)
        else
            interface.dialog("WARNING", "", "Please enter a username and password.")
        end
    elseif ends(buttonPath, "register_button") then
        interface.dialog("INFORMATION", "Join us on our Discord server!",
                         "We have a Discord Bot to help with the registering process:\n\n\nhttps://discord.shadowmods.net")
    elseif ends(buttonPath, "create_lobby_button") then
        api.lobby()
    elseif ends(buttonPath, "join_lobby_button") then
        local lobbyKey = getWidgetString(findWidgetTag("lobby_key_input").id)
        if lobbyKey ~= "" then
            api.lobby(lobbyKey)
        else
            interface.dialog("WARNING", "", "Please specify a lobby key to join.")
        end
    elseif ends(buttonPath, "lobby_definition_button_1") then
        store:dispatch(actions.setLobbyDefinition("template"))
    elseif ends(buttonPath, "lobby_definition_button_2") then
        store:dispatch(actions.setLobbyDefinition("map"))
    elseif ends(buttonPath, "lobby_definition_button_3") then
        store:dispatch(actions.setLobbyDefinition("gametype"))
    elseif ends(buttonPath, "lobby_definition_button_4") then
        ---@type interfaceState
        local state = store:getState()
        if api.session.player and api.session.player.publicId == state.lobby.owner then
            local template = getWidgetString(findWidgetTag("lobby_definition_button_1").id)
            local map = getWidgetString(findWidgetTag("lobby_definition_button_2").id)
            local gametype = getWidgetString(findWidgetTag("lobby_definition_button_3").id)
            api.borrow(template:lower(), map, gametype:lower())
        else
            interface.dialog("WARNING", "", "You are not the owner of the lobby.")
        end

    elseif string.find(buttonPath, "lobby_element_button_") then
        local buttonIndex = tonumber(split(core.getTagName(buttonPath), "_")[4])
        if buttonIndex == 1 then
            store:dispatch(actions.scroll(true))
            return
        elseif buttonIndex == 6 then
            store:dispatch(actions.scroll())
            return
        end
        local value = getWidgetString(findWidgetTag("lobby_element_button_" .. buttonIndex).id)
        store:dispatch(actions.setSelected(value))
    end
end

function interface.update()
    ---@type interfaceState
    local state = store:getState()
    local renderedWidgetId = core.getRenderedUIWidgetTagId()
    if renderedWidgetId == lobbyWidgetTag.id then
        local lobbyWidget = uiWidgetTag(lobbyWidgetTag.id)
        local optionsWidget = uiWidgetTag(lobbyWidget.childWidgets[2].widgetTag)
        local definitionsWidget = uiWidgetTag(optionsWidget.childWidgets[1].widgetTag)
        local elementsWidget = uiWidgetTag(optionsWidget.childWidgets[2].widgetTag)
        local playersNameplates = uiWidgetTag(lobbyPlayersNameplatesTag.id)

        -- Update players in lobby
        for playerIndex = 1, 16 do
            interface.setWidgetValues(playersNameplates.childWidgets[playerIndex].widgetTag, {opacity = 0})
        end

        -- TODO Fix this, we need the current profile name, player does not exist yet
        local currentPlayerName = blam.player(get_player()).name:lower()
        for playerIndex, player in pairs(state.lobby.players) do
            local playerName = player.name
            if playerName ~= currentPlayerName then
                local nameplateWidgetTagId = playersNameplates.childWidgets[playerIndex].widgetTag
                -- Unhide nameplate overlay
                interface.setWidgetValues(nameplateWidgetTagId, {opacity = 1})
                -- Update nameplate background
                local nameplateWidgetDefinition = uiWidgetTag(nameplateWidgetTagId)
                nameplateWidgetDefinition.backgroundBitmap =
                    nameplatesBitmapTagIds[player.nameplate]
                -- Update nameplate overlay
                local overlayWidgetTagId = nameplateWidgetDefinition.childWidgets[1].widgetTag
                setWidgetString(playerName, overlayWidgetTagId)
            end
        end

        setWidgetString(state.selected.template, definitionsWidget.childWidgets[1].widgetTag)
        setWidgetString(state.selected.map, definitionsWidget.childWidgets[2].widgetTag)
        setWidgetString(state.selected.gametype, definitionsWidget.childWidgets[3].widgetTag)

        -- Restore normal list widget state
        local newChilds = elementsWidget.childWidgets
        newChilds[2].widgetTag = lobbyElement2Tag.id
        newChilds[3].widgetTag = lobbyElement3Tag.id
        newChilds[4].widgetTag = lobbyElement4Tag.id
        newChilds[5].widgetTag = lobbyElement5Tag.id
        elementsWidget.childWidgets = newChilds

        -- Apply modifications based on lua state
        local elements = state.displayed
        for childIndex = 2, 5 do
            childWidget = elementsWidget.childWidgets[childIndex]
            local elementIndex = childIndex - 1
            if elements[elementIndex] then
                setWidgetString(elements[elementIndex], childWidget.widgetTag)
            else
                newChilds[childIndex].widgetTag = 0xFFFFFFFF
            end
        end
        elementsWidget.childWidgets = newChilds

        -- Reload dynamically changed widgets from tags, effectively redrawing the UI
        local foundWidgets = findWidgets(optionsWidget.childWidgets[2].widgetTag, true)
        local widgetInstanceIndex = foundWidgets[1]
        if widgetInstanceIndex then
            reloadWidget(widgetInstanceIndex)
        end

        -- Hide elements widget if no are not the owner of the lobby
        if state.lobby.owner ~= api.session.player.publicId then
            -- Hide elements widget
            interface.setWidgetValues(optionsWidget.childWidgets[2].widgetTag, {opacity = 0})
            -- Hide search bar
            interface.setWidgetValues(optionsWidget.childWidgets[3].widgetTag, {opacity = 0})
        end
    end
end

function interface.getWidgetValues(widgetTagId)
    local widgetInstanceId = harmony.menu.find_widgets(widgetTagId)
    if widgetInstanceId then
        return harmony.menu.get_widget_values(widgetInstanceId)
    end
end

function interface.setWidgetValues(widgetTagId, values)
    local widgetInstanceId = harmony.menu.find_widgets(widgetTagId)
    if (widgetInstanceId) then
        harmony.menu.set_widget_values(widgetInstanceId, values);
    end
end

local bezierCurves = {
    ["ease in"] = createBezierCurve("ease in"),
    ["ease out"] = createBezierCurve("ease out")
}
---Setup an animation to apply to a widget
---@param targetWidgetTagId number Tag id of the target widget
---@param widgetContainerTagId number Tag id of the widget container
---@param duration number Duration of the animation in seconds
---@param property '"horizontal"' | '"vertical' | '"opacity"' | string Property to animate (e.g. "opacity")
---@param originalOffset number Original offset of the widget
---@param offset number Offset to apply to the widget
---@param bezier '"ease in"' | '"ease out"' | string Bezier curve to use, e.g. "ease in"
---@param animateOn '"show"' | '"focus"' | string Animation to apply to the widget, e.g. "show"
function interface.animation(targetWidgetTagId,
                             widgetContainerTagId,
                             duration,
                             property,
                             originalOffset,
                             offset,
                             bezier,
                             animateOn)
    local animationId = targetWidgetTagId .. widgetContainerTagId .. property
    WidgetAnimations[animationId] = {
        finished = false,
        widgetContainerTagId = widgetContainerTagId,
        targetWidgetTagId = targetWidgetTagId,
        timestamp = nil,
        animateOn = animateOn or "show",
        animate = function()
            local originalOffset = originalOffset
            local bezierCurveHandle = bezierCurves[bezier] or bezierCurves["ease in"]
            if not WidgetAnimations[animationId].timestamp then
                WidgetAnimations[animationId].timestamp = harmony.time.set_timestamp()
            end
            local elapsed = harmony.time.get_elapsed_milliseconds(
                                WidgetAnimations[animationId].timestamp) / 1000
            WidgetAnimations[animationId].elapsed = elapsed
            -- console_out(elapsed)
            -- console_out(duration)
            if (elapsed >= duration) then

                if property == "horizontal" then
                    interface.setWidgetValues(targetWidgetTagId, {left_bound = offset})
                elseif property == "vertical" then
                    interface.setWidgetValues(targetWidgetTagId, {top_bound = offset})
                else
                    interface.setWidgetValues(targetWidgetTagId, {opacity = offset})
                end

                WidgetAnimations[animationId].timestamp = nil
                WidgetAnimations[animationId].finished = true
                return
            end

            local widgetTag = blam.uiWidgetDefinition(widgetContainerTagId)
            if not originalOffset then
                for _, childWidget in pairs(widgetTag.childWidgets) do
                    if childWidget.widgetTag == targetWidgetTagId then
                        if property == "horizontal" then
                            originalOffset = childWidget.horizontalOffset
                        elseif property == "vertical" then
                            originalOffset = childWidget.verticalOffset
                        end
                    end
                end
            end
            local t = (elapsed / duration)
            local newPosition = bezierCurve(bezierCurveHandle, originalOffset, offset, t)
            if property == "horizontal" then
                interface.setWidgetValues(targetWidgetTagId, {left_bound = math.floor(newPosition)})
            elseif property == "vertical" then
                interface.setWidgetValues(targetWidgetTagId, {top_bound = math.floor(newPosition)})
            else
                interface.setWidgetValues(targetWidgetTagId, {opacity = newPosition})
            end
        end
    }
end

function interface.dashboard()
    openWidget(dashboardWidgetTag.id, true)
end

function interface.animate()
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

    interface.animation(introMenuWidget.childWidgets[1].widgetTag, introMenuWidgetTag.id, 0.2,
                        "vertical", final, initial, "ease out", "show")
    -- Animate the main menu widget
    interface.animation(widgetToAnimateId, containerId, 0.2, "vertical", initial, final, "ease out")
    for _, childWidget in pairs(mainMenuList.childWidgets) do
        -- Animate the main menu list widget
        interface.animation(childWidget.widgetTag, containerId, _ * 0.08, "horizontal",
                            childWidget.horizontalOffset - 50, childWidget.horizontalOffset,
                            "ease in", "show")
        interface.animation(childWidget.widgetTag, containerId, _ * 0.08, "opacity", 0, 1)
    end
    local dialogContainer = blam.uiWidgetDefinition(dialogWidgetTag.id)
    interface.animation(dialogWidgetTag.id, dialogWidgetTag.id, 0.2, "opacity", 0, 1)
end

--- Reset widgets animation data
function interface.animationsReset(widgetTagId)
    for _, animation in pairs(WidgetAnimations) do
        if animation.widgetContainerTagId == widgetTagId then
            animation.timestamp = nil
            animation.finished = false
        end
    end
end

function interface.onInputText(widgetTagId, text)
    local widget = blam.uiWidgetDefinition(widgetTagId)
    if widget.name == "lobby_search_input" then
        -- dprint("Searching for: " .. text)
        store:dispatch(actions.updateLobby(nil, nil, text))
    end
end

return interface
