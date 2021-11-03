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

local myGamesPath = read_string(0x00647830)

--- Return the list of bookmarks available on Chimera
---@return string[]
function chimera.loadBookmarks()
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
                newServers[serverIndex] = serverIp
                if (serverPassword) then
                    newServers[serverIndex] = serverIp .. " - Private"
                end
                bookmarks[#bookmarks + 1] = {
                    ip = serverIp,
                    port = serverPort or 2302,
                    password = serverPassword or "x"
                }
            else
                bookmarkedServers[serverIndex] = nil
            end
            local serversListTag = core.findTag([[chimera_servers_menu\options\options]], tagClasses.uiWidgetDefinition)
            local serversList = blam.uiWidgetDefinition(serversListTag.id)
            if (#bookmarkedServers <= 10) then
                serversList.childWidgetsCount = #bookmarkedServers
            end
            serverStrings.stringList = newServers
        end

    end
    return nil
end

function chimera.getBookmarks()
    return bookmarks
end

--- Map selected bookmark from the UI
---@param widgetTagId any
function chimera.mapBookMarks(widgetTagId)
    local widgetTag = blam.getTag(widgetTagId)
    local widgetPath = widgetTag.path
    if (widgetTag.path:find("chimera_servers_menu\\options\\server_")) then
        local buttonName = core.getTagName(widgetPath)
        local buttonSplit = split(buttonName, "_")
        local buttonIndex = tonumber(buttonSplit[#buttonSplit])

        local bookmark = bookmarks[buttonIndex]
        local serverIp = bookmark.ip
        local serverPort = bookmark.port
        local serverPassword = bookmark.password
        --console_out("connect " .. serverIp .. ":" ..serverPort .. " " .. serverPassword)
        execute_script("connect " .. serverIp .. ":" ..serverPort .. " " .. serverPassword)
        return false
    end
end

return chimera
