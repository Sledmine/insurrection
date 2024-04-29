local releaseVersion = "2.6.5"
local metadata = "9fa5f85." .. os.date("%Y%m%d")
local version = releaseVersion
if DebugMode then
    return releaseVersion .. "-dev+" .. metadata
end
return version
