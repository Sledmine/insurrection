local glue = require "glue"

local core = {}

local myGamesPath = read_string(0x00647830)

--- Find the path, index and id of a tag given partial name and tag type
---@param partialName string
---@param searchTagType string
---@return tag tag
function core.findTag(partialName, searchTagType)
    for tagIndex = 0, blam.tagDataHeader.count - 1 do
        local tempTag = blam.getTag(tagIndex)
        if (tempTag and tempTag.path:find(partialName) and tempTag.class == searchTagType) then
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

function core.getChimeraBookmarks()
    local bookmarksFilePath = myGamesPath .. "\\chimera\\bookmark.txt"
    local bookmarksFile = glue.readfile(bookmarksFilePath, "t")
    console_out(bookmarksFilePath)
    if (bookmarksFile) then
        local servers = glue.string.split(bookmarksFile, "\n")
        glue.map(servers, function(serverData)
            if (serverData ~= "") then
                console_out(serverData)
            end
        end)
        return bookmarksFile
    end
    return nil
end

return core
