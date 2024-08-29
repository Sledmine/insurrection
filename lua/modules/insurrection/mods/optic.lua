local luna = require "luna"
local getMyGamesHaloCEPath = require"insurrection.core".getMyGamesHaloCEPath
local json = require "json"

local optic = {}

local configPath = "\\chimera\\lua\\data\\global\\optic\\optic.json"
local installPath = "\\chimera\\lua\\scripts\\global\\optic.lua"

---@class opticConfiguration
---@field enableSound boolean
---@field hitmarker boolean
---@field hudMessages boolean
---@field volume number

---Get optic configuration
---@return opticConfiguration?
function optic.getConfiguration()
    local configJson = luna.file.read(getMyGamesHaloCEPath() .. configPath)
    if configJson then
        ---@type opticConfiguration
        local configuration = json.decode(configJson)
        return configuration
    end
end

---Save optic configuration
---@param configuration opticConfiguration
function optic.saveConfiguration(configuration)
    local configJson = json.encode(configuration)
    return luna.file.write(getMyGamesHaloCEPath() .. configPath, configJson)
end

---Check if optic is installed
---@return boolean
function optic.isInstalled()
    return luna.file.read(getMyGamesHaloCEPath() .. installPath) ~= nil
end

return optic
