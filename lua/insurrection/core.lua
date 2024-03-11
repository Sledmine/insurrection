local inspect = require "inspect"
local blam = require "blam"
local tagClasses = blam.tagClasses
local json = require "json"
local base64 = require "base64"
local harmony = require "mods.harmony"

local mercury = require "insurrection.mercury"
local utils = require "insurrection.utils"

local currentWidgetIdAddress = 0x6B401C
local keyboardInputAddress = 0x64C550
local clientPortAddress = 0x6337F8
local clientPort = read_word(clientPortAddress)
local friendlyClientPort = 2305
local profileNameAddress = 0x6ADE22
local mouseInputAddress = 0x64C73C
local widgetCursorGlobals = 0x499E19

local core = {}

function core.loadMercuryPackages()
    local installedPackages = mercury.getInstalled()
    if (installedPackages) then
        console_out(inspect(installedPackages))
        local serverStringsTag = blam.findTag([[chimera_servers_menu\strings\options]],
                                              tagClasses.unicodeStringList)
        local serverStrings = blam.unicodeStringList(serverStringsTag.id)
        local newServers = serverStrings.stringList
        for stringIndex = 1, serverStrings.count do
            newServers[stringIndex] = " "
        end
        for packageIndex, packageLabel in pairs(table.keys(installedPackages)) do
            local package = installedPackages[packageLabel]
            newServers[packageIndex] = package.name .. " - " .. package.version
        end
        serverStrings.stringList = newServers
    end
end

