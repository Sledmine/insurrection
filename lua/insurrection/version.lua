local releaseVersion = "2.4.2"
local metadata = "29b15b1.20230428"
local version = releaseVersion
if DebugMode then
    return releaseVersion .. "-dev+" .. metadata
end
return version
