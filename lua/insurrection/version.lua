local releaseVersion = "2.6.1"
local metadata = "a5a914d." .. os.date("%Y%m%d")
local version = releaseVersion
if DebugMode then
    return releaseVersion .. "-dev+" .. metadata
end
return version
