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
local keyboardInputAddress = 0x64C550

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
function core.onButton(widgetTagId)
    local buttonPath = blam.getTag(widgetTagId).path
    if ends(buttonPath, "login_button") then
        api.login("sledmine", "1234")
    elseif ends(buttonPath, "register_button") then
        console_out("Coming soon...")
    end
end

local lastPressedKey
function core.readKeyboard()
    local keyboard = {
        esc = read_byte(keyboardInputAddress),
        f1 = read_byte(keyboardInputAddress + 1),
        f2 = read_byte(keyboardInputAddress + 2),
        f3 = read_byte(keyboardInputAddress + 3),
        f4 = read_byte(keyboardInputAddress + 4),
        f5 = read_byte(keyboardInputAddress + 5),
        f6 = read_byte(keyboardInputAddress + 6),
        f7 = read_byte(keyboardInputAddress + 7),
        f8 = read_byte(keyboardInputAddress + 8),
        f9 = read_byte(keyboardInputAddress + 9),
        f10 = read_byte(keyboardInputAddress + 10),
        f11 = read_byte(keyboardInputAddress + 11),
        f12 = read_byte(keyboardInputAddress + 12),
        print_screen = read_byte(keyboardInputAddress + 13),
        unknown = read_byte(keyboardInputAddress + 14),
        pause = read_byte(keyboardInputAddress + 15),
        unknown2 = read_byte(keyboardInputAddress + 16),
        ["1"] = read_byte(keyboardInputAddress + 17),
        ["2"] = read_byte(keyboardInputAddress + 18),
        ["3"] = read_byte(keyboardInputAddress + 19),
        ["4"] = read_byte(keyboardInputAddress + 20),
        ["5"] = read_byte(keyboardInputAddress + 21),
        ["6"] = read_byte(keyboardInputAddress + 22),
        ["7"] = read_byte(keyboardInputAddress + 23),
        ["8"] = read_byte(keyboardInputAddress + 24),
        ["9"] = read_byte(keyboardInputAddress + 25),
        ["0"] = read_byte(keyboardInputAddress + 26),
        minus = read_byte(keyboardInputAddress + 27),
        equal = read_byte(keyboardInputAddress + 28),
        backspace = read_byte(keyboardInputAddress + 29),
        tab = read_byte(keyboardInputAddress + 30),
        q = read_byte(keyboardInputAddress + 31),
        w = read_byte(keyboardInputAddress + 32),
        e = read_byte(keyboardInputAddress + 33),
        r = read_byte(keyboardInputAddress + 34),
        t = read_byte(keyboardInputAddress + 35),
        y = read_byte(keyboardInputAddress + 36),
        u = read_byte(keyboardInputAddress + 37),
        i = read_byte(keyboardInputAddress + 38),
        o = read_byte(keyboardInputAddress + 39),
        p = read_byte(keyboardInputAddress + 40),
        open_bracket = read_byte(keyboardInputAddress + 41),
        close_bracket = read_byte(keyboardInputAddress + 42),
        backslash = read_byte(keyboardInputAddress + 43),
        caps_lock = read_byte(keyboardInputAddress + 44),
        a = read_byte(keyboardInputAddress + 45),
        s = read_byte(keyboardInputAddress + 46),
        d = read_byte(keyboardInputAddress + 47),
        f = read_byte(keyboardInputAddress + 48),
        g = read_byte(keyboardInputAddress + 49),
        h = read_byte(keyboardInputAddress + 50),
        j = read_byte(keyboardInputAddress + 51),
        k = read_byte(keyboardInputAddress + 52),
        l = read_byte(keyboardInputAddress + 53),
        colon = read_byte(keyboardInputAddress + 54),
        quote = read_byte(keyboardInputAddress + 55),
        enter = read_byte(keyboardInputAddress + 56),
        shift = read_byte(keyboardInputAddress + 57),
        z = read_byte(keyboardInputAddress + 58),
        x = read_byte(keyboardInputAddress + 59),
        c = read_byte(keyboardInputAddress + 60),
        v = read_byte(keyboardInputAddress + 61),
        b = read_byte(keyboardInputAddress + 62),
        n = read_byte(keyboardInputAddress + 63),
        m = read_byte(keyboardInputAddress + 64),
        comma = read_byte(keyboardInputAddress + 65),
        period = read_byte(keyboardInputAddress + 66),
        forward_slash = read_byte(keyboardInputAddress + 67),
        right_shift = read_byte(keyboardInputAddress + 68),
        ctrl = read_byte(keyboardInputAddress + 69),
        unknown3 = read_byte(keyboardInputAddress + 70),
        alt = read_byte(keyboardInputAddress + 71),
        space = read_byte(keyboardInputAddress + 72),
        right_alt = read_byte(keyboardInputAddress + 73),
        unknown4 = read_byte(keyboardInputAddress + 74),
        menu = read_byte(keyboardInputAddress + 75),
        right_ctrl = read_byte(keyboardInputAddress + 76),
        up_arrow = read_byte(keyboardInputAddress + 77),
        down_arrow = read_byte(keyboardInputAddress + 78),
        left_arrow = read_byte(keyboardInputAddress + 79),
        right_arrow = read_byte(keyboardInputAddress + 80),
        unknown5 = read_byte(keyboardInputAddress + 81),
        home = read_byte(keyboardInputAddress + 82),
        page_up = read_byte(keyboardInputAddress + 83),
        delete = read_byte(keyboardInputAddress + 84),
        ["end"] = read_byte(keyboardInputAddress + 85),
        page_down = read_byte(keyboardInputAddress + 86),
        num_lock = read_byte(keyboardInputAddress + 87),
        num_division = read_byte(keyboardInputAddress + 88),
        num_multiply = read_byte(keyboardInputAddress + 89),
        num_0 = read_byte(keyboardInputAddress + 90),
        num_1 = read_byte(keyboardInputAddress + 91),
        num_2 = read_byte(keyboardInputAddress + 92),
        num_3 = read_byte(keyboardInputAddress + 93),
        num_4 = read_byte(keyboardInputAddress + 94),
        num_5 = read_byte(keyboardInputAddress + 95),
        num_6 = read_byte(keyboardInputAddress + 96),
        num_7 = read_byte(keyboardInputAddress + 97),
        num_8 = read_byte(keyboardInputAddress + 98),
        num_9 = read_byte(keyboardInputAddress + 99),
        num_minus = read_byte(keyboardInputAddress + 100),
        num_plus = read_byte(keyboardInputAddress + 101),
        num_enter = read_byte(keyboardInputAddress + 102),
        num_comma = read_byte(keyboardInputAddress + 103)
    }
    local pressedKey
    for key, pressTime in pairs(keyboard) do
        if pressTime > 5 then
            if lastPressedKey == key then
                if pressTime > 60 then
                    pressedKey = key
                end
            else
                pressedKey = key
                lastPressedKey = pressedKey
            end
        end
    end
    return pressedKey
end

return core
