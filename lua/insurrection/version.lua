local metadata = "cfcf541.20230130"
local releaseVersion = "2.4.0"
local version = releaseVersion
if DebugMode then
    return releaseVersion .. "-dev+" .. metadata
end
return version
