local releaseVersion = "2.6.1"
local metadata = "b71c3f8." .. os.date("%Y%m%d")
local version = releaseVersion
if DebugMode then
    return releaseVersion .. "-dev+" .. metadata
end
return version
