local constants = require "insurrection.constants"
local core = require "insurrection.core"
local engine = Engine
local balltze = Balltze
local logger = balltze.logger
local blam = require "blam"

local specialEvents = {}

local christmasHats = {}

local isDecember = function()
    local date = os.date("*t")
    -- return date.month == 12 and date.day >= 24 and date.day <= 26
    return date.month == 12
end

function specialEvents.onPostMapLoad()
    -- Reset hats
    christmasHats = {}
    local mapHeader = engine.cacheFile.getLoadedCacheFileHeader()
    if mapHeader and mapHeader.name == "ui" then
        return
    end
    if not isDecember() then
        return
    end
    local treeScenerys = table.filter(table.map(engine.tag.filterTags("scenery", "tree"),
                                                function(tag)
        return {path = tag.path, tagHandle = tag.handle}
    end), function(tag)
        return not tag.path:includes("insurrection")
    end)

    -- TODO Using this will result in a memory leak due to how accessing elements trough Balltze
    -- works, basically this creates 999999+ elements in the table, which will never be garbage
    -- collected, so we need to use the for loop below instead to use actual elements count

    -- local xmasTreeCollection = table.map(constants.scenery.xmasObjects.data.tags.elements, function(tag)
    --    return {path = tag.reference.path, handle = tag/.reference.tagHandle}
    -- end)

    ---@type MetaEngineTagCollectionTag[]
    local xmasTreeCollection = {}
    for i = 1, #constants.scenery.xmasObjects.data.tags do
        local tag = constants.scenery.xmasObjects.data.tags[i]
        table.insert(xmasTreeCollection,
                     {path = tag.reference.path, handle = tag.reference.tagHandle})
    end

    -- Erase all insurrection trees if any (helps with reloading plugin)
    for objectIndex = 0, 2047 do
        local object = engine.object.getObject(objectIndex)
        if object then
            if object.type == engine.tag.objectType.scenery then
                local scenery = engine.object.getObject(objectIndex, engine.tag.objectType.scenery)
                assert(scenery, "Failed to get scenery object")
                local sceneryTag = engine.tag.getTagData(scenery.tagHandle, "scenery")
                assert(sceneryTag, "Failed to get scenery tag")
                if sceneryTag.path:includes("insurrection") and sceneryTag.path:includes("tree") then
                    -- No direct Balltze v2 equivalent for blam.getObject(); this legacy compatibility
                    -- lookup is kept only for the old object table access path used by the game.
                    local _, objectHandle = blam.getObject(objectIndex)
                    assert(objectHandle, "Failed to get object handle")
                    engine.object.deleteObject(objectHandle)
                end
            end
        end
    end

    -- Create xmas trees
    for objectIndex = 0, 2047 do
        local object = engine.object.getObject(objectIndex)
        if object then
            if object.type == engine.tag.objectType.scenery then
                local scenery = engine.object.getObject(objectIndex, engine.tag.objectType.scenery)
                assert(scenery, "Failed to get scenery object")
                local sceneryTag = engine.tag.getTagData(scenery.tagHandle, "scenery")
                assert(sceneryTag, "Failed to get scenery tag")
                if not sceneryTag.path:includes("insurrection") then
                    local sceneryName = core.getTagName(sceneryTag.path)
                    local sceneryToReplace = table.find(xmasTreeCollection, function(xmasTree)
                        local xmasTreeName = core.getTagName(xmasTree.path)
                        return xmasTreeName == sceneryName
                    end)
                    if sceneryToReplace then
                        logger.debug("Replacing {} with {}", sceneryTag.path, sceneryToReplace.path)
                        local newSceneryHandle = engine.object.createObject(
                                                     sceneryToReplace.handle, nil, {
                                x = scenery.position.x,
                                y = scenery.position.y,
                                z = scenery.position.z
                            })
                        local _, objectHandle = blam.getObject(objectIndex)
                        assert(objectHandle, "Failed to get object handle")
                        engine.object.objectAttachToMarker(objectHandle, "",
                                                          newSceneryHandle.value, "")
                    end

                end
            end
        end
    end
end

function specialEvents.onTick()
    local mapHeader = engine.cacheFile.getLoadedCacheFileHeader()
    if mapHeader and mapHeader.name == "ui" then
        return
    end
    if not isDecember() then
        return
    end
    for playerIndex = 0, constants.limits.maximumPlayers do
        local player = engine.player.getPlayer(playerIndex)
        if player then
            -- Balltze v2 uses unitHandle for players; objectHandle is no longer the correct field.
            local unitHandle = player.unitHandle and player.unitHandle.value
            local biped = unitHandle and engine.object.getObject(unitHandle, engine.tag.objectType.biped)
            if biped then
                if not christmasHats[playerIndex] then
                    local hatHandle = engine.object.createObject(
                                          constants.scenery.christmasHat.handle.value, nil, {
                            x = biped.position.x,
                            y = biped.position.y,
                            z = biped.position.z + 1
                        })
                    christmasHats[playerIndex] = hatHandle
                    engine.object.objectAttachToMarker(unitHandle, "head", hatHandle, "")
                end
                if christmasHats[playerIndex] then
                    local hat = engine.object.getObject(christmasHats[playerIndex],
                                                       engine.tag.objectType.scenery)
                    if not hat then
                        christmasHats[playerIndex] = nil
                    end
                    if hat and hat.parentObject.value ~= unitHandle then
                        christmasHats[playerIndex] = nil
                    end
                end
            end
        end
    end
end

return specialEvents
