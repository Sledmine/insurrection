local releaseVersion = "2.6.3"
local metadata = "5ff187b." .. os.date("%Y%m%d")
local version = releaseVersion
if DebugMode then
    return releaseVersion .. "-dev+" .. metadata
end
return version
