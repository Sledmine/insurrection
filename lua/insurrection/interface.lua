local harmony = require "mods.harmony"
local openWidget = harmony.ui.open_widget
local blam = require "blam"
local interface = {}
--- Find the path, index and id of a tag given partial name and tag type
---@param partialName string
---@param searchTagType string
---@return tag tag
function findTag(partialName, searchTagType)
    for tagIndex = 0, blam.tagDataHeader.count - 1 do
        local tempTag = blam.getTag(tagIndex)
        if (tempTag and tempTag.path:find(partialName, 1, true) and tempTag.class == searchTagType) then
            return {
                id = tempTag.id,
                path = tempTag.path,
                index = tempTag.index,
                class = tempTag.class,
                indexed = tempTag.indexed,
                data = tempTag.data
            }
        end
    end
    return nil
end
local dialogWidgetTag = findTag("dialog_menu", blam.tagClasses.uiWidgetDefinition)
local lobbyWidgetTag = findTag("lobby_menu", blam.tagClasses.uiWidgetDefinition)

function interface.dialog(titleText, subtitleText, bodyText)
    local dialog = blam.uiWidgetDefinition(dialogWidgetTag.id)
    local header = blam.uiWidgetDefinition(dialog.childWidgets[1].widgetTag)
    local title = blam.uiWidgetDefinition(header.childWidgets[1].widgetTag)
    local headerStrings = blam.unicodeStringList(title.unicodeStringListTag)
    local strings = headerStrings.stringList
    strings[1] = titleText
    strings[2] = subtitleText
    headerStrings.stringList = strings
    local body = blam.uiWidgetDefinition(dialog.childWidgets[3].widgetTag)
    local bodyStrings = blam.unicodeStringList(body.unicodeStringListTag)
    local strings = bodyStrings.stringList
    strings[1] = bodyText
    bodyStrings.stringList = strings

    openWidget(dialogWidgetTag.id, true)
end

function interface.lobby(templates, gametypes, maps)
    local widget = blam.uiWidgetDefinition(lobbyWidgetTag.id)
    local definitionsWidget = blam.uiWidgetDefinition(widget.childWidgets[2].widgetTag)
    local elementsWidget = blam.uiWidgetDefinition(widget.childWidgets[3].widgetTag)

    local templateWidget = blam.uiWidgetDefinition(definitionsWidget.childWidgets[1].widgetTag)
    local mapWidget = blam.uiWidgetDefinition(definitionsWidget.childWidgets[2].widgetTag)
    local gametypeWidget = blam.uiWidgetDefinition(definitionsWidget.childWidgets[3].widgetTag)

    blam.unicodeStringList(templateWidget.unicodeStringListTag).stringList = {templates[1]:upper()}
    blam.unicodeStringList(mapWidget.unicodeStringListTag).stringList = {maps[1]:upper()}
    blam.unicodeStringList(gametypeWidget.unicodeStringListTag).stringList = {gametypes[1]:upper()}

    for childIndex, childWidget in pairs(elementsWidget.childWidgets) do
        if maps[childIndex] then
            local child = blam.uiWidgetDefinition(childWidget.widgetTag)
            blam.unicodeStringList(child.unicodeStringListTag).stringList = {
                maps[childIndex]:upper()
            }
        end
    end
    if #maps < elementsWidget.childWidgetsCount then
        elementsWidget.childWidgetsCount = #maps
    end

    openWidget(lobbyWidgetTag.id, true)
end

return interface
