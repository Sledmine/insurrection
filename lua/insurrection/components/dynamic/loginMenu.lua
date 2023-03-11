local components = require "insurrection.components"
local constants = require "insurrection.constants"
local button = require "insurrection.components.button"
local core = require "insurrection.core"

return function()
    local login = components.new(constants.widgets.login.id)
    local usernameInput = button.new(login:findChildWidgetTag("username_input").id)
    local passwordInput = button.new(login:findChildWidgetTag("password_input").id)
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
                         "We have a Discord Bot to help with the registering process:\n\n\nhttps://discord.shadowmods.net")
    end)
end