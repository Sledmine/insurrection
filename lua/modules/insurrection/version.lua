local releaseVersion = "2.9.1"
local metadata = "3c308d9." .. os.date("%Y%m%d")
local version = releaseVersion
if DebugMode then
    return releaseVersion .. "-dev+" .. metadata
end
return version
