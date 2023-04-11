local releaseVersion = "2.5.0"
local metadata = "92b9004.20230410"
local version = releaseVersion
if DebugMode then
    return releaseVersion .. "-dev+" .. metadata
end
return version
