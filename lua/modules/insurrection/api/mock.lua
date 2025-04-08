local mock = {}

mock.response = {}

mock.response.login = {
    code = 200,
    json = function()
        return {
            secondsToExpire = 720,
            token = "example_token",
            player = {
                publicId = "acf639a354178dc808",
                rank = 0,
                isAdmin = true,
                color = {secondary = "#323232", primary = "#0051a7"},
                name = "Sledmine",
                bipeds = {
                    coop_evolved = "[shm]\\halo_1\\characters\\elite\\elite_mp+0+0+2+1+2+1+0+0+0",
                    the_flood_mp = "keymind\\the_flood\\characters\\unsc\\gridharvolur\\gridharvolur_mk_ii_[b]_mp+1+9+17+0+3+9+0+4+15"
                },
                nameplate = "080_static_chiefweapona"
            },
            message = "Succesfully logged in"
        }
    end
}

local players = {
    {
        publicId = "e2d058cbe4b7148b97f",
        rank = 0,
        isAdmin = false,
        color = {primary = "#f7bd44", secondary = "#8b3900"},
        name = "Spartan 117",
        bipeds = {},
        nameplate = "059_animated_odstrain"
    },
    {
        publicId = "e78e219850d555e5c0",
        rank = 0,
        isAdmin = false,
        color = {primary = "#b50000", secondary = "#321861"},
        name = "Cortana",
        bipeds = {},
        nameplate = "126_animated_halolegendsbubble"
    }
}

mock.response.lobbies = {
    code = 200,
    json = function()
        return {
            {
                players = players,
                template = "stock",
                key = "jOo8aDAPpmOhzyKM",
                gametype = "assault",
                owner = "e2d058cbe4b7148b97f",
                map = "beavercreek"
            },
            {
                players = players,
                template = "stock",
                key = "kLz9bXQWqnPjvyNO",
                gametype = "campaign",
                owner = "e78e219850d555e5c0",
                map = "a10_coop_evolved"
            },
            {
                players = players,
                template = "stock",
                key = "mNp0cYRXroQkxzLP",
                gametype = "slayer",
                owner = "e2d058cbe4b7148b97f",
                map = "bloodgulch"
            },
            {
                players = players,
                template = "stock",
                key = "oQr1dZSYspRlwyMQ",
                gametype = "ctf",
                owner = "e78e219850d555e5c0",
                map = "dangercanyon"
            },
            {
                players = players,
                template = "stock",
                key = "pSt2eATZuqSmxzNR",
                gametype = "oddball",
                owner = "e2d058cbe4b7148b97f",
                map = "icefields"
            },
            {
                players = players,
                template = "stock",
                key = "qUv3fBUWvrTnyzOS",
                gametype = "coop",
                owner = "e78e219850d555e5c0",
                map = "b30_coop_evolved"
            },
            {
                players = players,
                template = "stock",
                key = "rWz4gCVXwsUozwPT",
                gametype = "assault",
                owner = "e2d058cbe4b7148b97f",
                map = "deathisland"
            },
            {
                players = players,
                template = "stock",
                key = "sXy5hDWYxtPpazQU",
                gametype = "slayer",
                owner = "e78e219850d555e5c0",
                map = "timberland"
            },
            {
                players = players,
                template = "stock",
                key = "tYz6iEXZyuQqbwRV",
                gametype = "ctf",
                owner = "e2d058cbe4b7148b97f",
                map = "gephyrophobia"
            },
            {
                players = players,
                template = "stock",
                key = "uZz7jFYZzvRrdySW",
                gametype = "oddball",
                owner = "e78e219850d555e5c0",
                map = "infinity"
            },
            {
                players = players,
                template = "stock",
                key = "vAa8kGZAzxSsfeTX",
                gametype = "coop",
                owner = "e2d058cbe4b7148b97f",
                map = "a50_coop_evolved"
            }
        }
    end
}

local customization = {}
for mapName, data in pairs(constants.customBipedPaths) do
    customization[mapName] = {
        maps = {mapName},
        tags = table.map(data, function(tagPath)
            return tagPath .. ".biped"
        end)
    }
end

mock.response.available = {
    code = 200,
    json = function()
        return {
            maps = {"bloodgulch", "beavercreek", "dangercanyon", "deathisland", "icefields"},
            gametypes = {"slayer", "ctf", "oddball"},
            templates = {"default"},
            customization = customization
        }
    end
}

return mock
