local balltze = Balltze
local engine = Engine
local blam = require "blam"
local bar = require "insurrection.components.bar"
local interface = require "insurrection.interface"
local tagClasses = blam.tagClasses
local findTag = blam.findTag
local color = require "color"
local components = require "insurrection.components"
local constants = require "insurrection.constants"
local button = require "insurrection.components.button"
local list = require "insurrection.components.list"
local utils = require "insurrection.utils"
local menus = require "insurrection.menus"
local core = require "insurrection.core"
local getState = require "insurrection.redux.getState"
local t = utils.snakeCaseToUpperTitleCase

return function()
    local selectedProject
    local selectedBiped
    local profile = core.getPlayerProfile()
    local state = getState()

    -- Get customization widget menu
    local customization = components.new(constants.widgets.customization.id)

    local scrollBar = bar.new(customization:findChildWidgetTag("customization_scroll").id, "scroll")
    -- Get nameplate list widget
    local nameplatesList = list.new(customization:findChildWidgetTag("nameplates_options").id, 1, 9)
    nameplatesList:setScrollBar(scrollBar)

    -- Get select bipeds widget
    local selectBipedsWrapper = components.new(findTag("select_bipeds",
                                                       tagClasses.uiWidgetDefinition).id)
    local selectProjectsList = list.new(selectBipedsWrapper:findChildWidgetTag("select_project").id)
    selectProjectsList:setScrollBar(scrollBar)
    local bipedsList = list.new(selectBipedsWrapper:findChildWidgetTag("select_project_biped").id)

    local customizationOptions = components.new(customization:findChildWidgetTag(
                                                    "customization_options").id)
    local backButton = button.new(customizationOptions:findChildWidgetTag("back").id)
    local customizationTypesList = components.new(customization:findChildWidgetTag("types").id)
    local selectNameplateButton = button.new(
                                      customizationTypesList:findChildWidgetTag("nameplates").id)

    local selectBipedButton = button.new(customizationTypesList:findChildWidgetTag("bipeds").id)

    local currentBipedLabel = components.new(
                                  customization:findChildWidgetTag("current_biped_label").id)
    -- Get save customization button
    local saveCustomizationButton = button.new(
                                        customization:findChildWidgetTag("save_customization").id)

    nameplatesList:onSelect(function(item)
        log(item.value)
        interface.loadProfileNameplate(item.value)
        -- nameplatePreview.widgetDefinition.backgroundBitmap = item.bitmap --[[@as number]]
    end)
    local sortedNameplates = table.keys(constants.nameplates)
    table.sort(sortedNameplates)
    sortedNameplates = table.map(sortedNameplates, function(nameplateId)
        return {value = nameplateId, bitmap = constants.nameplates[nameplateId].id}
    end)
    nameplatesList:setItems(sortedNameplates)

    ---Select a customization biped
    ---@param bipedPath string
    ---@param regions? number[]
    ---@param visor integer
    local handleSelectBiped = function(bipedPath, regions, visor)
        log("Selected biped path: {}", bipedPath)
        log("Regions: {}", inspect(regions))
        selectedBiped = bipedPath

        execute_script("object_create customization_biped")

        local tagEntry = engine.tag.findTags(bipedPath, engine.tag.classes.biped)[1]
        if not tagEntry then
            logger:error("Custom external biped tag: {} not found", bipedPath)
            return
        end

        local bipedData = tagEntry.data
        if not bipedData then
            logger:error("Biped tag: {} has no data", bipedPath)
            return
        end

        local bipedTag = engine.tag.getTag(tagEntry.handle.value, engine.tag.classes.biped)
        assert(bipedTag, "Biped tag data not found")
        -- TODO Check if this is the right way to remove creation effect
        bipedTag.data.creationEffect.tagHandle.value = 0xFFFFFFFF
        -- TODO Remove this when biped animations are fixed in coop evolved
        if not (tagEntry.path:includes "marine" or tagEntry.path:includes "grunt") then
            -- FIXME This does not work with Balltze as weapons count is read only
            -- bipedTag.data.weapons.count = 0

            -- TODO Try to use unit remove weapon function or something similar
            local bipedTag = blam.bipedTag(tagEntry.handle.value)
            bipedTag.weaponCount = 0
        end

        local scenario = blam.scenario(0)
        assert(scenario)
        -- Respawn biped object from scenario as it is safer than doing it from lua
        for _, biped in pairs(scenario.bipeds) do
            local sceneryName = scenario.objectNames[biped.nameIndex + 1]
            if sceneryName == "customization_biped" then
                local newPaletteList = scenario.bipedPaletteList
                -- Replace scenario biped tag with custom biped tag
                if newPaletteList[biped.typeIndex + 1] ~= tagEntry.handle.value then
                    newPaletteList[biped.typeIndex + 1] = tagEntry.handle.value
                    scenario.bipedPaletteList = newPaletteList
                    execute_script "object_destroy customization_biped"
                    execute_script "object_create customization_biped"
                    execute_script "fade_screen_in"
                    logger:debug("Biped tag replaced")
                end
                break
            end
        end

        local customizationObjectData = core.getCustomizationObjectData()
        local customizationBiped = customizationObjectData.biped
        assert(customizationBiped, "No customization biped found")

        local bipedName = t(utils.path(bipedPath:replace("_mp", "")).name)
        currentBipedLabel:setText(bipedName)

        -- local colorFromGame = constants.colors[profile.colorIndex]
        local colorFromInsurrection = core.getCustomizationObjectData().color.custom
        log("Color from Insurrection: {}", colorFromInsurrection)

        local r, g, b = color.hexToDec(colorFromInsurrection.primary)
        customizationBiped.colorCLowerRed = r
        customizationBiped.colorCLowerGreen = g
        customizationBiped.colorCLowerBlue = b

        local r, g, b = color.hexToDec(colorFromInsurrection.secondary)
        customizationBiped.colorDLowerRed = r
        customizationBiped.colorDLowerGreen = g
        customizationBiped.colorDLowerBlue = b
        if regions then
            logger:debug("Setting regions")
            for regionIndex, permutationIndex in pairs(regions) do
                core.setObjectPermutationSafely(customizationBiped, regionIndex, permutationIndex)
            end
        end

        if visor then
            customizationBiped.shaderPermutationIndex = visor
        end
    end

    local function handleLoadNameplates()
        execute_script("set_customization_background")
        nameplatesList:refresh()
        currentBipedLabel:setText("")
        selectBipedsWrapper:replace(nameplatesList.tagId)
    end

    ---@param projectName? string
    local function handleLoadProject(projectName)
        local savedBipeds = api.getSavedBipeds()
        local lastSavedProject = (core.loadSettings() or {}).lastSavedProject
        local defaultProject = state.available.customization[table.keys(state.available
                                                                            .customization)[1]]
        -- TODO Load last selected project
        local projectName = projectName or lastSavedProject or
                                table.keys(state.available.customization)[1]
        selectedProject = projectName
        local project = state.available.customization[projectName] or defaultProject
        logger:debug("Selected project: {}", projectName)
        local bipeds = table.map(project.tags, function(bipedPath)
            return {label = "CUSTOMIZE", value = bipedPath:replace(".biped", "")}
        end)
        bipeds = utils.sortTableAlphabetically(bipeds)
        bipedsList:setItems(bipeds)
        local regions
        local bipedPath = bipeds[1].value
        local savedBiped = savedBipeds[projectName]
        local visor = 0
        if savedBiped then
            local bipedIsStillAvailable = table.find(bipeds, function(biped)
                return biped.value == savedBiped.path
            end)
            if bipedIsStillAvailable then
                bipedsList:setCurrentItemIndex(table.indexof(bipeds,
                                                             table.find(bipeds, function(biped)
                    return biped.value == savedBiped.path
                end)) or 1)
                bipedPath = savedBiped.path
                regions = savedBiped.regions
                visor = savedBiped.visor
            end
        end
        -- log(savedBiped)
        handleSelectBiped(bipedPath, regions, visor)
    end

    ---@param openList boolean?
    local function handleLoadBipeds(openList)
        if openList then
            nameplatesList:replace(selectBipedsWrapper.tagId)
        end
        local state = getState()

        local projects = table.keys(state.available.customization)
        table.sort(projects)

        selectProjectsList:onSelect(function(item)
            handleLoadProject(item.value)
        end)

        selectProjectsList:setItems(table.map(projects, function(project)
            return {label = utils.snakeCaseToTitleCase(project), value = project}
        end))

        bipedsList:onScroll(function(item)
            handleSelectBiped(item.value)
        end)

        bipedsList:onSelect(function(item)
            -- FIXME State from components should have been reset at this point
            -- Due to current implementation, setItems is not executed when coming back from another
            -- widget, so we need to reset the state manually or prevent scenarios where we get
            -- and invalid state
            log(item.value)
            if core.getCustomizationObjectId() then
                menus.biped()
            end
        end)

    end

    selectBipedButton:onClick(function()
        handleLoadProject()
        handleLoadBipeds(true)
    end)

    selectNameplateButton:onClick(function()
        handleLoadNameplates()
    end)

    saveCustomizationButton:onClick(function()
        local currentNameplateId
        if settings and settings.nameplate then
            currentNameplateId = settings.nameplate
        end
        local selectedNameplateItem = nameplatesList:getSelectedItem() or
                                          {value = currentNameplateId}
        local nameplate = selectedNameplateItem.value
        local bipeds
        if selectedNameplateItem then
            nameplate = selectedNameplateItem.value
        end
        if selectedProject and selectedBiped then
            local objectId = core.getCustomizationObjectId()
            local objectData = core.getCustomizationObjectData()
            local visor = objectData.visor
            local regions = objectData.regions
            if objectId and regions then
                local project = selectedProject
                bipeds = {
                    [project] = selectedBiped .. "+" .. table.concat(regions, "+") .. "+" .. visor
                }
            end
        end
        local color = core.getCustomizationObjectData().color.custom
        log("Nameplate: {}", nameplate)
        log("Bipeds: {}", inspect(bipeds))
        log("Color: {}", inspect(color))
        if IsDebugLocalCustomizationEnabled then
            logger:warning("Local customization can not be saved")
            bipeds = {}
        end
        api.playerProfileEdit({
            nameplate = nameplate,
            bipeds = bipeds,
            color = {primary = color.primary, secondary = color.secondary}
        })
    end)

    customization:onClose(function()
        interface.fade("in", 30)
        interface.loadProfileNameplate()
        if api.session.player.color then
            LastColorCustomization.primary = core.getCustomizationColorByValue(api.session.player
                                                                                   .color.primary)
            LastColorCustomization.secondary = core.getCustomizationColorByValue(api.session.player
                                                                                     .color
                                                                                     .secondary)
        end
    end)

    customization:onOpen(function(previousWidgetTag)
        log("Customization menu opened")
        discord.setState("Playing Insurrection", "In the customization menu")
        profile = core.getPlayerProfile()
        if previousWidgetTag then
            if previousWidgetTag.handle.value == constants.widgets.biped.id then
                handleLoadBipeds(true)
                return
            end
        end
        local savedBipeds = api.getSavedBipeds()
        if savedBipeds then
            handleLoadProject()
            handleLoadBipeds()
        end
        handleLoadNameplates()
    end)

    backButton:onClick(function()
        customization.events.onClose()
    end)

    return function()
    end
end
