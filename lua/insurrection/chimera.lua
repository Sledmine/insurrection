local harmony = require "mods.harmony"
local glue = require "glue"
local split = glue.string.split

local blam = require "blam"
local tagClasses = blam.tagClasses

local core = require "insurrection.core"

local chimera = {}

---@class chimeraBookmark
---@field ip string
---@field port number
---@field password string
---@field dns string?

---@type chimeraBookmark[]
local bookmarks = {}
local cachedBookmarks = false

local myGamesPath = read_string(0x00647830)

--- Return the list of bookmarks available on Chimera
---@return string[]
function chimera.loadBookmarks()
    if (not cachedBookmarks) then
        local bookmarksFilePath = myGamesPath .. "\\chimera\\bookmark.txt"
        local bookmarksFile = glue.readfile(bookmarksFilePath, "t")
        if (bookmarksFile) then
            local serverStringsTag = core.findTag([[chimera_servers_menu\strings\options]],
                                                  tagClasses.unicodeStringList)
            local serverStrings = blam.unicodeStringList(serverStringsTag.id)
            local bookmarkedServers = split(bookmarksFile, "\n")
            local newServers = serverStrings.stringList
            for stringIndex = 1, serverStrings.count do
                newServers[stringIndex] = " "
            end
            for serverIndex, serverData in pairs(bookmarkedServers) do
                local serverSplit = split(serverData, " ")
                local serverHost = serverSplit[1]
                local hostSplit = split(serverHost, ":")

                local serverIp = hostSplit[1]
                local serverPort = tonumber(hostSplit[2])
                local serverPassword = serverSplit[2]
                if (serverIp and serverIp ~= "") then
                    -- local serverLabel = serverIp .. ":" .. serverPort
                    local serverLabel = serverIndex .. ":" .. serverPort
                    -- local server, queryError = chimera.queryServer(serverIp, serverPort)
                    local server, queryError
                    newServers[serverIndex] = serverLabel
                    if (server) then
                        serverLabel = server.hostname:sub(1, 21) .. " - " .. server.ping .. "ms"
                        if (serverPassword) then
                            newServers[serverIndex] = serverLabel .. " [L]"
                        end
                    else
                        if (queryError) then
                            newServers[serverIndex] = serverLabel .. " - " .. queryError:upper()
                        else
                            newServers[serverIndex] = serverLabel
                        end
                    end
                    bookmarks[#bookmarks + 1] = {
                        ip = serverIp,
                        port = serverPort or 2302,
                        password = serverPassword or "x"
                    }
                else
                    bookmarkedServers[serverIndex] = nil
                end
                serverStrings.stringList = newServers
                cachedBookmarks = true
            end
        end
    end
    return nil
end

function chimera.resetBookmarks()
    cachedBookmarks = false
end

--- Map selected bookmark from the UI
---@param widgetTagId number
function chimera.mapBookMarks(widgetTagId)
    local widgetTag = blam.getTag(widgetTagId)
    local widgetPath = widgetTag.path
    if (widgetPath:find("chimera_servers_menu\\options\\server_")) then
        local buttonName = core.getTagName(widgetPath)
        local buttonSplit = split(buttonName, "_")
        local buttonIndex = tonumber(buttonSplit[#buttonSplit])

        local bookmark = bookmarks[buttonIndex]
        local serverIp = bookmark.ip
        local serverPort = bookmark.port
        local serverPassword = bookmark.password
        -- console_out("connect " .. serverIp .. ":" ..serverPort .. " " .. serverPassword)
        execute_script("connect " .. serverIp .. ":" .. serverPort .. " " .. serverPassword)
        return false
    elseif (widgetPath == [[insurrection\ui\main_menu\menu_options\multiplayer_menu\options\bookmark_servers]]) then
        local serversListTag = core.findTag([[chimera_servers_menu\options\options]],
                                            tagClasses.uiWidgetDefinition)
        local serversList = blam.uiWidgetDefinition(serversListTag.id)
        if (#bookmarks <= 10) then
            serversList.childWidgetsCount = #bookmarks + 1
        end
        return false
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
