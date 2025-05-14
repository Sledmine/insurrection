local luna = require "lua.modules.luna"
local inspect = require "lua.modules.inspect"

local ranks = luna.file.read("ranks.txt")
assert(ranks, "Failed to read file")

local lines = luna.string.split(ranks, "\n")

local playerRankings = {}

local rankClassification

local romanNumerals = {
    [1] = "I",
    [2] = "II",
    [3] = "III",
    [4] = "IV",
    [5] = "V",
    [6] = "VI",
    [7] = "VII",
    [8] = "VIII",
    [9] = "IX",
    [10] = "X"
}

for _, line in ipairs(lines) do
    local line = line:trim()
    if line ~= "" then
        if line:includes("Ranks") then
            rankClassification = line:match("(.+) Ranks")
            local rank = table.find(playerRankings, function (v, k)
                return v.classification == rankClassification
            end)
            if not rank then
                table.insert(playerRankings, {
                    classification = rankClassification,
                    ranks = {}
                })
            end

        elseif rankClassification then
            -- Staff Sergeant Bronze (Tier 1)	24,100 XP
            local rankName, rankGrade, rankExperience = line:match("(.+) %((.+)%)%s+(.+)")
            rankGrade = tonumber(rankGrade:split(" ")[2])
            -- Convert rank tier to roman numeral
            local romanNumeral = romanNumerals[rankGrade]
            local rankExperience = tonumber(rankExperience:split(" ")[1]:replace(",", ""))

            --print(rankName, rankTier, rankExperience)
            local ranks = table.find(playerRankings, function (v, k)
                return v.classification == rankClassification
            end).ranks
            table.insert(ranks, {
                name = rankName,
                grade = romanNumeral,
                experience = rankExperience
            })
        end
    end
end

print(inspect(playerRankings))