local releaseVersion = "2.6.0"
local metadata = "7eb1e9a." .. os.date("%Y%m%d")
local version = releaseVersion
if DebugMode then
    return releaseVersion .. "-dev+" .. metadata
end
return version
