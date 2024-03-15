local releaseVersion = "2.6.3"
local metadata = "46a4206." .. os.date("%Y%m%d")
local version = releaseVersion
if DebugMode then
    return releaseVersion .. "-dev+" .. metadata
end
return version
