local glue = require "glue"
local split = glue.string.split
local inspect = require "inspect"
local blam = require "blam"
local tagClasses = blam.tagClasses
local json = require "json"
local base64 = require "base64"

local mercury = require "insurrection.mercury"
local scriptVersion = "insurrection-" .. require "insurrection.version"

local currentWidgetIdAddress = 0x6B401C
local keyboardInputAddress = 0x64C550
local clientPortAddress = 0x6337F8
local clientPort = read_word(clientPortAddress)
local friendlyClientPort = 2305

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

function core.loadInsurrectionPatches()
    -- Force usage a more friendly client port
    -- if clientPort ~= friendlyClientPort then
    --    write_dword(clientPortAddress, friendlyClientPort)
    -- end
    -- Force enable sound extensions
    execute_script("sound_enable_eax 1")
    execute_script("sound_enable_hardware 1")
    local scriptVersionTag = blam.findTag("variable_info", tagClasses.unicodeStringList)
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

function core.saveCredentials(username, password)
    write_file("credentials.json",
               json.encode({username = username, password = base64.encode(password)}))
end

function core.loadCredentials()
    local credentialsFile = read_file("credentials.json")
    if credentialsFile then
        local credentials = json.decode(credentialsFile)
        if credentials then
            return credentials.username, base64.decode(credentials.password)
        end
    end
end

function core.loadSettings()
    local settingsFile = read_file("settings.json")
    if settingsFile then
        local settings = json.decode(settingsFile)
        if settings then
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
    if (keyCode == 29) then
        return "backspace"
    elseif (keyCode == 72) then
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

function core.getStringFromWidget(widgetId)
    local widget = blam.uiWidgetDefinition(widgetId)
    local virtualValue = VirtualInputValue[widget.name]
    if virtualValue then
        return virtualValue
    end
    local unicodeStrings = blam.unicodeStringList(widget.unicodeStringListTag)
    return unicodeStrings.stringList[widget.stringListIndex + 1]
end

function core.cleanAllEditableWidgets()
    for _, widgetTag in pairs(blam.findTagsList("input", tagClasses.uiWidgetDefinition)) do
        local widget = blam.uiWidgetDefinition(widgetTag.id)
        local widgetStrings = blam.unicodeStringList(widget.unicodeStringListTag)
        if widgetStrings then
            local strings = widgetStrings.stringList
            strings[1] = ""
            widgetStrings.stringList = strings
        end
    end
end

function core.setStringToWidget(str, widgetId, mask)
    local widget = blam.uiWidgetDefinition(widgetId)
    if mask then
        VirtualInputValue[widget.name] = str
        blam.unicodeStringList(widget.unicodeStringListTag).stringList = {string.rep(mask, #str)}
    else
        blam.unicodeStringList(widget.unicodeStringListTag).stringList = {str}
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

return core
