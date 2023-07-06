local releaseVersion = "2.5.2"
local metadata = "4ca2989.20230705"
local version = releaseVersion
if DebugMode then
    return releaseVersion .. "-dev+" .. metadata
end
return version
