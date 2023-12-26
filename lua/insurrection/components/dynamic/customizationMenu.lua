local blam = require "blam"
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

---@return number?
local number = function(v)
    return tonumber(v)
end

return function()
    -- Get customization widget menu
    local customization = components.new(constants.widgets.customization.id)

    -- Get nameplate preview widget
    local nameplatePreview = components.new(findTag("nameplate_preview",
                                                    tagClasses.uiWidgetDefinition).id)
    nameplatePreview:animate()

    -- Get nameplate list widget
    local nameplatesList = list.new(customization:findChildWidgetTag("nameplates_options").id, 1, 9)

    -- Get select bipeds widget
    local selectBipedsWrapper = components.new(findTag("select_bipeds",
                                                       tagClasses.uiWidgetDefinition).id)
    local selectProjectsList = list.new(selectBipedsWrapper:findChildWidgetTag("select_project").id)
    local bipedsList = list.new(selectBipedsWrapper:findChildWidgetTag("select_project_biped").id)

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
        nameplatePreview.widgetDefinition.backgroundBitmap = item.bitmap --[[@as number]]
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
    local handleSelectBiped = function(bipedPath, regions)
        execute_script("object_create customization_biped")
        local bipedTagEntry = findTag(bipedPath, tagClasses.biped)
        assert(bipedTagEntry, "biped tag " .. bipedPath .. " not found")
        local bipedTag = blam.bipedTag(bipedTagEntry.id)
        assert(bipedTag, "biped tag " .. bipedPath .. " not found")
        -- TODO Remove this when biped animations are fixed in coop evolved
        if not (bipedTagEntry.path:includes "marine" or bipedTagEntry.path:includes "grunt") then
            bipedTag.weaponCount = 0
        end
        local bipedName = utils.snakeCaseToUpperTitleCase(
                              utils.path(bipedPath:replace("_mp", "")).name)
        currentBipedLabel:setText(bipedName)
        local customizationObjectId = core.getCustomizationObjectId()
        if customizationObjectId then
            local object = blam.object(get_object(customizationObjectId))
            assert(object, "customization object not found")
            local scenario = blam.scenario(0)
            assert(scenario)
            -- Respawn biped object from scenario as it is safer than doing it from lua
            for _, biped in pairs(scenario.bipeds) do
                local sceneryName = scenario.objectNames[biped.nameIndex + 1]
                if sceneryName == "customization_biped" then
                    local newPaletteList = scenario.bipedPaletteList
                    -- Replace scenario biped tag with custom biped tag
                    if newPaletteList[biped.typeIndex + 1] ~= bipedTagEntry.id then
                        newPaletteList[biped.typeIndex + 1] = bipedTagEntry.id
                        scenario.bipedPaletteList = newPaletteList
                        execute_script "object_destroy customization_biped"
                        execute_script "object_create customization_biped"
                        execute_script "fade_screen_in"
                    end
                    break
                end
            end
            if regions then
                local customizationObjectId = core.getCustomizationObjectId()
                assert(customizationObjectId, "customization object not found")
                local object = blam.object(get_object(customizationObjectId))
                assert(object, "customization object not found")

                for regionIndex, permutationIndex in pairs(regions) do
                    core.setObjectPermutationSafely(object, regionIndex, permutationIndex)
                end
            end
        end
        -- local r, g, b = color.hexToDec("#b50003")
        -- menuBiped.colorCLowerRed = r
        -- menuBiped.colorCLowerGreen = g
        -- menuBiped.colorCLowerBlue = b
    end

    local function handleLoadNameplates()
        execute_script("set_ui_background")
        currentBipedLabel:setText("")
        selectBipedsWrapper:replace(nameplatesList.tagId)
    end

    local function handleLoadBipeds()
        local savedBipeds = {}
        if api.session and api.session.player and api.session.player.bipeds then
            savedBipeds = table.map(api.session.player.bipeds, function(data)
                local elements = data:split("+")
                return {
                    path = elements[1],
                    regions = table.map(table.slice(elements, 2, #elements), number)
                }
            end)
        end

        nameplatesList:replace(selectBipedsWrapper.tagId)
        local state = getState()

        local projects = table.keys(state.available.customization)
        table.sort(projects)

        selectProjectsList:onSelect(function(item)
            local value = item.value --[[@as string]]
            local project = state.available.customization[value]
            local bipeds = table.map(project.tags, function(bipedPath)
                return {label = "CUSTOMIZE", value = bipedPath:replace(".biped", "")}
            end)
            bipeds = utils.sortTableAlphabetically(bipeds)
            bipedsList:setItems(bipeds)
            local regions
            local bipedPath = bipeds[1].value
            local savedBiped = savedBipeds[value]
            if savedBiped then
                bipedsList:setCurrentItemIndex(table.indexof(bipeds,
                                                             table.find(bipeds, function(biped)
                    return biped.value == savedBiped.path
                end)) or 1)
                bipedPath = savedBiped.path
                regions = savedBiped.regions
            end
            -- dprint(savedBiped)
            handleSelectBiped(bipedPath, regions)
        end)

        selectProjectsList:setItems(table.map(projects, function(project)
            return {label = utils.snakeCaseToTitleCase(project), value = project}
        end))

        bipedsList:onScroll(function(item)
            handleSelectBiped(item.value)
        end)

        bipedsList:onSelect(function(item)
            -- TODO Save selected biped
            menus.biped()
        end)

    end

    selectBipedButton:onClick(function()
        execute_script("set_customization_background")
        handleLoadBipeds()
    end)

    selectNameplateButton:onClick(function()
        handleLoadNameplates()
    end)

    saveCustomizationButton:onClick(function()
        local selectedProjectItem = selectProjectsList:getSelectedItem()
        local selectedBipedItem = bipedsList:getCurrentItem()

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
        if selectedProjectItem and selectedBipedItem then
            local project = selectedProjectItem.value
            local objectId, regions = core.getCustomizationObjectId()
            assert(objectId and regions, "customization object not found")
            bipeds = {[project] = selectedBipedItem.value .. "+" .. table.concat(regions, "+")}
        end
        dprint(nameplate)
        dprint(bipeds)
        api.playerProfileEdit({nameplate = nameplate, bipeds = bipeds})
    end)

    customization:onOpen(function(previousWidgetTag)
        discord.setState("Playing Insurrection", "In the customization menu")
        if previousWidgetTag then
            if previousWidgetTag.id == constants.widgets.biped.id then
                handleLoadBipeds()
                return
            end
        end
        handleLoadNameplates()
    end)

    return function()
    end
end
