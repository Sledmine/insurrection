local luna = require "luna"
local getMyGamesHaloCEPath = require"insurrection.core".getMyGamesHaloCEPath
local json = require "json"

local balltze = {}

local configPath = "\\balltze\\config\\settings.json"
local installPath = "mods\\balltze.dll"

---@class balltzeConfiguration
---@field gamepad string
---@field loading_screen {enable: boolean}
---@field preload_map_textures {enable: boolean, min_map_size: number}

---Get balltze configuration
---@return balltzeConfiguration?
function balltze.getConfiguration()
    local configJson = luna.file.read(getMyGamesHaloCEPath() .. configPath)
    if configJson then
        ---@type balltzeConfiguration
        local configuration = json.decode(configJson)
        return configuration
    end
end

---Get balltze gamepad profiles
---@return string[]
function balltze.getGamepadProfiles()
    ---@type string[]
    --return list_directory(getMyGamesHaloCEPath() .. "\\balltze\\gamepad")
    --return {"Xbox 360 Windows","Dual Shock 1 Windows"}
    return {"xbox_360_windows","dual_shock_1_windows"}
end

---Save balltze configuration
---@param configuration balltzeConfiguration
function balltze.saveConfiguration(configuration)
    local configJson = json.encode(configuration)
    return luna.file.write(getMyGamesHaloCEPath() .. configPath, configJson)
end

---Check if balltze is installed
---@return boolean
function balltze.isInstalled()
    return luna.file.read(installPath) ~= nil
end

return balltze
