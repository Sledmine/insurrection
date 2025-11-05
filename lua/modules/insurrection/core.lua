local inspect = require "inspect"
local blam = require "blam"
local script = require "script"
local tagClasses = blam.tagClasses
local json = require "json"
local base64 = require "base64"
local color = require "color"
local balltze = Balltze
local engine = Engine
local executeScript = engine.hsc.executeScript

local mercury = require "insurrection.mercury"
local utils = require "insurrection.utils"
local getState = require "insurrection.redux.getState"

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

function core.getRenderedUIWidgetTagHandle()
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
        local tag = engine.tag.getTag(widget.definitionTagHandle.value,
                                      engine.tag.classes.uiWidgetDefinition)
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
                VirtualInputValue[widgetTagId] = nil

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

---Get values of a widget in the DOM
---@param widgetTagId any
---@return MetaEngineWidget|nil
function core.getWidgetValues(widgetTagId)
    if core.getCurrentUIWidgetTag() then
        return engine.userInterface.findWidget(widgetTagId)
    end
end

local function setWidgetValuesDOMSafe(widgetTagHandle, values)
    -- Verify there is a widget loaded in the DOM
    local isWidgetPresent, widget = pcall(engine.userInterface.findWidget, widgetTagHandle)
    if isWidgetPresent and widget then
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
    return false
end

---Set the values of a widget in the DOM
---@param widgetTagHandleValue number
---@param values MetaEngineWidgetParams
---@param isAsync? boolean Control if the function should try to set values async if it fails
function core.setWidgetValues(widgetTagHandleValue, values, isAsync)
    local isAsync = isAsync == nil and true or isAsync
    if not setWidgetValuesDOMSafe(widgetTagHandleValue, values) then
        -- If it fails, try again in a script thread until it works or times out after N ticks
        -- This will prevent crashes and ensure widget gets updated if it takes a while to
        -- render in game DOM, despite update being called prior to rendering the widget

        -- Useful for allowing async updates to widgets that are not yet loaded, or running
        -- updates in events such as onOpen that are called before the widget is loaded
        if not isAsync then
            return
        end
        script.thread(function(_, sleep)
            -- Wait until desired widget is loaded in the DOM
            sleep(function()
                return setWidgetValuesDOMSafe(widgetTagHandleValue, values)
            end, 1, constants.maximumTicksForDOMRenderTime)
        end)()
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
    local isWidgetInDom, widget = pcall(engine.userInterface.findWidget, widgetTagHandleValue)
    if isWidgetInDom and widget then
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

    local colors = table.flatten(constants.customColors) --[[@as table<number, string>]]
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
                primary = colors[LastColorCustomization.primary or 1],
                secondary = colors[LastColorCustomization.secondary or 1]
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
        -- logger:warning("Region index {} out of range, maximum is {}", regionIndex,  maximumRegionIndex)
        return
    end

    local maximumPermutationIndex = objectModel.regionList[regionIndex].permutationCount - 1
    if permutationIndex > maximumPermutationIndex then
        logger:warning("Permutation index {} for region {} out of range, setting to 0",
                       permutationIndex, regionIndex)
        permutationIndex = 0
    end
    object["regionPermutation" .. regionIndex] = permutationIndex
end

---Copy text to user clipboard
---@param text string
function core.copyToClipboard(text)
    return balltze.misc.setClipboard(text)
end

---Get text from user clipboard
---@return string | nil
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

function core.rotateCustomizationBiped(rotation)
    local customizationObjectId = core.getCustomizationObjectId()
    assert(customizationObjectId, "No customization biped found")
    local object = blam.getObject(customizationObjectId)
    if object then
        blam.rotateObject(object, rotation, 0, 0)
    end
end

function core.createCustomizationBiped()
    execute_script "object_create customization_biped"
    local colorFromInsurrection = core.getCustomizationObjectData().color.custom
    core.setCustomizationBipedColor(colorFromInsurrection.primary, colorFromInsurrection.secondary)
end

function core.getLastSavedProject()
    local lastSavedProject = (core.loadSettings() or {}).lastSavedProject
    return lastSavedProject
end

