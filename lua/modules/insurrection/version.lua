local releaseVersion = "2.7.1"
local metadata = "e3bbee9." .. os.date("%Y%m%d")
local version = releaseVersion
if DebugMode then
    return releaseVersion .. "-dev+" .. metadata
end
return version
