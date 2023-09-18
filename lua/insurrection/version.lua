local releaseVersion = "2.6.0"
local metadata = "ddb219b.20230918"
local version = releaseVersion
if DebugMode then
    return releaseVersion .. "-dev+" .. metadata
end
return version
