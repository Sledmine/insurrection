local components = require "insurrection.components"
local constants = require "insurrection.constants"
local button = require "insurrection.components.button"
local core = require "insurrection.core"
local interface = require "insurrection.interface"
local engine = Engine

return function()
    local login = components.new(constants.widgets.login.id)
    local usernameInput = button.new(login:findChildWidgetTag("username_input").id)
    local passwordInput = button.new(login:findChildWidgetTag("password_input").id)
    login:onOpen(function(previousWidget)
        -- Start discord presence only if script is loaded in the UI map, prevent crashes in other maps
        if engine.map.getCurrentMapHeader().name == "ui" and (previousWidget and previousWidget.handle.value == constants.widgets.main.id) then
            if not discord.ready then
                discord.startPresence()
            end
        end
    end)
    -- Load login data
    local savedUserName, savedPassword = core.loadCredentials()
    if savedUserName and savedPassword then
        usernameInput:setText(savedUserName)
        passwordInput:setText(savedPassword, "*")
    end
    local loginButton = button.new(login:findChildWidgetTag("login_button").id)
    loginButton:onClick(function()
        local username, password = usernameInput:getText(), passwordInput:getText()
        if username and password and username ~= "" and password ~= "" then
            core.saveCredentials(username, password)
            api.login(username, password)
        else
            interface.dialog("WARNING", "", "Please enter a username and password.")
        end
    end)
    local registerButton = button.new(login:findChildWidgetTag("register_button").id)
    -- dialogBackButton:onClick(function()
    --    os.execute("start https://discord.shadowmods.net")
    --    dialogBackButton:onClick(nil)
    -- end)
    registerButton:onClick(function()
        interface.dialog("INFORMATION", "Join us on our Discord server!",
                         "We have a Discord Bot for the registering process:\n\n\nhttps://discord.shadowmods.net")
    end)
end
