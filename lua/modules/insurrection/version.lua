local releaseVersion = "2.8.1"
local metadata = "5f1165a." .. os.date("%Y%m%d")
local version = releaseVersion
if DebugMode then
    return releaseVersion .. "-dev+" .. metadata
end
return version
