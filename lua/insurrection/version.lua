local releaseVersion = "2.5.0"
local metadata = "fef8acc.20230616"
local version = releaseVersion
if DebugMode then
    return releaseVersion .. "-dev+" .. metadata
end
return version
