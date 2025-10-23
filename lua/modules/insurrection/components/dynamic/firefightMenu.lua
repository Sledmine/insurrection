local constants = require "insurrection.constants"
local component = require "insurrection.components"
local button = require "insurrection.components.button"
local list = require "insurrection.components.list"
local bar = require "insurrection.components.bar"
local input = require "insurrection.components.input"
local spinner = require "insurrection.components.spinner"
local core = require "insurrection.core"
local blam = require "blam"
local checkbox = require "insurrection.components.checkbox"
local firefight = require "insurrection.constants.projects.firefight"
local firefightMaps = table.extend(firefight.maps.multiplayer, firefight.maps.singleplayer)
local t = require"insurrection.utils".snakeCaseToTitleCase
local executeScript = Engine.hsc.executeScript
local engine = Engine
local luna = require "luna"
local tobool = luna.bool
local findTag = blam.findTag
local tagClasses = blam.tagClasses

local function disableCheats(cheats)
    for _, cheat in pairs(cheats) do
        executeScript("cheat_" .. cheat .. " false")
    end
end

local skullsIcons = {
    "assassin",
    "bandana",
    "banger",
    "berserk",
    "blind",
    "catch",
    "cowbell",
    "doubledown",
    "eyepatch",
    "famine",
    "fog",
    "gruntbirthday",
    "havok",
    "knucklehead",
    "mythic",
    "newton",
    "slayer",
    "tilt",
    "toughluck",
    "triggerswitch"
}

