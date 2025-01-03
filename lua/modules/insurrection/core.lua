local inspect = require "inspect"
local blam = require "blam"
local tagClasses = blam.tagClasses
local json = require "json"
local base64 = require "base64"
local color = require "color"
local balltze = Balltze
local engine = Engine

local mercury = require "insurrection.mercury"
local utils = require "insurrection.utils"

local currentWidgetIdAddress = 0x6B401C
local keyboardInputAddress = 0x64C550
local clientPortAddress = 0x6337F8
local friendlyClientPort = 2305
local profileNameAddress = 0x6ADE22
local profileColorAddress = 0x6ADF3A
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
    Balltze.filesystem.writeFile("credentials.json", json.encode(
                                     {username = username, password = base64.encode(password)}))
end

function core.loadCredentials()
    local credentialsFile = Balltze.filesystem.readFile("credentials.json")
    if credentialsFile then
        local success, credentials = pcall(json.decode, credentialsFile)
        if success and credentials then
            return credentials.username:trim(), base64.decode(credentials.password):trim()
        end
    end
end

function core.loadSettings()
    local settingsFile = Balltze.filesystem.readFile("settings.json")
    if settingsFile then
        local success, settings = pcall(json.decode, settingsFile)
        if success and settings then
            return settings
        end
    end
end

function core.updateSettings(newSettings)
    local previousSettings = core.loadSettings() or {}
    local settings = table.merge(previousSettings, newSettings)
    core.saveSettings(settings)
end

function core.saveSettings(settings)
    Balltze.filesystem.writeFile("settings.json", json.encode(settings))
end

function core.getRenderedUIWidgetTagId()
    -- TODO BALLTZE MIGRATE Ensure this works when the menu is not OPEN and does not crash
    local rootWidget = engine.userInterface.getRootWidget()
    local isPlayerOnMenu = rootWidget ~= nil
    if isPlayerOnMenu then
        return rootWidget.definitionTagHandle.value
    end
end

