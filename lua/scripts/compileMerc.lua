local projectVersion = require "lua.insurrection.version"

-- Create distribution script
os.execute("mercury luabundle")

-- Get Halo Custom Edition path
local haloPath = os.getenv("HALO_CE_PATH")

-- Remove previous merc file
os.execute(("rm dist/insurrection-%s.merc"):format(projectVersion))

-- Copy dev map into dist and pack merc file
os.execute(("cp \"%s/maps/ui.map\" dist/maps"):format(haloPath))
os.execute(("cd dist/ & zip -r insurrection-%s.merc ."):format(projectVersion))