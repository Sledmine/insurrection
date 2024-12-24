local releaseVersion = "2.8.0"
local metadata = "a84001f." .. os.date("%Y%m%d")
local version = releaseVersion
if DebugMode then
    return releaseVersion .. "-dev+" .. metadata
end
return version