--- Return the file name of a tag file path
---@param tagPath string
function core.getTagName(tagPath)
    local tagSplit = tagPath:split "\\"
    local tagName = tagSplit[#tagSplit]
    return tagName
end

function core.loadInsurrectionPatches()
    package.loaded["insurrection.version"] = nil
    local scriptVersion = "insurrection-" .. require "insurrection.version"
    -- Force usage a more friendly client port
    -- if clientPort ~= friendlyClientPort then
    --    write_dword(clientPortAddress, friendlyClientPort)
    -- end

    -- Setting up version string
    local scriptVersionTag = blam.findTag("insurrection_version_footer",
                                          tagClasses.unicodeStringList)
    if scriptVersionTag then
        local scriptVersionString = blam.unicodeStringList(scriptVersionTag.id)
        if scriptVersionString then
            local strings = scriptVersionString.stringList
            -- Write string version to map tag
            strings[1] = scriptVersion
            scriptVersionString.stringList = strings
        end
        return true
    end
end

function core.saveCredentials(username, password)
    write_file("credentials.json",
               json.encode({username = username, password = base64.encode(password)}))
end

function core.loadCredentials()
    local credentialsFile = read_file("credentials.json")
    if credentialsFile then
        local success, credentials = pcall(json.decode, credentialsFile)
        if success and credentials then
            return credentials.username, base64.decode(credentials.password)
        end
    end
end

function core.loadSettings()
    local settingsFile = read_file("settings.json")
    if settingsFile then
        local success, settings = pcall(json.decode, settingsFile)
        if success and settings then
            return settings
        end
    end
end

function core.saveSettings(settings)
    write_file("settings.json", json.encode(settings))
end

function core.getRenderedUIWidgetTagId()
    local isPlayerOnMenu = read_byte(blam.addressList.gameOnMenus) == 0
    if isPlayerOnMenu then
        local widgetIdAddress = read_dword(currentWidgetIdAddress)
        if widgetIdAddress and widgetIdAddress ~= 0 then
            local widgetId = read_dword(widgetIdAddress)
            return widgetId
        end
    end
end

--- Get the tag widget of the current ui open in the game
---@return tag | nil
function core.getCurrentUIWidgetTag()
    local widgetTagId = core.getRenderedUIWidgetTagId()
    if widgetTagId then
        local widgetTag = blam.getTag(widgetTagId)
        return widgetTag
    end
    return nil
end

---Attempt to translate a input key code
---@param keyCode integer
---@return string | nil name of the given key code
function core.translateKeycode(keyCode)
    if keyCode == 29 then
        return "backspace"
    elseif keyCode == 72 then
        return "space"
    else
        return nil
    end
end

local capsLock
---Attempt to map keys to a text string
---@param pressedKey string
---@param text string
---@return string | nil text Given text with mapped modifications applied
function core.mapKeyToText(pressedKey, text)
    if pressedKey == "backspace" then
        return text:sub(1, #text - 1)
    elseif pressedKey == "space" then
        return text .. " "
    elseif pressedKey == "capslock" then
        capsLock = not capsLock
    elseif #pressedKey == 1 and string.byte(pressedKey) > 31 and string.byte(pressedKey) < 127 then
        if capsLock then
            return text .. pressedKey:upper()
        end
        return text .. pressedKey
    end
end

function core.getStringFromWidget(widgetTagId)
    local widget = blam.uiWidgetDefinition(widgetTagId)
    assert(widget, "No widget found with tag id " .. widgetTagId)
    local virtualValue = VirtualInputValue[widgetTagId]
    if virtualValue then
        return virtualValue
    end
    local unicodeStrings = blam.unicodeStringList(widget.unicodeStringListTag)
    assert(unicodeStrings, "No unicodeStringList, can't get text from this widget")
    return unicodeStrings.strings[widget.stringListIndex + 1]
end

function core.cleanAllEditableWidgets()
    local editableWidgets = blam.findTagsList("input", tagClasses.uiWidgetDefinition) or {}
    for _, widgetTag in pairs(editableWidgets) do
        local widget = blam.uiWidgetDefinition(widgetTag.id)
        assert(widget, "No widget found with tag id " .. widgetTag.id)
        local widgetStrings = blam.unicodeStringList(widget.unicodeStringListTag)
        if widgetStrings then
            local strings = widgetStrings.strings
            strings[1] = ""
            widgetStrings.strings = strings
        end
    end
end

function core.setStringToWidget(text, widgetTagId, mask)
    local widgetDefinition = blam.uiWidgetDefinition(widgetTagId)
    if widgetDefinition then
        local unicodeStrings = blam.unicodeStringList(widgetDefinition.unicodeStringListTag)
        if unicodeStrings then
            if blam.isNull(unicodeStrings) then
                error("No unicodeStringList, can't assign text to this widget")
            end
            local stringListIndex = widgetDefinition.stringListIndex
            local newStrings = unicodeStrings.strings
            if mask then
                VirtualInputValue[widgetTagId] = text
                newStrings[stringListIndex + 1] = string.rep(mask, #text)
            else
                newStrings[stringListIndex + 1] = text
            end
            unicodeStrings.strings = newStrings
        end
    end
end

---Attempt to connect a game server
---@param host string
---@param port number
---@param password string
function core.connectServer(host, port, password)
    local command = "connect %s:%s \"%s\""
    execute_script(command:format(host, port, password))
end

function core.getMyGamesHaloCEPath()
    local myGamesPath = read_string(0x00647830)
    return myGamesPath
end

function core.getWidgetValues(widgetTagId)
    if core.getCurrentUIWidgetTag() then
        local sucess, widgetHandle = pcall(harmony.menu.find_widgets, widgetTagId)
        if sucess and widgetHandle then
            return harmony.menu.get_widget_values(widgetHandle)
        end
    end
end

function core.setWidgetValues(widgetTagId, values)
    local function setValuesDOMSafe()
        -- Verify there is a widget loaded in the DOM
        local widgetHandle = core.getWidgetHandle(widgetTagId)
        if widgetHandle then
            harmony.menu.set_widget_values(widgetHandle, values)
            return true
        end
    end
    if not setValuesDOMSafe() then
        -- If there is no widget loaded in the DOM, wait 33ms and try again
        -- (this is a workaround for the DOM not being loaded yet)
        utils.delay(33, function()
            setValuesDOMSafe()
        end)
    end
end

function core.getWidgetHandle(widgetTagId)
    if core.getCurrentUIWidgetTag() then
        local sucess, widgetHandle = pcall(harmony.menu.find_widgets, widgetTagId)
        if sucess and widgetHandle then
            return widgetHandle
        end
    end
end

function core.replaceWidgetInDom(widgetTagId, newWidgetTagId)
    local widgetHandle = core.getWidgetHandle(widgetTagId)
    if widgetHandle then
        harmony.menu.replace_widget(widgetHandle, newWidgetTagId)
    end
end

---Returns the current screen resolution
---@return number width, number height
function core.getScreenResolution()
    local width = read_word(0x637CF2)
    local height = read_word(0x637CF0)
    return width, height
end

local function isThreadRunning()
    if #Lanes == 0 then
        return false
    end
    return true
end

---Set game in loading state
---@param isLoading boolean
---@param text? string
---@param blockInput? boolean
function core.loading(isLoading, text, blockInput)
    if isLoading then
        -- There is already another thread running, do not modify loading status
        if isThreadRunning() then
            return
        end
        if blockInput then
            harmony.menu.block_input(true)
        end
        LoadingText = text or "Loading..."
        dprint(LoadingText)
    else
        harmony.menu.block_input(false)
        LoadingText = nil
    end
end

function core.setGameProfileName(name)
    local name = name
    if name then
        -- Limit name to 11 characters
        if #name > 11 then
            name = name:sub(1, 11)
        end
        blam.writeUnicodeString(profileNameAddress, name, true)
    end
    local profileName = blam.readUnicodeString(profileNameAddress, true)
    return profileName
end

---Get reference to any customization object available in the map
---@return number? objectId, table? regionPermutations
function core.getCustomizationObjectId()
    local scenario = blam.scenario(0)
    assert(scenario)
    for objectId, objectIndex in pairs(blam.getObjects()) do
        local object = blam.object(get_object(objectIndex))
        if object and scenario.objectNames[object.nameIndex + 1] == "customization_biped" then
            object.isNotCastingShadow = false
            return objectId, {
                object.regionPermutation1,
                object.regionPermutation2,
                object.regionPermutation3,
                object.regionPermutation4,
                object.regionPermutation5,
                object.regionPermutation6,
                object.regionPermutation7,
                object.regionPermutation8
            }
        end
    end
end

function core.getMouseState()
    return {
        right = read_long(mouseInputAddress),
        up = read_long(mouseInputAddress + 4),
        scroll = read_char(mouseInputAddress + 8),
        leftClick = read_byte(mouseInputAddress + 12),
        scrollClick = read_byte(mouseInputAddress + 13),
        rightClick = read_byte(mouseInputAddress + 14)
    }
end

function core.getWidgetCursorPosition()
    local cursorGlobals = read_dword(widgetCursorGlobals)
    if cursorGlobals then
        local cursorX = read_int(cursorGlobals + 0x4)
        local cursorY = read_int(cursorGlobals + 0x8)
        return cursorX, cursorY
    end
end

function core.getCustomizationObjectData()
    local customizationObjectId = core.getCustomizationObjectId()
    assert(customizationObjectId, "No customization biped found")
    local customizationBiped = blam.biped(get_object(customizationObjectId))
    assert(customizationBiped, "No customization biped found")
    local customizationBipedTag = blam.bipedTag(customizationBiped.tagId)
    assert(customizationBipedTag, "No customization biped tag found")
    local customizationModel = blam.model(customizationBipedTag.model)
    assert(customizationModel, "No customization biped model found")
    return {
        id = customizationObjectId,
        biped = customizationBiped,
        bipedTag = customizationBipedTag,
        tag = blam.getTag(customizationBiped.tagId),
        model = customizationModel
    }
end

---Set the region permutation of a customization object
---
---NOTE: Assumes region index starts at 1
---@param object blamObject
---@param regionIndex number
---@param permutationIndex number
function core.setObjectPermutationSafely(object, regionIndex, permutationIndex)
    local objectBipedTag = blam.bipedTag(object.tagId)
    assert(objectBipedTag, "No biped tag found")
    local objectModel = blam.model(objectBipedTag.model)
    assert(objectModel, "No biped model found")

    local regionCount = objectModel.regionCount
    if regionIndex > regionCount then
        dprint("Region index " .. regionIndex .. " out of range, leaving object as is")
        return
    end

    local maximumPermutationCount = objectModel.regionList[regionIndex].permutationCount
    if permutationIndex > maximumPermutationCount then
        dprint("Permutation index " .. permutationIndex .. " out of range, setting to 0")
        permutationIndex = 0
    end
    object["regionPermutation" .. regionIndex] = permutationIndex
end

return core
