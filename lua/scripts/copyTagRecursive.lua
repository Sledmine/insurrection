local fs = require "fs"
local path = require "path"
local glue = require "glue"
local inspect = require "inspect"

local sourceProject = arg[1]
local tagPath = arg[2]
local outputProject = arg[3]

local gamePath = os.getenv("HALO_CE_PATH")
local projectPath = ([[/storage/developing/halo-ce/%s]]):format(sourceProject)
local outputProjectPath = ([[/storage/developing/halo-ce/%s]]):format(outputProject)
local invaderRunner =
    ([[sudo docker run -it -v %s/data:/invader/data -v %s/tags:/invader/tags -v "%s/maps":/invader/maps invader-docker ]]):format(
        projectPath, projectPath, gamePath)
local dependencyCmd = invaderRunner .. [[invader-dependency -r "%s"]]
local pipe = io.popen(dependencyCmd:format(tagPath), "r")
local read = glue.string.trim(pipe:read("a*")):gsub("\r", "")
local files = glue.string.split(read, "\n")
glue.shift(files, 1, 1)
files[1] = tagPath
for _, file in pairs(files) do
    local sourcePath = projectPath .. "/tags/" .. file
    local outputPath = outputProjectPath .. "/tags/" .. file
    if (not fs.is(outputPath)) then
        local outputFolderPath = path.dir(outputPath)
        if (not fs.is(outputFolderPath)) then
            fs.mkdir(outputFolderPath, true)
        end
        print(([[cp "%s" "%s"]]):format(sourcePath, outputPath))
        os.execute(([[cp "%s" "%s"]]):format(sourcePath, outputPath))
    end
end
