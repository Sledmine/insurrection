local components = require "insurrection.components"
local constants = require "insurrection.constants"
local button = require "insurrection.components.button"
local input = require "insurrection.components.input"
local interface = require "insurrection.interface"
local menus = require "insurrection.menus"
local ranks = require "insurrection.constants.ranks"
local bar = require "insurrection.components.bar"
local core = require "insurrection.core"
local blam = require "blam"
local engine = Engine
local executeScript = engine.hsc.executeScript

return function()
    local dashboard = components.new(constants.widgets.dashboard.id)
    local footer = components.new(dashboard:findChildWidgetTag("footer").id)
    local description = components.new(footer:findChildWidgetTag("text").id)
    local rankProgressBar = bar.new(dashboard:findChildWidgetTag("rank_progress").id, "progress")

    local browseLobby =
        button.new(dashboard:findChildWidgetTag("browse_prompt_dashboard_button").id)
    browseLobby:onClick(function()
        interface.blur(true)
        interface.setBackground("halo")
        menus.lobbies()
    end)
    browseLobby:onFocus(function()
        description:setText("Browse and join lobbies created by other players.")
    end)

    local createLobbyButton = button.new(dashboard:findChildWidgetTag(
                                             "create_prompt_dashboard_button").id)
    createLobbyButton:onClick(function()
        api.lobby()
        interface.blur(true)
        interface.setBackground("halo")
    end)
    createLobbyButton:onFocus(function()
        description:setText("Create a new lobby and invite your friends to play.")
    end)

    local customizationButton = button.new(dashboard:findChildWidgetTag(
                                               "customization_prompt_dashboard_button").id)
    customizationButton:onClick(function()
        menus.customization()
    end)
    customizationButton:onFocus(function()
        description:setText("Customize your character and player service record.")
    end)

    local rankNameLabel = components.new(dashboard:findChildWidgetTag("rank_name_label").id)
    local rankTierLabel = components.new(dashboard:findChildWidgetTag("tier_name_label").id)
    local expLabel = components.new(dashboard:findChildWidgetTag("exp_info_label").id)
    local rankIcon = components.new(dashboard:findChildWidgetTag("rank_icon").id)
    local creditsLabel = components.new(dashboard:findChildWidgetTag("credits_number").id)

    -- local joinLobbyButton = button.new(dashboard:findChildWidgetTag("join_lobby_button").id)
    -- local joinLobbyInput = input.new(dashboard:findChildWidgetTag("lobby_key_input").id)
    -- joinLobbyButton:onClick(function()
    --    local lobbyKey = joinLobbyInput:getText()
    --    if lobbyKey ~= "" then
    --        api.lobby(lobbyKey)
    --    else
    --        interface.dialog("WARNING", "", "Please specify a lobby key to join.")
    --    end
    -- end)

    dashboard:onOpen(function(previousWidgetTag)
        rankNameLabel:setText("NO RANK (Coming soon!)")
        rankTierLabel:setText("NO TIER")
        expLabel:setText("0 XP TO NEXT RANK")
        rankIcon:setBitmapIndex(0)
        creditsLabel:setText("0 CR")
        rankProgressBar:setValue(0.01)

        core.loadCustomizationBiped()
        core.rotateCustomizationBiped(constants.customization.rotation.dashboard)
        interface.blur(false)
        interface.bsp(1)
        local cameraTicks = 0
        if previousWidgetTag and previousWidgetTag.handle.value ==
            constants.widgets.customization.id then
            cameraTicks = 30
        else
            interface.fade("in", 30)
        end
        executeScript "object_create_containing prop"
        interface.camera("customization_color", cameraTicks)

        api.stopRefreshLobby()
        discord.clearParty()
        discord.setState("Playing Insurrection", "In the dashboard")

        --- TODO Remove false when player progression system is implemented
        if api.session and api.session.player and false then
            local classificationName = ranks[1].classification
            local rankName = ranks[1].ranks[1].name
            local rankGrade = ranks[1].ranks[1].grade
            local expToNextRank = ranks[1].ranks[1].experience
            local currentRankIndex = 0

            local flattenRanks = {}
            for _, rank in ipairs(ranks) do
                for _, rankData in ipairs(rank.ranks) do
                    table.insert(flattenRanks, rankData)
                end
            end
            logger:debug("Flatten ranks: " .. #flattenRanks)

            for _, rank in ipairs(ranks) do
                for _, rankData in ipairs(rank.ranks) do
                    currentRankIndex = currentRankIndex + 1
                    if api.session.player.rank == currentRankIndex then
                        classificationName = rank.classification
                        rankName = rankData.name
                        rankGrade = rankData.grade
                        local nextRank = flattenRanks[currentRankIndex + 1] or
                                             flattenRanks[#flattenRanks]
                        -- TODO This should be the player's current experience (api.session.player.exp)
                        local currentExp = math.random(rankData.experience, nextRank.experience)
                        expToNextRank = nextRank.experience - currentExp

                        local rankTierText = classificationName .. ", GRADE " .. rankGrade
                        rankNameLabel:setText(rankName:upper())
                        rankTierLabel:setText(rankTierText:upper())
                        expLabel:setText(expToNextRank .. " XP TO NEXT RANK")

                        local expDiff = nextRank.experience - rankData.experience
                        logger:debug("Current exp: " .. currentExp)
                        logger:debug("Next rank exp: " .. nextRank.experience)
                        local progressValue = 1 - (nextRank.experience - currentExp) / expDiff
                        logger:debug("Progress value: " .. progressValue)
                        rankProgressBar:setValue(progressValue)

                        logger:debug("Current rank index: " .. currentRankIndex)
                        rankIcon:setBitmapIndex(currentRankIndex)
                        creditsLabel:setText(math.random(0, 1000) .. " CR")

                        -- TODO Move this to another function so it does not depend on break
                        break
                    end
                end
            end
        end
    end)
    dashboard:onClose(function()
        api.stopRefreshLobby()
        discord.clearPresence()
    end)
end
