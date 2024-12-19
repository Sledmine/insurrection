local constants = require "insurrection.constants"
local engine = Engine
local balltze = Balltze

local specialEvents = {}

local christmasHats = {}

local isDecember = function()
    local date = os.date("*t")
    --return date.month == 12 and date.day >= 24 and date.day <= 26
    return date.month == 12
end

function specialEvents.onTick()
    if engine.map.getCurrentMapHeader().name == "ui" then
        return
    end
    if not isDecember() then
        return
    end
    for playerIndex = 0, constants.limits.maximumPlayers do
        local player = engine.gameState.getPlayer(playerIndex)
        if player then
            local biped = engine.gameState.getObject(player.objectHandle.value,
                                                     engine.tag.objectType.biped)
            if biped then
                if not christmasHats[playerIndex] then
                    local hatHandle = engine.gameState.createObject(
                                          constants.scenery.christmasHat.id, nil, {
                            x = biped.position.x,
                            y = biped.position.y,
                            z = biped.position.z + 1
                        })
                    christmasHats[playerIndex] = hatHandle
                    engine.gameState.objectAttachToMarker(player.objectHandle.value, "head",
                                                          hatHandle, "")
                end
                if christmasHats[playerIndex] then
                    local hat = engine.gameState.getObject(christmasHats[playerIndex],
                                                           engine.tag.objectType.scenery)
                    if not hat then
                        christmasHats[playerIndex] = nil
                    end
                    if hat and hat.parentObject.value ~= player.objectHandle.value then
                        christmasHats[playerIndex] = nil
                    end
                end
            end
        end
    end
end

return specialEvents
