local releaseVersion = "main"
local metadata = "1a5581c.20230403"
local version = releaseVersion
if DebugMode then
    return releaseVersion .. "-dev+" .. metadata
end
return version
