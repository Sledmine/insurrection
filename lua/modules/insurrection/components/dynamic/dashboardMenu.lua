local components = require "insurrection.components"
local constants = require "insurrection.constants"
local button = require "insurrection.components.button"
local input = require "insurrection.components.input"
local interface = require "insurrection.interface"
local menus = require "insurrection.menus"
local ranks = require "insurrection.constants.ranks"

return function()
    local dashboard = components.new(constants.widgets.dashboard.id)

    local browseLobby =
        button.new(dashboard:findChildWidgetTag("browse_prompt_dashboard_button").id)
    browseLobby:onClick(function()
        menus.lobbies()
    end)

    local createLobbyButton = button.new(dashboard:findChildWidgetTag(
                                             "create_prompt_dashboard_button").id)
    createLobbyButton:onClick(function()
        api.lobby()
    end)

    local customizationButton = button.new(dashboard:findChildWidgetTag(
                                               "customization_prompt_dashboard_button").id)
    customizationButton:onClick(function()
        interface.fade("in", 60)
        menus.customization()
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

    dashboard:onOpen(function()
        execute_script("set_ui_background")
        api.stopRefreshLobby()
        discord.clearParty()
        discord.setState("Playing Insurrection", "In the dashboard")

        if api.session and api.session.player then
            local classificationName = ranks[1].classification
            local rankName = ranks[1].ranks[1].name
            local rankGrade = ranks[1].ranks[1].grade
            local expNumberToNextRank = ranks[1].ranks[1].experience
            local currentRankIndex = 0

            for i, rank in ipairs(ranks) do
                for j, rankData in ipairs(rank.ranks) do
                    currentRankIndex = currentRankIndex + 1
                    if api.session.player.rank == currentRankIndex then
                        classificationName = rank.classification
                        rankName = rankData.name
                        rankGrade = rankData.grade
                        expNumberToNextRank = rankData.experience

                        -- TODO Move this to another function so it does not depend on break
                        rankNameLabel:setText(rankName:upper())
                        rankTierLabel:setText(
                            (classificationName .. ", GRADE " .. rankGrade):upper())
                        -- TODO Check for next rank and substract current exp from next rank exp
                        expLabel:setText(expNumberToNextRank .. " XP TO NEXT RANK")
                        logger:warning("Current rank index: " .. currentRankIndex)
                        rankIcon:setBitmapIndex(currentRankIndex)
                        creditsLabel:setText("000 CR")
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
