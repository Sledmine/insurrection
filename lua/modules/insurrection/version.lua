local releaseVersion = "3.0.0"
local metadata = "1b86dd7." .. os.date("%Y%m%d")
local version = releaseVersion
if DebugMode then
    return releaseVersion .. "-dev+" .. metadata
end
return version