local function getBitmapIndexForSkull(skullName)
    return (table.indexof(skullsIcons, skullName) or #skullsIcons)
end

return function()
    local firefightMenu = component.new(constants.widgets.firefight.id)
    local options = component.new(firefightMenu:get("options"))
    local mapsList = list.new(options:get("firefight_maps"))
    local mapsListScroll = bar.new(firefightMenu:get("maps_scroll"))
    mapsList:setScrollBar(mapsListScroll)
    local mapPreview = component.new(firefightMenu:get("preview"))
    component.new(mapPreview:get("overlay_scanner")):setAnimated(true, true, 2.3, 1)
    local mapName = component.new(firefightMenu:get("map_name"))
    local mapAuthor = component.new(firefightMenu:get("map_author"))
    local mapDescription = component.new(firefightMenu:get("map_description"))

    local definitions = component.new(options:get("definitions"))
    local footer = component.new(firefightMenu:get("footer"))
    local description = component.new(footer:get("text"))
    local searchLabel = component.new(firefightMenu:get("search_label"))
    local search = input.new(options:get("search"))
    search:setAllowEmptyCharacters(false)

    local mapButton = button.new(definitions:get("definition_map"))
    local settingsButton = button.new(definitions:get("definition_options"))
    local skullsButton = button.new(definitions:get("definitions_skulls"))
    local difficultyButton = button.new(definitions:get("definitions_difficulty"))

    local play = button.new(options:get("play"))
    local back = button.new(options:get("back"))

    -- Firefight Panel
    local firefightSettingsPanel = component.new(findTag("firefight_settings_panel",
                                                         tagClasses.uiWidgetDefinition).id)
    local firefightSettingsList = component.new(firefightSettingsPanel:get("firefight_config"))

    -- Skulls Panel
    local skullsSettingsPanel = component.new(
                                    findTag("skulls_panel", tagClasses.uiWidgetDefinition).id)
    local skullPreviewIcon = component.new(skullsSettingsPanel:get("skull_preview_icon"))
    local skullName = component.new(skullsSettingsPanel:get("skull_name"))
    local skullMotto = component.new(skullsSettingsPanel:get("skull_motto"))
    local skullDescription = component.new(skullsSettingsPanel:get("skull_description"))
    local skullAllOptions = component.new(skullsSettingsPanel:get("skull_all_options"))
    local skullListScrollBar = bar.new(skullsSettingsPanel:get("skull_bar"), "scroll")
    local skullsListOptions = list.new(skullAllOptions:get("skull_grid"))
    skullsListOptions.scrollAmount = 5
    skullsListOptions:setScrollBar(skullListScrollBar)
    skullsListOptions:scrollable(false)

    -- Difficulty Panel
    local difficultySettingsPanel = component.new(blam.findTag("firefight_difficulty_panel",
                                                               blam.tagClasses.uiWidgetDefinition)
                                                      .id)
    local difficultyList = list.new(difficultySettingsPanel:get("difficulty_all_options"))
    difficultyList:scrollable(false)
    local difficultyFooter = component.new(difficultySettingsPanel:get("footer"))
    local difficultyDescription = component.new(difficultyFooter:get("text"))
    local difficultyLabel = component.new(difficultySettingsPanel:get("difficulty_name"))
    local difficultyImagePreview = component.new(difficultySettingsPanel:get(
                                                     "difficulty_preview_icon"))
    local difficultyIcons = blam.findTag("difficulty_icons", blam.tagClasses.bitmap)
    assert(difficultyIcons, "Difficulty icons bitmap not found")
    local legendaryIconImage = blam.findTag("difficulty_impossible_icon", blam.tagClasses.bitmap)
    assert(legendaryIconImage, "Legendary icon bitmap not found")

    local setMapBackgroundBitmap = function(mapName)
        mapPreview.widgetDefinition.backgroundBitmap = core.getMapBackgroundBitmap(mapName)
    end

    local currentDisplayedPanel = mapsList

    local function displayPanel(component)
        footer:hide()
        description:hide()
        if currentDisplayedPanel == component then
            logger:debug("Panel {} is already displayed", component.tag.path)
            return
        end
        logger:debug("Displaying panel: {}", component.tag.path)
        currentDisplayedPanel:replace(component.tag.id)
        currentDisplayedPanel = component
        component:show()
    end

    local function displayMapsPanel(isVisible)
        if isVisible then
            displayPanel(mapsList)
            mapsList:show()
            mapsListScroll:show()
            mapPreview:show()
            search:show()
            searchLabel:show()
            mapName:show()
            mapAuthor:show()
            mapDescription:show()
            footer:hide()
            description:hide()
            return
        end
        mapsList:hide()
        mapsListScroll:hide()
        mapPreview:hide()
        search:hide()
        searchLabel:hide()
        mapName:hide()
        mapAuthor:hide()
        mapDescription:hide()
    end

    local function setCurrentMapPreview(currentMapName)
        local mapData = table.find(firefightMaps, function(map)
            return map.name == currentMapName
        end)
        if mapData then
            setMapBackgroundBitmap(mapData.name)
            mapName:setText(mapData.title or t(mapData.name))
            local author = mapData.author or "Unknown"
            if #author > 41 then
                author = author:sub(1, 38) .. "..."
            end
            mapAuthor:setText(author)
            mapDescription:setText(mapData.description or "No description available")
        else
            mapPreview.widgetDefinition.backgroundBitmap = constants.bitmaps.unknownMapPreview.id
            mapName:setText("Map Name")
            mapAuthor:setText("Unknown")
            mapDescription:setText("No description available")
        end
    end

    local gameMapsList = engine.map.getMapList()
    local function loadMaps()
        firefightMaps = table.filter(firefightMaps, function(map)
            return table.find(gameMapsList, function(mapName)
                return mapName == map.name or mapName == (map.name .. "_dev")
            end) ~= nil
        end)
        table.sort(firefightMaps, function(a, b)
            return (a.title or t(a.name)) < (b.title or t(b.name))
        end)
        mapsList:setItems(table.map(firefightMaps, function(map)
            local mapData = table.find(firefightMaps, function(m)
                return m.name == map.name
            end)
            return {
                label = mapData and (mapData.title or t(map.name)) or t(map.name),
                value = map.name
            }
        end))
    end

    mapsList:onSelect(function(item)
        local mapName = item.value
        if DebugMode then
            mapName = mapName .. "_dev"
        end
        mapButton:setText(item.label --[[@as string]] )
        mapButton:setValue(item.value)
    end)

    mapsList:onFocus(function(item)
        local mapData = table.find(firefightMaps, function(map)
            return map.name == item.value
        end)
        if mapData then
            setCurrentMapPreview(mapData.name)
            return
        end
        setCurrentMapPreview("")
    end)

    mapButton:onClick(function()
        displayMapsPanel(true)
        loadMaps()
        play:show()
        back:show()
    end)

    settingsButton:onClick(function()
        displayMapsPanel(false)
        displayPanel(firefightSettingsPanel)
        footer:show()
        description:show()
        description:setText("Configure various settings for your Firefight game.")
        play:hide()
        back:hide()
    end)

    skullsButton:onClick(function()
        displayMapsPanel(false)
        displayPanel(skullsSettingsPanel)
        footer:show()
        description:show()
        description:setText(
            "Enable skulls to have them active from the start of your Firefight game and set custom configurations\nfor each one.")
        play:hide()
        back:hide()
    end)

    difficultyButton:onClick(function()
        displayMapsPanel(false)
        displayPanel(difficultySettingsPanel)
        play:hide()
        back:hide()
    end)

    local difficulties = {
        {
            name = "Easy",
            description = "Your foes cower and fall before your unstoppable onslaught, yet final victory will leave you\n wanting more.",
            value = "easy"
        },
        {
            name = "Normal",
            description = "Hordes of aliens vie to destroy you, but nerves of steel and a quick trigger\nfinger give you a solid chance to prevail.",
            value = "normal"
        },
        {
            name = "Heroic",
            description = "Your enemies are as numerous as they are ferocious; their attacks are devastating.\nSurvival is not guaranteed.",
            value = "hard"
        },
        {
            name = "Legendary",
            description = "You face opponents who have never known defeat, who laugh in alien tongues at your\nefforts to survive. This is suicide.",
            value = "impossible"
        }
    }

    local defaultDifficultyIndex = 2

    difficultySettingsPanel:onOpen(function(previousWidgetTag)
        local difficultyCheckboxes
        difficultyCheckboxes = table.map(difficultyList.widgetDefinition.childWidgets,
                                         function(child, index)
            local tag = blam.getTag(child.widgetTag)
            assert(tag)
            local buttonSquare = component.new(tag.id)
            local difficultyImage = component.new(buttonSquare:get("image"))
            -- Last bitmap is animated (impossible aka legendary)
            if index ~= #difficulties then
                difficultyImage:setAnimated(false)
                difficultyImage.widgetDefinition.backgroundBitmap = difficultyIcons.id
                difficultyImage:setBitmapIndex(index)
            else
                difficultyImage.widgetDefinition.backgroundBitmap = legendaryIconImage.id
                difficultyImage:animate()
            end
            local difficultyCheckbox = checkbox.new(buttonSquare:get("checkbox"))
            difficultyCheckbox:onToggle(function(isChecked)
                if isChecked then
                    for _, otherBox in pairs(difficultyCheckboxes) do
                        if otherBox ~= difficultyCheckbox then
                            otherBox:setValue(false)
                        end
                    end
                    difficultyButton:setText(difficulties[index].name)
                    difficultyButton:setValue(index - 1)
                    buttonSquare.events.onFocus()
                    return false
                end
            end)
            buttonSquare:onFocus(function()
                difficultyDescription:setText(difficulties[index].description)
                difficultyLabel:setText(difficulties[index].name:upper())
                if index == #difficulties then
                    difficultyImagePreview.widgetDefinition.backgroundBitmap = legendaryIconImage.id
                    difficultyImagePreview:animate()
                else
                    difficultyImagePreview:setAnimated(false)
                    difficultyImagePreview.widgetDefinition.backgroundBitmap = difficultyIcons.id
                    difficultyImagePreview:setBitmapIndex(index)
                end
            end)
            -- TODO Make component base to support "pass_handled_events_to_all_children" so it
            -- propagates the onFocus event to childs if widget is a component
            difficultyCheckbox.events.onFocus = buttonSquare.events.onFocus
            return difficultyCheckbox
        end)
        if not difficultyButton:getValue() then
            difficultyCheckboxes[defaultDifficultyIndex]:setValue(true)
        else
            difficultyCheckboxes[difficultyButton:getValue() + 1]:setValue(true)
        end
    end)

    firefightMenu:onOpen(function()
        loadMaps()
        displayMapsPanel(true)
        difficultyButton:setText(difficulties[defaultDifficultyIndex].name)
        difficultyButton:setValue(defaultDifficultyIndex - 1)
    end)

    local eventNames = {never = 1, eachWave = 2, eachRound = 3, eachSet = 4, eachBossWave = 5}
    local enemyTeams = {covenant = 1, flood = 2, random = 3}

    local settings = {
        _version = 1,
        playerInitialLives = 7,
        extraLivesGained = 1,
        livesLostPerDead = 1,
        -- Waves, Rounds, Sets and Game properties
        bossWaveFrequency = 0,
        wavesPerRound = 5,
        roundsPerSet = 3,
        setsPerGame = 3,
        waveLivingMin = 4,
        bossWaveLivingMin = 0,
        roundEndingBoss = true,
        -- Time properties
        waveCooldownSeconds = 9,
        roundCooldownSeconds = 10,
        setCooldownSeconds = 1,
        gameCooldownSeconds = 1,
        -- Game settings
        startingEnemyTeam = enemyTeams.covenant,
        permanentSkullsCanBeRandom = true,
        -- Event properties
        activateTemporalSkullEach = eventNames.eachRound,
        resetTemporalSkullEach = eventNames.eachSet,
        activatePermanentSkullEach = eventNames.eachSet,
        deployAlliesEach = eventNames.eachBossWave
    }
    -- By default, boss waves are the last wave of each round.
    settings.bossWaveFrequency = settings.wavesPerRound

    play:onFocus(function()
        local currentMapName = mapButton:getValue()
        if currentMapName and currentMapName ~= "" then
            logger:debug("Focusing play button with map: " .. currentMapName)
            local mapData = table.find(firefightMaps, function(map)
                return map.name == currentMapName
            end)
            if mapData then
                logger:debug("Setting current map: " .. mapData.name)
                setCurrentMapPreview(mapData.name)
                return
            end
        end
        setCurrentMapPreview("")
    end)
    play:onClick(function()
        local currentMapName = mapButton:getValue()
        if currentMapName ~= "" then
            local mapData = table.find(firefightMaps, function(map)
                return map.name == currentMapName
            end)
            if not mapData then
                logger:error("Map not found: " .. currentMapName)
                return
            end
            local isSinglePlayer = table.find(firefight.maps.singleplayer, function(map)
                return map.name == currentMapName
            end) ~= nil
            -- Access developer maps if in debug mode
            if DebugMode then
                currentMapName = currentMapName .. "_dev"
            end
            logger:debug("Loading Firefight map: " .. currentMapName)
            disableCheats({"deathless_player", "infinite_ammo", "super_jump"})
            if isSinglePlayer then
                executeScript("map_name " .. currentMapName)
                return
            end
            core.saveFirefightSettings(settings)
            local difficultyGameIndex = difficultyButton:getValue()
            logger:debug("Setting difficulty: " .. difficulties[difficultyGameIndex + 1].value)
            logger:debug("Difficulty index: " .. tostring(difficultyGameIndex))
            -- This garbage does not work for some reason (there was a way to make it work but I forgot, fuck)
            executeScript("game_difficulty_set " .. difficulties[difficultyGameIndex + 1].value)
            -- Define game difficulty ourselves to reflect change as soon as possible
            blam.setGameDifficultyIndex(difficultyGameIndex)
            executeScript("sv_timelimit 0")
            executeScript("sv_map " .. currentMapName .. " slayer")
        end
    end)

    local elements = {}
    local elementsData = {
        ["PLAYER INITIAL LIVES"] = {
            value = 7,
            change = function(value)
                settings.playerInitialLives = value
            end,
            focus = function()
                description:setText("Set the number of lives that players start with.")
            end
        },
        ["EXTRA LIVES GAINED"] = {
            value = 1,
            change = function(value)
                settings.extraLivesGained = value
            end,
            focus = function()
                description:setText("Set the number of extra lives players gain per round.")
            end
        },
        ["LIVES LOST PER DEAD"] = {
            value = 1,
            change = function(value)
                settings.livesLostPerDead = value
            end,
            focus = function()
                description:setText("Set the number of lives lost per player death.")
            end
        },
        ["WAVES PER ROUND"] = {
            value = 5,
            change = function(value)
                settings.wavesPerRound = value
            end,
            focus = function()
                description:setText("Set the number of waves per round.")
            end
        },
        ["ROUNDS PER SET"] = {
            value = 3,
            change = function(value)
                settings.roundsPerSet = value
            end,
            focus = function()
                description:setText("Set the number of rounds per set.")
            end
        },
        ["SETS PER GAME"] = {
            value = 3,
            change = function(value)
                settings.setsPerGame = value
            end,
            focus = function()
                description:setText("Set the number of sets per game.")
            end
        },
        ["EXTRA BOSS WAVE FREQ"] = {
            value = 0,
            change = function(value)
                settings.bossWaveFrequency = value
            end,
            focus = function()
                description:setText(
                    "Set the wave in which an extra boss wave appears. 0 disables it. If the value exceeds the number of\nWaves Per Round, the boss will appear at the corresponding wave in a continuous sequence across\nrounds.")
            end
        },
        ["ENEMIES LEFT"] = {
            value = 4,
            change = function(value)
                settings.enemiesLeftBeforeNextWave = value
            end,
            focus = function()
                description:setText("Set the number of enemies left before the next wave spawns.")
            end
        },
        ["BOSS ENEMIES LEFT"] = {
            value = 0,
            change = function(value)
                settings.bossEnemiesLeftBeforeNextWave = value
            end,
            focus = function()
                description:setText(
                    "Set the number of boss enemies left before the next wave spawns. Set to 0 to disable this feature.")
            end
        },
        ["ALLOW ROUND ENDING BOSS"] = {
            value = false,
            change = function(value)
                settings.roundEndingBoss = tobool(value)
            end,
            focus = function()
                description:setText("Allow a boss wave to spawn at the end of each round.")
            end
        },
        ["GAME TIMER"] = {
            value = 1,
            change = function(value)
                settings.gameCooldownSeconds = value
            end,
            focus = function()
                description:setText("Set the time (in seconds) to wait to start a new game.")
            end
        },
        ["WAVE TIMER"] = {
            value = 9,
            change = function(value)
                settings.waveCooldownSeconds = value
            end,
            focus = function()
                description:setText("Set the time (in seconds) to wait between waves.")
            end
        },
        ["ROUND TIMER"] = {
            value = 10,
            change = function(value)
                settings.roundCooldownSeconds = value
            end,
            focus = function()
                description:setText("Set the time (in seconds) to wait to start a new round.")
            end
        },
        ["SET TIMER"] = {
            value = 1,
            change = function(value)
                settings.setCooldownSeconds = value
            end,
            focus = function()
                description:setText("Set the time (in seconds) to wait to start a new set.")
            end
        },
        -- ["STARTING ENEMY TEAM"] = {
        --    value = "Covenant",
        --    change = function(value, index)
        --        settings.startingEnemyTeam = index
        --    end,
        --    focus = function()
        --        description:setText("Set the starting enemy team.")
        --    end
        -- },
        ["ACTIVATE TEMPORAL SKULL EVERY"] = {
            value = "Round",
            change = function(value, index)
                settings.activateTemporalSkullEach = index
            end,
            focus = function()
                description:setText("Set how often Temporal Skulls are enabled.")
            end
        },
        ["RESET TEMPORAL SKULL EVERY"] = {
            value = "Set",
            change = function(value, index)
                settings.resetTemporalSkullEach = index
            end,
            focus = function()
                description:setText(
                    "Sets how often Temporal Skulls reset. Don't use the same value as 'Activate Temporal Skull Every',\nor they may cancel each other out.")
            end
        },
        ["ACTIVATE PERMANENT SKULL EVERY"] = {
            value = "Set",
            change = function(value, index)
                settings.activatePermanentSkullEach = index
            end,
            focus = function()
                description:setText("Set how often permanent skulls are enabled.")
            end
        },
        ["ALLOW RANDOM PERMANENT SKULLS"] = {
            value = false,
            change = function(value)
                settings.permanentSkullsCanBeRandom = tobool(value)
            end,
            focus = function()
                description:setText(
                    "Allow permanent skulls to be randomly enabled troughout the game.")
            end
        },
        ["DEPLOY ALLIES EVERY"] = {
            value = "Boss Wave",
            change = function(value, index)
                settings.deployAlliesEach = index
            end,
            focus = function()
                description:setText("Set how often allies are deployed.")
            end
        }
    }

    for i = 1, firefightSettingsList.widgetDefinition.childWidgetsCount do
        local childWidget = firefightSettingsList.widgetDefinition.childWidgets[i]
        local tag = blam.getTag(childWidget.widgetTag)
        assert(tag)
        if tag.path:includes "checkbox" then
            logger:debug("Found checkbox: {}", tag.path)
            local check = checkbox.new(tag.id)
            elements[check:getText()] = check
            check:onToggle(function(value)
                logger:debug("Toggled {} to {}", check:getText(), tostring(value))
                local optionName = check:getText()
                if elementsData[optionName] then
                    elementsData[optionName].change(value)
                end
            end)
            check:onFocus(function()
                local optionName = check:getText()
                if elementsData[optionName] then
                    elementsData[optionName].focus()
                end
            end)
        elseif tag.path:includes "spinner" then
            local spin = spinner.new(tag.id)
            elements[spin:getText()] = spin
            spin:onScroll(function(value, index)
                local optionName = spin:getText()
                if elementsData[optionName] then
                    elementsData[optionName].change(value, index)
                end
            end)
            spin:onFocus(function()
                local optionName = spin:getText()
                if elementsData[optionName] then
                    elementsData[optionName].focus()
                end
            end)
        end
    end

    local function values(from, to)
        local t = {}
        for i = from, to do
            table.insert(t, i)
        end
        return t
    end

    local events = {"Never", "Wave", "Round", "Set", "Boss Wave"}

    firefightSettingsPanel:onOpen(function()
        logger:debug("Opening settings list")
        elements["PLAYER INITIAL LIVES"]:setValues(values(1, 30))
        elements["EXTRA LIVES GAINED"]:setValues(values(0, 30))
        elements["LIVES LOST PER DEAD"]:setValues(values(1, 3))
        elements["WAVES PER ROUND"]:setValues(values(1, 20))
        elements["ROUNDS PER SET"]:setValues(values(1, 10))
        elements["SETS PER GAME"]:setValues(values(1, 5))
        elements["EXTRA BOSS WAVE FREQ"]:setValues(values(0, 10))
        elements["ENEMIES LEFT"]:setValues(values(0, 4))
        elements["BOSS ENEMIES LEFT"]:setValues(values(0, 4))
        elements["GAME TIMER"]:setValues(values(1, 15))
        elements["WAVE TIMER"]:setValues(values(1, 15))
        elements["ROUND TIMER"]:setValues(values(1, 15))
        elements["SET TIMER"]:setValues(values(1, 15))
        elements["ACTIVATE TEMPORAL SKULL EVERY"]:setValues(events)
        elements["RESET TEMPORAL SKULL EVERY"]:setValues(events)
        elements["ACTIVATE PERMANENT SKULL EVERY"]:setValues(events)
        elements["DEPLOY ALLIES EVERY"]:setValues(events)
        elementsData["PLAYER INITIAL LIVES"].value = settings.playerInitialLives
        elementsData["EXTRA LIVES GAINED"].value = settings.extraLivesGained
        elementsData["LIVES LOST PER DEAD"].value = settings.livesLostPerDead
        elementsData["WAVES PER ROUND"].value = settings.wavesPerRound
        elementsData["ROUNDS PER SET"].value = settings.roundsPerSet
        elementsData["SETS PER GAME"].value = settings.setsPerGame
        elementsData["EXTRA BOSS WAVE FREQ"].value = settings.bossWaveFrequency
        elementsData["ENEMIES LEFT"].value = settings.enemiesLeftBeforeNextWave or 4
        elementsData["BOSS ENEMIES LEFT"].value = settings.bossEnemiesLeftBeforeNextWave or 0
        elementsData["ALLOW ROUND ENDING BOSS"].value = tobool(settings.roundEndingBoss)
        elementsData["GAME TIMER"].value = settings.gameCooldownSeconds or 1
        elementsData["WAVE TIMER"].value = settings.waveCooldownSeconds or 9
        elementsData["ROUND TIMER"].value = settings.roundCooldownSeconds or 10
        elementsData["SET TIMER"].value = settings.setCooldownSeconds or 1
        -- elementsData["STARTING ENEMY TEAM"].value = settings.startingEnemyTeam or 1
        elementsData["ACTIVATE TEMPORAL SKULL EVERY"].value =
            events[settings.activateTemporalSkullEach or 2]
        elementsData["RESET TEMPORAL SKULL EVERY"].value =
            events[settings.resetTemporalSkullEach or 3]
        elementsData["ACTIVATE PERMANENT SKULL EVERY"].value =
            events[settings.activatePermanentSkullEach or 3]
        elementsData["ALLOW RANDOM PERMANENT SKULLS"].value = tobool(
                                                                  settings.permanentSkullsCanBeRandom)
        elementsData["DEPLOY ALLIES EVERY"].value = events[settings.deployAlliesEach or 5]

        for optionName, element in pairs(elements) do
            local data = elementsData[optionName]
            if data then
                element:setValue(data.value)
            end
        end
    end)

    local skulls = {
        -- Golden Skulls
        famine = {
            name = "Famine",
            motto = "Trust us, bring a magazine.",
            description = "Enemies dropped weapons with half ammo.",
            state = {count = 0, max = 2, multiplier = 1},
            allowedInRandom = true,
            isEnabled = false,
            isPermanent = false
        },
        mythic = {
            name = "Mythic",
            motto = "Coverage under the Covenant Health Plan!",
            description = " Enemies have double health and shields, and player gets a x1.5 bonus of it.",
            state = {count = 0, max = 2, multiplier = 1},
            allowedInRandom = true,
            isEnabled = false,
            isPermanent = false
        },
        blind = {
            name = "Blind",
            motto = "Shoot from the hip.",
            description = "Players have the HUD disabled.",
            state = {count = 0, max = 1, multiplier = 1},
            allowedInRandom = true,
            isEnabled = false,
            isPermanent = false,
            onTick = function()
            end
        },
        catch = {
            name = "Catch",
            motto = "Pull pin. Count to three. Throw.",
            description = "Enemies launch grenades with more frequency, and throwing speed increases a little.",
            state = {count = 0, max = 2, multiplier = 1},
            allowedInRandom = true,
            isEnabled = false,
            isPermanent = false
        },
        -- Silver Skulls
        berserk = {
            name = "Berserk",
            motto = "Reckless rage, poisonous pride.",
            description = "Enemies are in a berserker state.",
            state = {count = 0, max = 1, multiplier = 1},
            allowedInRandom = true,
            isEnabled = false,
            isPermanent = false
        },
        toughluck = {
            name = "Tough Luck",
            motto = "Your foes always make every saving throw.",
            description = "Enemies always evade danger",
            state = {count = 0, max = 1, multiplier = 1},
            allowedInRandom = true,
            isEnabled = false,
            isPermanent = false
        },
        fog = {
            name = "Fog",
            motto = "You will miss those eyes in the back of your head.",
            description = "Motion tracker is hidden.",
            state = {count = 0, max = 1, multiplier = 1},
            allowedInRandom = true,
            isEnabled = false,
            isPermanent = false,
            onTick = function()
            end
        },
        knucklehead = {
            name = "Knucklehead",
            motto = "All brawn and no brain...",
            description = "Body damage gets reduced to 1/5th, and head damage gets a 500% bonus.",
            state = {count = 0, max = 2, multiplier = 1},
            allowedInRandom = true,
            isEnabled = false,
            isPermanent = false
        },
        cowbell = {
            name = "Cowbell",
            motto = "More bang for your buck.",
            description = "Acceleration effects are duplicated.",
            state = {count = 0, max = 2, multiplier = 1},
            allowedInRandom = true,
            isEnabled = false,
            isPermanent = false
        },
        havok = {
            name = "Havok",
            motto = "Deliver hope... and tactical warheads.",
            description = "Doubles explosions radius effect.",
            state = {count = 0, max = 2, multiplier = 1},
            allowedInRandom = true,
            enabledFromTheStart = true,
            isEnabled = false,
            isPermanent = false
        },
        newton = {
            name = "Newton",
            motto = "That is... not how the 3rd law works.",
            description = "Melee hits now inflict knockback... To both ends.",
            state = {count = 0, max = 2, multiplier = 1},
            allowedInRandom = true,
            enabledFromTheStart = true,
            isEnabled = false,
            isPermanent = false
        },
        tilt = {
            name = "Tilt",
            motto = "What was once resistance is now immunity.",
            description = "Material resistances and weakness are doubled.",
            state = {count = 0, max = 2, multiplier = 1},
            allowedInRandom = true,
            isEnabled = false,
            isPermanent = false
        },
        banger = {
            name = "Banger",
            motto = "Send me out, with a bang.",
            description = "Some enemies drop live grenades at death.",
            state = {count = 0, max = 1, multiplier = 1},
            allowedInRandom = true,
            isEnabled = false,
            isPermanent = false
        },
        doubledown = {
            name = "Double Down",
            motto = "Do I feel lucky?",
            description = "Doubles your shield... As well as the stun and recovering time.",
            state = {count = 0, max = 2, multiplier = 1},
            allowedInRandom = true,
            isEnabled = false,
            isPermanent = false
        },
        eyepatch = {
            name = "Eye Patch",
            motto = "Like a mad dog.",
            description = "Aim assistance gets reduced to 0, but so is initial error for all weapons.",
            state = {count = 0, max = 1, multiplier = 1},
            allowedInRandom = true,
            isEnabled = false,
            isPermanent = false
        },
        triggerswitch = {
            name = "Trigger Switch",
            motto = "A change of pace.",
            description = "Full auto weapons become semi-auto and vice versa.",
            state = {count = 0, max = 1, multiplier = 1},
            allowedInRandom = true,
            isEnabled = false,
            isPermanent = false
        },
        slayer = {
            name = "Slayer",
            motto = "Double every shot by sheer will of rip and tear.",
            description = "Doubles projectiles per shot and spread cone size.",
            state = {count = 0, max = 2, multiplier = 1},
            allowedInRandom = true,
            isEnabled = false,
            isPermanent = false
        },
        assassin = {
            name = "Assassin",
            motto = "Your armor's system is not as... new as ours.",
            description = "Everyone gets active cammo... But yours fail from time to time.",
            state = {count = 0, max = 1, multiplier = 1},
            allowedInRandom = true,
            isEnabled = false,
            isPermanent = false,
            onTick = function()
            end
        },
        bandana = {
            name = "Bandana",
            motto = "Never run out of ammo again.",
            description = "Player has infinite ammo.",
            effect = bandana.skullEffect,
            state = {count = 0, max = 1, multiplier = 1},
            allowedInRandom = true,
            isEnabled = false,
            isPermanent = false
        },
        gruntBirthday = {
            name = "Grunt Birthday Party",
            motto = "Make every grunt's day special.",
            description = "Grunts explode into confetti with a headshot.",
            effect = gruntBirthday.skullEffect,
            state = {count = 0, max = 1, multiplier = 1},
            allowedInRandom = true,
            isEnabled = false,
            isPermanent = false
        }
    }

    skullsSettingsPanel:onOpen(function()
        logger:debug("Opening skulls panel")

        local skullList = table.map(skullsIcons, function(skullKey)
            return {value = skullKey}
        end)

        skullsListOptions:onSelect(function(item, button)
            logger:debug("Selected skull: {}", item.value)

            local skullData = skulls[item.value]
            if not skullData then
                logger:error("Skull data not found for: {}", item.value)
                return
            end

            skullData.isEnabled = not skullData.isEnabled
            local skullCheckbox = checkbox.new(button:get("checkbox"))
            skullCheckbox:setValue(skullData.isEnabled)
        end)

        skullsListOptions:onFocus(function(item)
            skullPreviewIcon:setBitmapIndex(getBitmapIndexForSkull(item.value))
            local skullData = skulls[item.value]
            if not skullData then
                logger:error("Skull data not found for: {}", item.value)
                return
            end
            skullName:setText(skullData.name:upper())
            skullMotto:setText(skullData.motto)
            skullDescription:setText(skullData.description)
        end)

        skullsListOptions:setItems(table.map(skullList, function(item)
            local skullData = skulls[item.value] or {}

            return {
                value = item.value,
                bitmap = function(uiComponent)
                    local icon = component.new(uiComponent:get("skull_"))
                    icon:setBitmapIndex(getBitmapIndexForSkull(item.value))
                    local skullCheckbox = checkbox.new(uiComponent:get("checkbox"))
                    skullCheckbox:setValue(skullData.isEnabled or false)
                end
            }
        end))
    end)

    return function()
        loadMaps()
    end
end
