local blam = require "blam"
local tagClasses = blam.tagClasses
local findTag = blam.findTag
local function findWidgetTag(partialName)
    return findTag(partialName, blam.tagClasses.uiWidgetDefinition)
end
local core = require "insurrection.core"

local constants = {}

function constants.get()
    constants.widgets = {
        --[[
        The following widgets are not used by the game, but are used by the
        Insurrection mod. They are included here for completeness.
    ]]
        dialog = findWidgetTag("dialog_menu"),
        login = findWidgetTag("login_menu"),
        lobby = findWidgetTag("lobby_menu"),
        dashboard = findWidgetTag("dashboard\\dashboard_menu"),
        customization = findWidgetTag("customization_menu"),
        pause = findWidgetTag("pause\\pause_menu"),
        nameplate = findWidgetTag("shared\\current_profile"),
        tester = findWidgetTag("tester_menu"),
        settings = findWidgetTag("settings\\settings_menu"),
    }

    constants.sounds = {
        error = findTag("flag_failure", tagClasses.sound),
        back = findTag("back", tagClasses.sound),
        success = findTag("forward", tagClasses.sound)
    }

    constants.tagCollections = {nameplates = findTag("nameplates", tagClasses.tagCollection)}

    constants.widgetCollections = {
        multiplayer = findTag("ui\\shell\\multiplayer", tagClasses.uiWidgetCollection)
    }

    if constants.tagCollections.nameplates then
        local nameplatesTagCollection = blam.tagCollection(constants.tagCollections.nameplates.id)
        if nameplatesTagCollection then
            local nameplateBitmapTags = {}
            for _, tagId in ipairs(nameplatesTagCollection.tagList) do
                local tag = blam.getTag(tagId) --[[@as tag]]
                local nameplateId = core.getTagName(tag.path)
                if nameplateId and not nameplateBitmapTags[nameplateId] then
                    nameplateBitmapTags[nameplateId] = tag
                end
            end
            constants.nameplates = nameplateBitmapTags
        end
    end

end

return constants
