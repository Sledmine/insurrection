local releaseVersion = "2.9.0"
local metadata = "79a0176." .. os.date("%Y%m%d")
local version = releaseVersion
if DebugMode then
    return releaseVersion .. "-dev+" .. metadata
end
return version
