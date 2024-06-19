local releaseVersion = "2.7.0"
local metadata = "b9a629c." .. os.date("%Y%m%d")
local version = releaseVersion
if DebugMode then
    return releaseVersion .. "-dev+" .. metadata
end
return version
