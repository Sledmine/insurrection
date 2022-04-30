local harmony = require "mods.harmony"
local bezierCurve = harmony.math.get_bezier_curve_point

local openWidget = harmony.menu.open_widget
local reloadWidget = harmony.menu.reload_widget
local findWidgets = harmony.menu.find_widgets
local blam = require "blam"
local findTag = blam.findTag
local actions = require "insurrection.redux.actions"
local core = require "insurrection.core"
local getWidgetString = core.getStringFromWidget
local setWidgetString = core.setStringToWidget
local glue = require "glue"
local split = glue.string.split
local ends = glue.string.ends
local unicodeStringTag = blam.unicodeStringList
local uiWidgetTag = blam.uiWidgetDefinition

local function findWidgetTag(partialName)
    return findTag(partialName, blam.tagClasses.uiWidgetDefinition)
end

local interface = {}
local dialogWidgetTag = findWidgetTag("dialog_menu")
local lobbyWidgetTag = findWidgetTag("lobby_menu")

function interface.dialog(titleText, subtitleText, bodyText)
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
        api.login(username, password)
    elseif ends(buttonPath, "register_button") then
        interface.dialog("INFORMATION", "UNDER CONSTRUCTION", "Coming soon...")
    elseif ends(buttonPath, "lobby_definition_button_1") then
        store:dispatch(actions.setLobbyDefinition("template"))
    elseif ends(buttonPath, "lobby_definition_button_2") then
        store:dispatch(actions.setLobbyDefinition("map"))
    elseif ends(buttonPath, "lobby_definition_button_3") then
        store:dispatch(actions.setLobbyDefinition("gametype"))
    elseif ends(buttonPath, "lobby_definition_button_4") then
        local template = getWidgetString(findWidgetTag("lobby_definition_button_1").id)
        local map = getWidgetString(findWidgetTag("lobby_definition_button_2").id)
        local gametype = getWidgetString(findWidgetTag("lobby_definition_button_3").id)
        api.borrow(template:lower(), map:lower(), gametype:lower())
    elseif string.find(buttonPath, "lobby_element_button_") then
        local buttonIndex = split(core.getTagName(buttonPath), "_")[4]
        local value = getWidgetString(findWidgetTag("lobby_element_button_" .. buttonIndex).id)
        store:dispatch(actions.setSelected(value))
    end
end

function interface.update()
    ---@type interfaceState
    local state = store:getState()
    local widget = uiWidgetTag(lobbyWidgetTag.id)
    local optionsWidget = uiWidgetTag(widget.childWidgets[2].widgetTag)
    local definitionsWidget = uiWidgetTag(optionsWidget.childWidgets[1].widgetTag)
    local elementsWidget = uiWidgetTag(optionsWidget.childWidgets[2].widgetTag)

    setWidgetString(state.selected.template:upper(), definitionsWidget.childWidgets[1].widgetTag)
    setWidgetString(state.selected.map:upper(), definitionsWidget.childWidgets[2].widgetTag)
    setWidgetString(state.selected.gametype:upper(), definitionsWidget.childWidgets[3].widgetTag)

    -- elementsWidget.childWidgetsCount = 6
    -- local elements = state.displayed
    -- for childIndex = 1,6 do
    --    childWidget = elementsWidget.childWidgets[childIndex]
    --    if elements[childIndex] then
    --        setWidgetString(elements[childIndex]:upper(), childWidget.widgetTag)
    --    end
    -- end
    --
    -- if #elements < 4 then
    --    elementsWidget.childWidgetsCount = #elements
    -- end

    -- Reload dynamically changed widgets from tags, effectively redrawing the UI
    local foundWidgets = findWidgets(optionsWidget.childWidgets[2].widgetTag, true)
    local widgetInstanceIndex = foundWidgets[1]
    if widgetInstanceIndex then
        reloadWidget(widgetInstanceIndex)
    end
end

function interface.setWidgetValues(widgetTagId, values)
    local widgetInstanceId = harmony.menu.find_widgets(widgetTagId)
    if (widgetInstanceId) then
        harmony.menu.set_widget_values(widgetInstanceId, values);
    end
end

function interface.animation(targetWidgetTagId,
                             widgetContainerTagId,
                             duration,
                             property,
                             originalOffset,
                             offset)
    local animationId = targetWidgetTagId .. widgetContainerTagId .. property
    WidgetAnimations[animationId] = {
        finished = false,
        widgetContainerTagId = widgetContainerTagId,
        animate = function()
            local originalOffset = originalOffset
            if not WidgetAnimations[animationId].elapsed then
                harmony.time.set_timestamp(animationId)
            end
            local elapsed = harmony.time.get_elapsed_milliseconds(animationId) / 1000
            WidgetAnimations[animationId].elapsed = elapsed
            -- console_out(elapsed)
            -- console_out(duration)
            if elapsed >= (duration) then

                if property == "horizontal" then
                    interface.setWidgetValues(targetWidgetTagId, {left_bound = offset})
                elseif property == "vertical" then
                    interface.setWidgetValues(targetWidgetTagId, {top_bound = offset})
                else
                    interface.setWidgetValues(targetWidgetTagId, {opacity = offset})
                end

                WidgetAnimations[animationId].elapsed = nil
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
            local newPosition = bezierCurve("buttons", originalOffset, offset, t)
            -- local newOpacity = bezierCurve("opacity", 0, 1, t)

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

return interface
