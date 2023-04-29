local releaseVersion = "2.4.3"
local metadata = "3a7cb3d.20230429"
local version = releaseVersion
if DebugMode then
    return releaseVersion .. "-dev+" .. metadata
end
return version
