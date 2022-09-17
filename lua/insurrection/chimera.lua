local harmony = require "mods.harmony"
local glue = require "glue"
local split = glue.string.split
local ends = glue.string.ends
local chunks = glue.chunks
local blam = require "blam"
local tagClasses = blam.tagClasses
local ini = require "ini"
local json = require "json"

local core = require "insurrection.core"

local chimera = {}

---@class chimeraServer
---@field ip string
---@field port number
---@field password string
---@field dns string?

---@type chimeraServer[]
local servers = {}
local maximumDisplayedServers = 10
local maximumDisplayedOptions = maximumDisplayedServers + 1

local myGamesPath = read_string(0x00647830)

---Load the list of servers from chimera in cache
---@return string[]
function chimera.loadServers(loadHistory)
    servers = {}
    local serversFilePath = myGamesPath .. "\\chimera\\bookmark.txt"
    if loadHistory then
        serversFilePath = myGamesPath .. "\\chimera\\history.txt"
    end
    local serversFile = glue.readfile(serversFilePath, "t")
    if (serversFile) then
        -- Get each server entry from the bookmarks file
        local storedServers = split(serversFile, "\n")
        for serverIndex, serverData in ipairs(storedServers) do
            local serverSplit = split(serverData, " ")

            local serverHost = serverSplit[1]
            local hostSplit = split(serverHost, ":")

            local serverIp = hostSplit[1]
            local serverPort = tonumber(hostSplit[2])
            local serverPassword = serverSplit[2]
            if (serverIp and serverIp ~= "") then
                servers[#servers + 1] = {
                    ip = serverIp,
                    port = serverPort or 2302,
                    password = serverPassword or "x"
                }
            else
                storedServers[serverIndex] = nil
            end
        end
    end
    -- Reflect servers on the UI
    if #servers > 0 then
        local serversTag = blam.findTag("chimera_servers_options", tagClasses.uiWidgetDefinition)
        if serversTag then
            local serversList = blam.uiWidgetDefinition(serversTag.id)
            for serverIndex = 1, maximumDisplayedServers do
                local server = servers[serverIndex]
                local childWidget = serversList.childWidgets[serverIndex + 1]
                if server and childWidget then
                    local serverOption = blam.uiWidgetDefinition(childWidget.widgetTag)
                    local serverOptionStringList = blam.unicodeStringList(
                                                       serverOption.unicodeStringListTag)
                    local stringList = serverOptionStringList.stringList
                    local serverLabel = serverIndex .. " = " .. server.ip .. ":" .. server.port
                    -- local serverLabel = serverIndex .. ":" .. serverPort
                    -- local server, queryError = chimera.queryServer(serverIp, serverPort)
                    local server, queryError
                    if (server) then
                        serverLabel = server.hostname:sub(1, 21) .. " - " .. server.ping .. "ms"
                        if (serverPassword) then
                            stringList[1] = serverLabel .. " [L]"
                        end
                    else
                        if (queryError) then
                            stringList[1] = serverLabel .. " - " .. queryError:upper()
                        else
                            stringList[1] = serverLabel
                        end
                    end
                    serverOptionStringList.stringList = stringList
                end
            end
            serversList.childWidgetsCount = maximumDisplayedOptions
            if (#servers < maximumDisplayedOptions) then
                serversList.childWidgetsCount = #servers + 1
            end
        end
    end
    return nil
end

--- Map selected bookmark from the UI
---@param widgetTagId number
function chimera.onButton(widgetTagId)
    local widgetTag = blam.getTag(widgetTagId)
    local widgetPath = widgetTag.path
    if widgetPath:find "chimera_server_button" then
        local buttonName = core.getTagName(widgetPath)
        local buttonSplit = split(buttonName, "_")
        local buttonIndex = tonumber(buttonSplit[#buttonSplit])

        local bookmark = servers[buttonIndex]
        local serverIp = bookmark.ip
        local serverPort = bookmark.port
        local serverPassword = bookmark.password
        execute_script("connect " .. serverIp .. ":" .. serverPort .. " " .. serverPassword)
    elseif ends(widgetPath, "bookmark_servers") then
        chimera.loadServers()
    elseif ends(widgetPath, "history_servers") then
        chimera.loadServers(true)
    end
end

---@class serverInfo
---@field dedicated string
---@field final string
---@field fraglimit string
---@field game_classic string
---@field game_flags string
---@field gamemode string
---@field gametype string
---@field gamevariant string
---@field gamever string
---@field hostname string
---@field hostport number
---@field mapname string
---@field maxplayers number
---@field nextmap string
---@field nextmode string
---@field numplayers string
---@field password string
---@field ping number
---@field player_flags string
---@field queryid string
---@field sapp string
---@field sapp_flags string
---@field score_t0 string
---@field score_t1 string
---@field team_t0 string
---@field team_t1 string
---@field teamplay string

local inspect = require "inspect"
--- Attempt to query a game server
---@param serverIp string
---@param serverPort number
---@return serverInfo
function chimera.queryServer(serverIp, serverPort)
    local result, info = pcall(harmony.server.query_status, serverIp, serverPort)
    if (result) then
        print(info)
        local data = split(info, "\\")
        local object = {}
        for i = 2, #data, 2 do
            local key = data[i]
            local value = data[i + 1]
            if (key == "hostport" or key == "maxplayers" or key == "numplayers" or key ==
                "fraglimit" or key == "ping") then
                value = tonumber(value)
            end
            object[key] = value
        end
        print(inspect(object))
        return object
    else
        if (info:find("timeout")) then
            return false, "timeout"
        elseif (info:find("recive")) then
            return false, "no response"
        elseif (info:find("send")) then
            return false, "failed request"
        end
    end
    return false
end

---@class chimeraConfiguration
---@field server_list Serverlist
---@field custom_console Customconsole
---@field memory Memory
---@field controller any[]
---@field font_override Fontoverride
---@field custom_chat Customchat
---@field scoreboard Scoreboard
---@field hotkey Hotkey
---@field video_mode Videomode
---@field name Name
---@field error_handling any[]
---@field halo Halo

---@class Halo
---@field hash string
---@field background_playback number
---@field optimal_defaults number
---@field console number

---@class Name
---@field font string

---@class Videomode
---@field height string
---@field borderless number
---@field refresh_rate number
---@field windowed number
---@field width string
---@field enabled number
---@field vsync number

---@class Hotkey
---@field ctrl_alt_shift_3 string
---@field alt_6 string
---@field ctrl_1 string
---@field alt_5 string
---@field ctrl_6 string
---@field ctrl_0 string
---@field alt_shift_3 string
---@field ctrl_alt_shift_2 string
---@field ctrl_4 string
---@field alt_1 string
---@field enabled number
---@field ctrl_7 string
---@field alt_0 string
---@field alt_8 string
---@field ctrl_9 string
---@field alt_shift_4 string
---@field ctrl_2 string
---@field alt_4 string
---@field ctrl_alt_shift_1 string
---@field ctrl_3 string
---@field f12 string
---@field ctrl_8 string
---@field alt_3 string
---@field alt_shift_2 string
---@field alt_9 string
---@field alt_shift_1 string
---@field alt_7 string
---@field ctrl_5 string
---@field alt_2 string

---@class Scoreboard
---@field font string
---@field fade_time number

---@class Customchat
---@field chat_message_hide_on_console number
---@field server_message_color_r number
---@field chat_input_anchor string
---@field chat_input_x number
---@field chat_input_color_b number
---@field chat_message_color_red_g number
---@field server_message_anchor string
---@field chat_message_color_red_a number
---@field chat_message_anchor string
---@field server_fade_out_time number
---@field chat_fade_out_time number
---@field server_slide_time_length number
---@field chat_input_color_a number
---@field server_message_font string
---@field server_time_up number
---@field chat_input_font string
---@field chat_message_y number
---@field chat_message_w number
---@field chat_slide_time_length number
---@field chat_input_w number
---@field chat_message_color_red_b number
---@field chat_message_h number
---@field chat_message_x number
---@field chat_message_color_blue_g number
---@field server_message_hide_on_console number
---@field server_message_color_a number
---@field server_message_h_chat_open number
---@field chat_message_color_ffa_g number
---@field chat_input_color_r number
---@field server_message_color_g number
---@field chat_message_color_ffa_r number
---@field chat_message_color_ffa_a number
---@field chat_message_font string
---@field chat_input_color_g number
---@field chat_line_height number
---@field chat_message_color_ffa_b number
---@field chat_message_color_blue_a number
---@field chat_message_color_blue_b number
---@field chat_input_y number
---@field server_message_w number
---@field chat_message_h_chat_open number
---@field chat_message_color_red_r number
---@field server_message_color_b number
---@field server_message_y number
---@field chat_message_color_blue_r number
---@field server_message_x number
---@field chat_time_up number
---@field server_line_height number
---@field server_message_h number

---@class Fontoverride
---@field ticker_font_weight number
---@field large_font_override number
---@field large_font_shadow_offset_y number
---@field small_font_offset_x number
---@field smaller_font_family string
---@field smaller_font_offset_y number
---@field ticker_font_offset_x number
---@field smaller_font_shadow_offset_x number
---@field small_font_shadow_offset_y number
---@field system_font_shadow_offset_x number
---@field system_font_shadow_offset_y number
---@field smaller_font_offset_x number
---@field small_font_offset_y number
---@field ticker_font_offset_y number
---@field ticker_font_family string
---@field smaller_font_override number
---@field small_font_family string
---@field console_font_shadow_offset_y number
---@field system_font_y_offset number
---@field large_font_family string
---@field console_font_offset_y number
---@field system_font_override number
---@field system_font_weight number
---@field large_font_size number
---@field ticker_font_override number
---@field small_font_override number
---@field console_font_size number
---@field ticker_font_shadow_offset_x number
---@field large_font_weight number
---@field console_font_family string
---@field enabled number
---@field console_font_weight number
---@field ticker_font_shadow_offset_y number
---@field smaller_font_size number
---@field system_font_size number
---@field small_font_weight number
---@field console_font_override number
---@field ticker_font_size number
---@field smaller_font_shadow_offset_y number
---@field small_font_size number
---@field large_font_offset_y number
---@field system_font_x_offset number
---@field large_font_shadow_offset_x number
---@field smaller_font_weight number
---@field large_font_offset_x number
---@field console_font_shadow_offset_x number
---@field console_font_offset_x number
---@field system_font_family string
---@field small_font_shadow_offset_x number

---@class Memory
---@field download_font string
---@field enable_map_memory_buffer number
---@field map_size number

---@class Customconsole
---@field fade_time number
---@field fade_start number
---@field buffer_size_soft number
---@field enable_scrollback number
---@field line_height number
---@field enabled number
---@field buffer_size number
---@field x_margin number

---@class Serverlist
---@field auto_query number

local insurrectionFontOverride = {
    console_font_family = "Hack Bold",
    console_font_offset_x = 0,
    console_font_offset_y = 0,
    console_font_override = 1,
    console_font_shadow_offset_x = 2,
    console_font_shadow_offset_y = 2,
    console_font_size = 10,
    console_font_weight = 400,
    enabled = 1,
    large_font_family = "Geogrotesque-Regular",
    large_font_offset_x = 0,
    large_font_offset_y = 3,
    large_font_override = 1,
    large_font_shadow_offset_x = 2,
    large_font_shadow_offset_y = 2,
    large_font_size = 13,
    large_font_weight = 400,
    small_font_family = "Geogrotesque-Regular",
    small_font_offset_x = 0,
    small_font_offset_y = 3,
    small_font_override = 1,
    small_font_shadow_offset_x = 2,
    small_font_shadow_offset_y = 2,
    small_font_size = 10,
    small_font_weight = 400,
    smaller_font_family = "Geogrotesque-Regular",
    smaller_font_offset_x = 0,
    smaller_font_offset_y = 4,
    smaller_font_override = 1,
    smaller_font_shadow_offset_x = 0,
    smaller_font_shadow_offset_y = 0,
    smaller_font_size = 10,
    smaller_font_weight = 400,
    system_font_family = "Geogrotesque-Regular",
    system_font_override = 1,
    system_font_shadow_offset_x = 2,
    system_font_shadow_offset_y = 2,
    system_font_size = 11,
    system_font_weight = 400,
    system_font_x_offset = 0,
    system_font_y_offset = 1,
    ticker_font_family = "Geogrotesque-Regular",
    ticker_font_offset_x = 0,
    ticker_font_offset_y = 0,
    ticker_font_override = 1,
    ticker_font_shadow_offset_x = 2,
    ticker_font_shadow_offset_y = 2,
    ticker_font_size = 18,
    ticker_font_weight = 400
}

local chimeraFontOverride = {
    console_font_family = "Hack Bold",
    console_font_offset_x = 0,
    console_font_offset_y = 0,
    console_font_override = 1,
    console_font_shadow_offset_x = 2,
    console_font_shadow_offset_y = 2,
    console_font_size = 14,
    console_font_weight = 400,
    enabled = 1,
    large_font_family = "Interstate-Bold",
    large_font_offset_x = 0,
    large_font_offset_y = 1,
    large_font_override = 1,
    large_font_shadow_offset_x = 2,
    large_font_shadow_offset_y = 2,
    large_font_size = 20,
    large_font_weight = 400,
    small_font_family = "Interstate-Bold",
    small_font_offset_x = 0,
    small_font_offset_y = 3,
    small_font_override = 1,
    small_font_shadow_offset_x = 2,
    small_font_shadow_offset_y = 2,
    small_font_size = 15,
    small_font_weight = 400,
    smaller_font_family = "Interstate-Bold",
    smaller_font_offset_x = 0,
    smaller_font_offset_y = 4,
    smaller_font_override = 1,
    smaller_font_shadow_offset_x = 2,
    smaller_font_shadow_offset_y = 2,
    smaller_font_size = 11,
    smaller_font_weight = 400,
    system_font_family = "Interstate-Bold",
    system_font_override = 1,
    system_font_shadow_offset_x = 2,
    system_font_shadow_offset_y = 2,
    system_font_size = 20,
    system_font_weight = 400,
    system_font_x_offset = 0,
    system_font_y_offset = 1,
    ticker_font_family = "Lucida Console",
    ticker_font_offset_x = 0,
    ticker_font_offset_y = 0,
    ticker_font_override = 1,
    ticker_font_shadow_offset_x = 2,
    ticker_font_shadow_offset_y = 2,
    ticker_font_size = 11,
    ticker_font_weight = 400
}

---Get chimera configuration
---@return chimeraConfiguration?
function chimera.getConfiguration()
    local configIni = glue.readfile("chimera.ini", "t")
    if configIni then
        ---@type chimeraConfiguration
        local configuration = ini.decode(configIni)
        return configuration
    end
end

function chimera.saveConfiguration(configuration)
    local configIni = ini.encode(configuration)
    return glue.writefile("chimera.ini", configIni, "t")
end

function chimera.setupFonts()
    local chimeraIni = glue.readfile("chimera.ini", "t")
    if chimeraIni then
        ---@type chimeraConfiguration
        local configuration = chimera.getConfiguration()
        configuration.font_override = insurrectionFontOverride
        return chimera.saveConfiguration(configuration)
    end
    return false
end

function chimera.getPreferences()
    local preferencesTxt = glue.readfile(
                               core.getMyGamesHaloCEPath() .. "\\chimera\\preferences.txt", "t")
    if preferencesTxt then
        local preferences = {}
        -- Split the file into lines and iterate over them (using Windows line endings)
        for line in preferencesTxt:gmatch("[^\r\n]+") do
            -- Search for line that starts with "chimera"
            if line:sub(1, 7) == "chimera" then
                -- Get key and value from line separeted by a space
                local key, value = line:match("([^ ]+) (.+)")
                if key and value then
                    preferences[key] = value
                end
            end
        end
        return preferences
    end
end

function chimera.savePreferences(preferences)
    local preferencesTxt = ""
    for key, value in pairs(preferences) do
        preferencesTxt = preferencesTxt .. key .. " " .. value .. "\r\n"
    end
    return glue.writefile(core.getMyGamesHaloCEPath() .. "\\chimera\\preferences.txt",
                          preferencesTxt, "t")
end

return chimera
