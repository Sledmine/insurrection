local releaseVersion = "2.6.2"
local metadata = "f08c23a." .. os.date("%Y%m%d")
local version = releaseVersion
if DebugMode then
    return releaseVersion .. "-dev+" .. metadata
end
return version
