------------------------------------------------------------------------------
-- Mercury Communication
-- Gelatinoso, Sledmine
-- Module to communicate with Mercury available on the host system
------------------------------------------------------------------------------
local json = require "json"
local inspect = require "inspect"

local mercury = {}

---@class packageMetadata
---@field name string
---@field label string
---@field author string
---@field version string
---@field internalVersion string
---@field category string
---@field conflicts string[]
---@field mirrors string[]
---@field nextVersion string

---@class mercDependencies
---@field label string
---@field version string

---@class mercFiles
---@field path string
---@field type string
---@field outputPath string

---@class mercUpdates
---@field path string
---@field diffPath string
---@field type string
---@field outputPath string

---@class packageMercury
---@field name string
---@field label string
---@field description string
---@field author string
---@field version string
---@field targetVersion string
---@field internalVersion string
---@field manifestVersion string
---@field files mercFiles[]
---@field updates mercUpdates[]
---@field dependencies mercDependencies[]

--- Get an array of installed Mercury packages
---@return packageMercury[] | nil
function mercury.getInstalled()
    local installedPackages
    local pipe = io.popen("mercury list -j", "r")
    if (pipe) then
        local output = pipe:read("*all")
        console_out(output)
        pipe:close()
        if (output and output ~= "" and not output:find("Warning,")) then
            installedPackages = json.decode(output)
            return installedPackages
        end
    end
end

-- Fetch the latest package index available on the repository
---@return packageMetadata[]
function mercury.fetchPackages()
    -- Get the package index output on json format
    local pipe = io.popen("mercury fetch -j")
    if (pipe) then
        local output = pipe:read("*all")
        pipe:close()
        print(inspect(output))
        if (output and output ~= "" and not output:find("Error,")) then
            local fetchedPackages = json.decode(output)
            return fetchedPackages
        end
    end
    return {}
end

-- Installs selected package
function mercury.installPackage(label)
    local pipe = io.popen("mercury install " .. label)
    if (pipe) then
        local response = pipe:read("*all")
        pipe:close()
        return response
    end
end

function mercury.removePackage(label)
    local result = os.execute("mercury remove " .. label)
    return result
end

return mercury
