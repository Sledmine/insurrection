local widget = require "lua.scripts.widget"
local intro = require "lua.scripts.ui.componentsV2.intro"
local flashbar = require "lua.scripts.ui.componentsV2.flashbar"
local versionFooter = require "lua.scripts.ui.componentsV2.versionFooter"

widget.init [[insurrection/ui/shared/version/]]
local versionPath = versionFooter("insurrection", string.rep(" ", 512))

widget.init([[insurrection/ui/menus/intro/]])

intro("intro_menu", {
    {[[insurrection/ui/shared/halo_custom_edition_logo.ui_widget_definition]], 202, 160},
    {flashbar("press_start_to_continue", "Press ENTER or Click to Continue..."), 0, 300},
    {versionPath, 0, 460}
})

-- Workaround due to not being able to swap initial widget as it is hardcoded by path
if not os.execute(
    "cp -f tags/insurrection/ui/menus/intro/intro_menu.ui_widget_definition tags/ui/shell/main_menu/main_menu.ui_widget_definition") then
    os.exit(1)
end
