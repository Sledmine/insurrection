local releaseVersion = "2.6.0"
local metadata = "54b193d.20230713"
local version = releaseVersion
if DebugMode then
    return releaseVersion .. "-dev+" .. metadata
end
return version
