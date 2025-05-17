local releaseVersion = "2.9.0"
local metadata = "e9098ad." .. os.date("%Y%m%d")
local version = releaseVersion
if DebugMode then
    return releaseVersion .. "-dev+" .. metadata
end
return version
