package.preload["luna"] = nil
package.loaded["luna"] = nil
local luna = require "luna"
inspect = require "inspect"
local component = require "ui.component"
local specialEvents = require "insurrection.specialEvents"
local balltze = Balltze
local engine = Engine
logger = balltze.logger
local chimera = require "insurrection.mods.chimera"
local interface = require "insurrection.interface"
local protothread = require "async"
protothread.onError = function(threadError)
    -- Balltze v2 logger is global and function-based; no : call pattern remains.
    interface.loading(false)
    error(threadError)
end
async = protothread.async
local dispatch = protothread.dispatch
require"async".configure("base, table, package, string")
execute_script = engine.script.execute
local script = require "script"
local actions = require "insurrection.redux.actions"
local react = require "insurrection.react"
local originalReadFile = balltze.filesystem.readFile
Balltze.filesystem.readFile = function(path)
    -- Prevent Balltze from crashing until fixed
    if balltze.filesystem.fileExists(path) then
        return originalReadFile(path)
    end
    logger.debug("File not found: " .. path)
    return nil
end

DebugMode = false
APILocalMode = false
IsAPIMockEnabled = false
IsDebugCustomization = false
IsDebugLocalCustomizationEnabled = true
constants = require "insurrection.constants"
api = require "insurrection.api"
discord = require "insurrection.discord"
store = require "insurrection.redux.store"

-- Multithread lanes
Lanes = {}

local customExternalTags = {
    {constants.path.nameplateCollection, "tag_collection"},
    {constants.path.pauseMenu, "ui_widget_definition"},
    {constants.path.dialog, "ui_widget_definition"},
    {constants.path.customSounds, "tag_collection"},
    {constants.path.christmasHat, "scenery"},
    {constants.path.xmasObjects, "tag_collection"}
}

local function initialize()
    logger.debug("Initializing Insurrection...")
    api.loadUrl()
    -- We might not want to reset the store on every map load
    -- Helps to preserve data after game lobby changes
    -- store:dispatch(actions.reset())
    react.unmountAll()
    component.free()
    constants.get()
    interface.load()
    interface.setup()
end

local commands = {
    debug = {
        description = "Enable Insurrection debug mode",
        help = "<boolean>",
        minArgs = 1,
        maxArgs = 1,
        execute = function(isEnabled)
            DebugMode = luna.bool(isEnabled)
            engine.terminal.print("Debug mode: " .. tostring(DebugMode))
        end
    },
    debug_customization = {
        description = "Enable Insurrection customization debug mode",
        execute = function()
            IsDebugCustomization = true
            interface.blur(false)
            interface.close(true)
            -- execute_script("set_customization_background 1")
            -- execute_script("object_create customization_biped")
        end
    }
}

local onMapLoadEvent
local onTickEvent

local function importCustomizableBipeds()
    for mapName, bipeds in pairs(constants.customBipedPaths) do
        for _, bipedPath in pairs(bipeds) do
            local result, message = pcall(engine.tag.importTag, mapName, bipedPath, "biped")
            if not result then
                logger.debug("Failed to import customizable biped {} from map {}", bipedPath,
                             mapName)
            end
            logger.debug("Imported tag: {}", bipedPath)
        end
    end
end

function PluginOnGameStart()
    --importCustomizableBipeds()

    -- if not onMapLoadEvent then
    --    onMapLoadEvent = balltze.addEventListener("map_load", function(event)
    --        isNewMap = true
    --        if event and event:getMapName() == "ui" then
    --            logger.debug("Importing external customizable bipeds...")
    --            importCustomizableBipeds()
    --        else
    --            -- Balltze v2 no longer exposes clearTagImports(); this legacy cleanup path has no
    --            -- direct replacement.
    --        end
    --    end, "lowest")
    -- end

    local lastLoadedMap

    if not onTickEvent then
        onTickEvent = balltze.addEventListener("tick", function()
            local mapHeader = engine.cacheFile.getLoadedCacheFileHeader()
            local currentMap = mapHeader and mapHeader.scenarioName or ""
            if lastLoadedMap ~= currentMap then
                lastLoadedMap = currentMap
                logger.debug("New map loaded, reinitializing data...")
                initialize()
                specialEvents.onPostMapLoad()
            end
            interface.onTick()
            specialEvents.onTick()
            script.poll()
            if lastLoadedMap == "ui" then
                local success, message = pcall(dispatch)
                if not success then
                    logger.error(tostring(message))
                end
            end
        end)
    end

    for command, data in pairs(commands) do
        -- logger.debug("Registering command \"{}\" with help \"{}\"", command, data.help)
        balltze.registerCommand(command, data.description, data.help, data.save or false,
                                data.minArgs or 0, data.maxArgs or 0, true, true, function(args)
            -- Balltze.logger.debug("{}", inspect(args))
            if (args and data.minArgs and data.maxArgs) and (#args < data.minArgs) or
                (#args > data.maxArgs) then
                balltze.logger.error("Invalid number of arguments. Usage: {}, Example: {}",
                                     data.help, data.example)
                return true
            end
            -- data.func(table.unpack(args or {}))
            local ok, message = pcall(data.func, table.unpack(args or {}))
            if not ok then
                balltze.logger.error("Error executing command \"{}\": {}", command, message)
            end
            return true
        end)
    end
    balltze.loadSettings()

    component.callbacks()

    return true
end

function PluginUnload()
end
