local releaseVersion = "2.6.4"
local metadata = "e39f171." .. os.date("%Y%m%d")
local version = releaseVersion
if DebugMode then
    return releaseVersion .. "-dev+" .. metadata
end
return version
