local component = require "insurrection.components"
local constants = require "insurrection.constants"
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
local tobit = luna.bit
local tobool = luna.bool

local function disableCheats(cheats)
    for _, cheat in pairs(cheats) do
        executeScript("cheat_" .. cheat .. " false")
    end
end

return function()
    local firefightMenu = component.new(constants.widgets.firefight.id)
    local options = component.new(firefightMenu:findChildWidgetTag("options").id)
    local mapsList = list.new(options:findChildWidgetTag("firefight_maps").id)
    local mapsListScroll = bar.new(firefightMenu:findChildWidgetTag("maps_scroll").id)
    mapsList:setScrollBar(mapsListScroll)
    local mapPreview = component.new(firefightMenu:findChildWidgetTag("preview").id)
    component.new(mapPreview:findChildWidgetTag("overlay_scanner").id):animate()
    local mapName = component.new(firefightMenu:findChildWidgetTag("map_name").id)
    local mapAuthor = component.new(firefightMenu:findChildWidgetTag("map_author").id)
    local mapDescription = component.new(firefightMenu:findChildWidgetTag("map_description").id)

    local definitions = component.new(options:findChildWidgetTag("definitions").id)
    local footer = component.new(firefightMenu:findChildWidgetTag("footer").id)
    local description = component.new(footer:findChildWidgetTag("text").id)
    local searchLabel = component.new(firefightMenu:findChildWidgetTag("search_label").id)
    local search = input.new(options:findChildWidgetTag("search").id)
    search:setAllowEmptyCharacters(false)

    local map = button.new(definitions:findChildWidgetTag("definition_map").id)
    local settingsButton = button.new(definitions:findChildWidgetTag("definition_options").id)

    local settingsList = component.new(blam.findTag("firefight_config",
                                                    blam.tagClasses.uiWidgetDefinition).id)
    local play = button.new(options:findChildWidgetTag("play").id)

    local setMapBackgroundBitmap = function(mapName)
        mapPreview.widgetDefinition.backgroundBitmap = core.getMapBackgroundBitmap(mapName)
    end

    mapsList:onSelect(function(item)
        local mapName = item.value
        if DebugMode then
            mapName = mapName .. "_dev"
        end
        map:setText(item.label --[[@as string]] )
        map:setValue(item.value)
    end)

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

    local gameMapsList = engine.map.getMapList()
    logger:debug("{}", inspect(gameMapsList))
    local function loadMaps()
        firefightMaps = table.filter(firefightMaps, function(map)
            return table.find(gameMapsList, function(mapName)
                return mapName == map.name or mapName == (map.name .. "_dev")
            end) ~= nil
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

    local function displayMapsPanel(isVisible)
        if isVisible then
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
            loadMaps()
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
        footer:show()
        description:show()
    end

    map:onClick(function()
        settingsList:replace(mapsList.tag.id)
        displayMapsPanel(true)
    end)

    settingsButton:onClick(function()
        mapsList:replace(settingsList.tag.id)
        displayMapsPanel(false)
    end)

    firefightMenu:onOpen(function()
        loadMaps()
        displayMapsPanel(true)
    end)

    local eventNames = {never = 1, eachWave = 2, eachRound = 3, eachSet = 4, eachBossWave = 5}

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
        -- Time properties
        waveCooldownSeconds = 9,
        roundCooldownSeconds = 10,
        setCooldownSeconds = 1,
        gameCooldownSeconds = 1,
        -- Game settings
        startingEnemyTeam = 1, -- 1 = Covenant, 2 = Flood, 3 = Random
        permanentSkullsCanBeRandom = true,
        -- Event properties
        activateTemporalSkullEach = eventNames.eachRound,
        activatePermanentSkullEach = eventNames.eachSet
    }
    -- By default, boss waves are the last wave of each round.
    settings.bossWaveFrequency = settings.wavesPerRound

    play:onFocus(function()
        local currentMapName = map:getValue()
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
        local currentMapName = map:getValue()
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
                description:setText("Set the number of lives each player starts with.")
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
        ["BOSS WAVE FREQUENCY"] = {
            value = 0,
            change = function(value)
                settings.bossWaveFrequency = tointeger(value)
            end,
            focus = function()
                description:setText(
                    "Set how often boss waves appear. Set to 0 to disable boss waves.")
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
        ["WAVE TIMER"] = {
            value = 9,
            change = function(value)
                settings.waveCooldownSeconds = value
            end,
            focus = function()
                description:setText(
                    "Set the time (in seconds) to wait between waves.")
            end
        },
        ["ACTIVATE TEMPORAL SKULL EACH"] = {
            value = "Round",
            change = function(value, index)
                settings.activateTemporalSkullEach = index
            end,
            focus = function()
                description:setText("Set how often temporal skulls are enabled.")
            end
        },
        ["ACTIVATE PERMANENT SKULL EACH"] = {
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
        }
    }

    for i = 1, settingsList.widgetDefinition.childWidgetsCount do
        local childWidget = settingsList.widgetDefinition.childWidgets[i]
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
            table.insert(t, tostring(i))
        end
        return t
    end

    local events = {"Never", "Wave", "Round", "Set", "Boss Wave"}

    settingsList:onOpen(function()
        logger:debug("Opening settings list")
        elements["PLAYER INITIAL LIVES"]:setValues(values(1, 30))
        elements["EXTRA LIVES GAINED"]:setValues(values(1, 30))
        elements["LIVES LOST PER DEAD"]:setValues(values(1, 3))
        elements["WAVES PER ROUND"]:setValues(values(1, 20))
        elements["ROUNDS PER SET"]:setValues(values(1, 10))
        elements["SETS PER GAME"]:setValues(values(1, 10))
        elements["BOSS WAVE FREQUENCY"]:setValues(values(0, 10))
        elements["ENEMIES LEFT"]:setValues(values(1, 10))
        elements["BOSS ENEMIES LEFT"]:setValues(values(0, 10))
        elements["WAVE TIMER"]:setValues(values(1, 15))
        elements["ACTIVATE TEMPORAL SKULL EACH"]:setValues(events)
        elements["ACTIVATE PERMANENT SKULL EACH"]:setValues(events)
        elementsData["PLAYER INITIAL LIVES"].value = settings.playerInitialLives
        elementsData["EXTRA LIVES GAINED"].value = settings.extraLivesGained
        elementsData["LIVES LOST PER DEAD"].value = settings.livesLostPerDead
        elementsData["WAVES PER ROUND"].value = settings.wavesPerRound
        elementsData["ROUNDS PER SET"].value = settings.roundsPerSet
        elementsData["SETS PER GAME"].value = settings.setsPerGame
        elementsData["BOSS WAVE FREQUENCY"].value = settings.bossWaveFrequency
        elementsData["ENEMIES LEFT"].value = settings.enemiesLeftBeforeNextWave or 4
        elementsData["BOSS ENEMIES LEFT"].value = settings.bossEnemiesLeftBeforeNextWave or 0
        elementsData["WAVE TIMER"].value = settings.waveCooldownSeconds
        elementsData["ACTIVATE TEMPORAL SKULL EACH"].value =
            events[settings.activateTemporalSkullEach or 2]
        elementsData["ACTIVATE PERMANENT SKULL EACH"].value =
            events[settings.activatePermanentSkullEach or 3]
        elementsData["ALLOW RANDOM PERMANENT SKULLS"].value = tobool(
                                                                  settings.permanentSkullsCanBeRandom)

        for optionName, element in pairs(elements) do
            local data = elementsData[optionName]
            if data then
                element:setValue(data.value)
            end
        end
    end)
    return function()
        loadMaps()
    end
end
