local releaseVersion = "2.6.0"
local metadata = "02bc2cf.".. os.date(%Y%m%d)
local version = releaseVersion
if DebugMode then
    return releaseVersion .. "-dev+" .. metadata
end
return version
