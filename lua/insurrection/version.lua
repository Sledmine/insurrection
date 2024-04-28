local releaseVersion = "2.6.5"
local metadata = "20d2c46." .. os.date("%Y%m%d")
local version = releaseVersion
if DebugMode then
    return releaseVersion .. "-dev+" .. metadata
end
return version
