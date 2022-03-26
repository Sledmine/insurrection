local harmony = require "mods.harmony"
local glue = require "glue"
local split = glue.string.split
local ends = glue.string.ends
local chunks = glue.chunks
local blam = require "blam"
local tagClasses = blam.tagClasses

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
        local serversTag = core.findTag("chimera_servers_options", tagClasses.uiWidgetDefinition)
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

return chimera