--- Get the tag widget of the current ui open in the game
function core.getCurrentUIWidgetTag()
    -- local widgetTagId = core.getRenderedUIWidgetTagId()
    local widget = engine.userInterface.getRootWidget()
    if widget then
        local tag = engine.tag.getTag(widget.definitionTagHandle.value, engine.tag.classes.uiWidgetDefinition)
        assert(tag, "No tag found for widget")
        -- TODO BALLTZE MIGRATE
        return {
            data = tag.data,
            id = widget.definitionTagHandle.value,
            tagPath = tag.path,
            tagClass = tag.primaryClass,
            index = tag.handle.index
        }
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
---@param pressedKey string | number | nil
---@param text string
---@return string | nil text Given text with mapped modifications applied
function core.mapKeyToText(pressedKey, text)
    if not pressedKey then
        return text
    end
    if pressedKey == "backspace" then
        return text:sub(1, #text - 1)
    elseif pressedKey == "space" then
        return text .. " "
    elseif pressedKey == "capslock" then
        capsLock = not capsLock
    elseif pressedKey > 31 and pressedKey < 127 and type(pressedKey) == "number" then
        if capsLock then
            return text .. string.char(pressedKey):upper()
        end
        return text .. string.char(pressedKey)
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
    engine.hsc.executeScript(command:format(host, port, password))
end

function core.getMyGamesHaloCEPath()
    local myGamesPath = read_string(0x00647830)
    return myGamesPath
end

function core.getWidgetValues(widgetTagId)
    if core.getCurrentUIWidgetTag() then
        return engine.userInterface.findWidget(widgetTagId)
    end
end

function core.setWidgetValues(widgetTagId, values)
    local function setValuesDOMSafe()
        -- Verify there is a widget loaded in the DOM
        local widget = engine.userInterface.findWidget(widgetTagId)
        if widget then
            for key, value in pairs(values) do
                if type(value) == "table" then
                    for subKey, subValue in pairs(value) do
                        widget[key][subKey] = subValue
                    end
                else
                    widget[key] = value
                end
            end
            return true
        end
    end
    if not setValuesDOMSafe() then
        -- If there is no widget loaded in the DOM, wait 33ms and try again
        -- (this is a workaround for the DOM not being loaded yet)
        -- TODO BALLTZE MIGRATE
        -- utils.delay(33, function()
        --    setValuesDOMSafe()
        -- end)
    end
end

-- TODO We do not need this, checkout replacements
function core.getWidgetHandle(widgetTagId)
    if core.getCurrentUIWidgetTag() then
        local sucess, widgetHandle = pcall(engine.userInterface.findWidgets, widgetTagId)
        if sucess and widgetHandle then
            return widgetHandle
        end
    end
end

function core.replaceWidgetInDom(widgetTagHandleValue, newWidgetTagHandleValue)
    local replaced, widget = pcall(engine.userInterface.findWidget, widgetTagHandleValue)
    if replaced and widget then
        engine.userInterface.replaceWidget(widget, newWidgetTagHandleValue)
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
            -- TODO BALLTZE MIGRATE
            -- harmony.menu.block_input(true)
        end
        LoadingText = text or "Loading..."
        log(LoadingText)
    else
        -- TODO BALLTZE MIGRATE
        -- harmony.menu.block_input(false)
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
            return objectId
        end
    end
end

function core.getMouseState()
    return {
        right = read_int(mouseInputAddress),
        up = read_int(mouseInputAddress + 4),
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

LastColorCustomization = {primary = 1, secondary = 1}
function core.getCustomizationObjectData()
    local customizationObjectId = core.getCustomizationObjectId()
    assert(customizationObjectId, "No customization biped found")
    local customizationBiped = blam.biped(get_object(customizationObjectId))
    assert(customizationBiped, "No customization biped found")
    local customizationBipedTag = blam.bipedTag(customizationBiped.tagId)
    assert(customizationBipedTag, "No customization biped tag found")
    local customizationModel = blam.model(customizationBipedTag.model)
    assert(customizationModel, "No customization biped model found")

    local primaryColor = color.decToHex(customizationBiped.colorCLowerRed,
                                        customizationBiped.colorCLowerGreen,
                                        customizationBiped.colorCLowerBlue)

    local secondaryColor = color.decToHex(customizationBiped.colorDLowerRed,
                                          customizationBiped.colorDLowerGreen,
                                          customizationBiped.colorDLowerBlue)

    local colors = table.flatten(constants.customColors)
    return {
        id = customizationObjectId,
        handle = customizationObjectId,
        biped = customizationBiped,
        bipedTag = customizationBipedTag,
        tag = blam.getTag(customizationBiped.tagId),
        model = customizationModel,
        regions = {
            customizationBiped.regionPermutation1,
            customizationBiped.regionPermutation2,
            customizationBiped.regionPermutation3,
            customizationBiped.regionPermutation4,
            customizationBiped.regionPermutation5,
            customizationBiped.regionPermutation6,
            customizationBiped.regionPermutation7,
            customizationBiped.regionPermutation8
        },
        color = {
            primary = primaryColor,
            secondary = secondaryColor,
            custom = {
                primary = colors[LastColorCustomization.primary],
                secondary = colors[LastColorCustomization.secondary]
            }
        },
        visor = customizationBiped.shaderPermutationIndex
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

    -- This one does not need to be substracted by 1 because property name is Lua 1-based
    local maximumRegionIndex = objectModel.regionCount
    if regionIndex > maximumRegionIndex then
        console_debug("Region index " .. regionIndex .. " out of range, maximum is " ..
                          maximumRegionIndex)
        return
    end

    local maximumPermutationIndex = objectModel.regionList[regionIndex].permutationCount - 1
    if permutationIndex > maximumPermutationIndex then
        console_debug("Permutation index " .. permutationIndex .. " for region " .. regionIndex ..
                          " out of range, setting to 0")
        permutationIndex = 0
    end
    object["regionPermutation" .. regionIndex] = permutationIndex
end

function core.copyToClipboard(text)
    return balltze.misc.setClipboard(text)
end

function core.getClipboard()
    return balltze.misc.getClipboard()
end

---Get the current screen aspect ratio
---@return number aspectWidth, number aspectHeight
function core.getScreenAspectRatio()
    local screenWidth, screenHeight = core.getScreenResolution()
    log("Screen resolution: " .. screenWidth .. "x" .. screenHeight)
    -- Calculate the greatest common divisor (GCD) using Euclidean algorithm
    local function gcd(a, b)
        while b ~= 0 do
            a, b = b, a % b
        end
        return a
    end

    -- Calculate the aspect ratio
    local divisor = gcd(screenWidth, screenHeight)
    local aspectWidth = screenWidth / divisor
    local aspectHeight = screenHeight / divisor

    -- Format the aspect ratio as a string
    -- local aspectRatioString = string.format("%d:%d", aspectWidth, aspectHeight)

    return aspectWidth, aspectHeight
end

---Get current player profile
---@return {name: string, colorIndex: number}
function core.getPlayerProfile()
    local profile = {}
    profile.name = blam.readUnicodeString(profileNameAddress, true)
    profile.colorIndex = read_byte(profileColorAddress) + 1
    return profile
end

--- Set customization biped color if possible
--- @param primaryColorHex? string
--- @param secondaryColorHex? string
function core.setCustomizationBipedColor(primaryColorHex, secondaryColorHex)
    local customizationObjectData = core.getCustomizationObjectData()
    local customizationBiped = customizationObjectData.biped

    -- Set primary color
    if primaryColorHex then
        LastColorCustomization.primary = table.indexof(table.flatten(constants.customColors),
                                                      primaryColorHex)
        local r, g, b = color.hexToDec(primaryColorHex)
        customizationBiped.colorCLowerRed = r
        customizationBiped.colorCLowerGreen = g
        customizationBiped.colorCLowerBlue = b
    end

    -- Set secondary color
    if secondaryColorHex then
        LastColorCustomization.secondary = table.indexof(table.flatten(constants.customColors),
                                                        secondaryColorHex)
        r, g, b = color.hexToDec(secondaryColorHex)
        customizationBiped.colorDLowerRed = r
        customizationBiped.colorDLowerGreen = g
        customizationBiped.colorDLowerBlue = b
    end
end

function core.getCustomizationColorByValue(value)
    local colorIndex = table.indexof(table.flatten(constants.customColors), value)
    local colorName = table.keyof(constants.customColor, value)
    return colorIndex, colorName
end

return core