function core.loadCustomizationBiped(projectName, customBipedPath)
    core.createCustomizationBiped()
    local state = getState()
    local savedBipeds = api.getSavedBipeds()
    local lastSavedProject = core.getLastSavedProject()
    local defaultProject =
        state.available.customization[table.keys(state.available.customization)[1]]
    local projectName = projectName or lastSavedProject or
                            table.keys(state.available.customization)[1]
    local project = state.available.customization[projectName] or defaultProject
    local regions
    local bipedPaths = table.map(project.tags, function(tagPath)
        return tagPath:replace(".biped", "")
    end)
    local bipedPath = customBipedPath or bipedPaths[1]
    logger:debug("Trying to load biped with path: {}", bipedPath)
    local savedBiped = savedBipeds[projectName]
    local visor = 0
    if savedBiped then
        local bipedIsStillAvailable = table.find(bipedPaths, function(bipedPath)
            return bipedPath == savedBiped.path
        end)
        if bipedIsStillAvailable then
            logger:debug("Save biped is still available")
            if not customBipedPath then
                bipedPath = savedBiped.path
                regions = savedBiped.regions
                visor = savedBiped.visor or visor
            elseif customBipedPath == savedBiped.path then
                regions = savedBiped.regions
                visor = savedBiped.visor or visor
            end
        end
    end

    local tagEntry = engine.tag.findTags(bipedPath, engine.tag.classes.biped)[1]
    if not tagEntry then
        logger:error("Custom external biped tag: {} not found", bipedPath)
        return
    end

    local bipedData = tagEntry.data
    if not bipedData then
        logger:error("Biped tag: {} has no data", bipedPath)
        return
    end

    local bipedTag = engine.tag.getTag(tagEntry.handle.value, engine.tag.classes.biped)
    assert(bipedTag, "Biped tag data not found")
    -- TODO Check if this is the right way to remove creation effect
    bipedTag.data.creationEffect.tagHandle.value = 0xFFFFFFFF
    -- TODO Remove this when biped animations are fixed in coop evolved
    if not (tagEntry.path:includes "marine" or tagEntry.path:includes "grunt") then
        -- FIXME This does not work with Balltze as weapons count is read only
        -- bipedTag.data.weapons.count = 0

        -- TODO Try to use unit remove weapon function or something similar
        local bipedTag = blam.bipedTag(tagEntry.handle.value)
        bipedTag.weaponCount = 0
    end

    local scenario = blam.scenario(0)
    assert(scenario)
    -- Respawn biped object from scenario as it is safer than doing it from lua
    for _, biped in pairs(scenario.bipeds) do
        local sceneryName = scenario.objectNames[biped.nameIndex + 1]
        if sceneryName == "customization_biped" then
            local newPaletteList = scenario.bipedPaletteList
            -- Replace scenario biped tag with custom biped tag
            if newPaletteList[biped.typeIndex + 1] ~= tagEntry.handle.value then
                newPaletteList[biped.typeIndex + 1] = tagEntry.handle.value
                scenario.bipedPaletteList = newPaletteList
                executeScript "object_destroy customization_biped"
                core.createCustomizationBiped()
                executeScript "fade_screen_in"
                logger:debug("Biped tag replaced")
            end
            break
        end
    end

    local customizationObjectData = core.getCustomizationObjectData()
    local customizationBiped = customizationObjectData.biped
    assert(customizationBiped, "No customization biped found")

    if regions then
        for regionIndex, permutationIndex in pairs(regions) do
            core.setObjectPermutationSafely(customizationBiped, regionIndex, permutationIndex)
        end
    end

    if visor then
        customizationBiped.shaderPermutationIndex = visor
    end

    logger:debug("Loading biped from project: {}", projectName)
    logger:debug("Loading biped with path: {}", bipedPath)
    return projectName, bipedPath, regions, visor
end

---Get the bitmap tag id for a map preview, or return unknown map preview if not found
---@param mapName string
function core.getMapBackgroundBitmap(mapName)
    local mapCollection = blam.tagCollection(constants.tagCollections.maps.id)
    assert(mapCollection, "No map preview collection found")
    for k, v in pairs(mapCollection.tagList) do
        local bitmapTag = blam.getTag(v) --[[@as tag]]
        local mapBitmapName = core.getTagName(bitmapTag.path):lower()
        -- local mapName = mapName:replace("_dev", ""):lower()
        local mapName = mapName:lower()
        if mapBitmapName == mapName then
            return bitmapTag.id
        end
    end
    return constants.bitmaps.unknownMapPreview.id
end

--- Save Firefight settings to plugin path
---@param settings table
function core.saveFirefightSettings(settings)
    logger:debug("Firefight settings path: {}", Balltze.filesystem.getPluginPath())
    logger:debug("Saving Firefight settings: {}", inspect(settings))
    local settingsPath = Balltze.filesystem.getPluginPath() .. "\\firefight_settings.json"
    Balltze.filesystem.writeFile(settingsPath, json.encode(settings))
end

--- Load Firefight settings from plugin path
---@return table | nil
function core.loadFirefightSettings()
    local settingsPath = Balltze.filesystem.getPluginPath() .. "\\firefight_settings.json"
    logger:debug("Firefight settings path: {}", settingsPath)
    local settingsFile = Balltze.filesystem.readFile(settingsPath)
    if settingsFile then
        local success, settings = pcall(json.decode, settingsFile)
        if success and settings then
            logger:debug("Loaded Firefight settings: {}", inspect(settings))
            return settings
        end
    end
end

--- Save firefight skulls settings to plugin path
---@param settings table
function core.saveFirefightSkullsSettings(settings)
    for _, skullData in pairs(settings) do
        -- Clean up settings from invalid vaues
        for key, value in pairs(skullData) do
            if type(value) == "function" then
                logger:debug("Removing invalid skull setting key: {} with function value", key)
                skullData[key] = nil
            end
        end
    end

    logger:debug("Firefight skulls settings path: {}", Balltze.filesystem.getPluginPath())
    logger:debug("Saving Firefight skulls settings: {}", inspect(settings))
    local settingsPath = Balltze.filesystem.getPluginPath() .. "\\firefight_skulls_settings.json"
    Balltze.filesystem.writeFile(settingsPath, json.encode(settings))
end

--- Load firefight skulls settings from plugin path
---@return table | nil
function core.loadFirefightSkullsSettings()
    local settingsPath = Balltze.filesystem.getPluginPath() .. "\\firefight_skulls_settings.json"
    logger:debug("Firefight skulls settings path: {}", settingsPath)
    local settingsFile = Balltze.filesystem.readFile(settingsPath)
    if settingsFile then
        local success, settings = pcall(json.decode, settingsFile)
        if success and settings then
            logger:debug("Loaded Firefight skulls settings: {}", inspect(settings))
            return settings
        end
    end
end

return core
