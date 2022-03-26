local glue = require "glue"
local split = glue.string.split
local ends = glue.string.ends
local inspect = require "inspect"
local blam = require "blam"
local tagClasses = blam.tagClasses
local api = require "insurrection.api"

local mercury = require "insurrection.mercury"
local scriptVersion = require "insurrection.version"

-- local clientPort = read_word(0x006337F8)
local currentWidgetIdAddress = 0x6B401C

local core = {}

--- Find the path, index and id of a tag given partial name and tag type
---@param partialName string
---@param searchTagType string
---@return tag tag
function core.findTag(partialName, searchTagType)
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

--- Find the path, index and id of a list of tags given partial name and tag type
---@param partialName string
---@param searchTagType string
---@return tag[] tag
function core.findTagsList(partialName, searchTagType)
    local tagsList
    for tagIndex = 0, blam.tagDataHeader.count - 1 do
        local tag = blam.getTag(tagIndex)
        if (tag and tag.path:find(partialName, 1, true) and tag.class == searchTagType) then
            if (not tagsList) then
                tagsList = {}
            end
            glue.append(tagsList, tag)
        end
    end
    return tagsList
end

function core.loadMercuryPackages()
    local installedPackages = mercury.getInstalled()
    if (installedPackages) then
        console_out(inspect(installedPackages))
        local serverStringsTag = core.findTag([[chimera_servers_menu\strings\options]],
                                              tagClasses.unicodeStringList)
        local serverStrings = blam.unicodeStringList(serverStringsTag.id)
        local newServers = serverStrings.stringList
        for stringIndex = 1, serverStrings.count do
            newServers[stringIndex] = " "
        end
        for packageIndex, packageLabel in pairs(glue.keys(installedPackages)) do
            local package = installedPackages[packageLabel]
            newServers[packageIndex] = package.name .. " - " .. package.version
        end
        serverStrings.stringList = newServers
    end
end

--- Return the file name of a tag file path
---@param tagPath string
function core.getTagName(tagPath)
    local tagSplit = split(tagPath, "\\")
    local tagName = tagSplit[#tagSplit]
    return tagName
end

function core.loadNameplates()
    local nameplateBitmapTags = core.findTagsList("nameplates\\", tagClasses.bitmap)
    local nameplateTag = core.findTag("shared\\current_profile", tagClasses.uiWidgetDefinition)
    local nameplate = blam.uiWidgetDefinition(nameplateTag.id)
    nameplate.backgroundBitmap = nameplateBitmapTags[math.random(#nameplateBitmapTags)].id
end

function core.loadInsurrectionPatches()
    local scriptVersionTag = core.findTag("variable_info", tagClasses.unicodeStringList)
    if (scriptVersionTag) then
        local scriptVersionString = blam.unicodeStringList(scriptVersionTag.id)
        if (scriptVersionString) then
            local strings = scriptVersionString.stringList
            -- Write string version to map tag
            strings[1] = scriptVersion
            scriptVersionString.stringList = strings
        end
        return true
    end
end

--- Get the tag widget of the current ui open in the game
---@return tag
function core.getCurrentUIWidget()
    local isPlayerOnMenu = read_byte(blam.addressList.gameOnMenus) == 0
    if (isPlayerOnMenu) then
        local widgetIdAddress = read_dword(currentWidgetIdAddress)
        if (widgetIdAddress and widgetIdAddress ~= 0) then
            local widgetId = read_dword(widgetIdAddress)
            local tag = blam.getTag(widgetId)
            if (tag) then
                return tag
            end
        end
    end
    return nil
end

function core.patchChimeraFonts()
    -- create_font_override(int tag_id, string family, int size, int weight, int offset_x, int offset_y, int shadow_x, int shadow_y)
end

--- Map selected button from the UI
---@param widgetTagId number
function core.OnButton(widgetTagId)
    local buttonPath = blam.getTag(widgetTagId).path
    if ends(buttonPath, "login_button") then
        api.login("sledmine", "1234")
    elseif ends(buttonPath, "register_button") then
        console_out("Coming soon...")
    end
end

return core
