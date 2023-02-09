local releaseVersion = "2.4.1"
local metadata = "ae54f4a.20230209"
local version = releaseVersion
if DebugMode then
    return releaseVersion .. "-dev+" .. metadata
end
return version
