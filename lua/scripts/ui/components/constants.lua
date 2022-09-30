local width = 854
local height = 480

return {
    color = {text = "1, 1, 1, 1", title = "1, 1, 1, 1", subtitle = "1, 0.301961, 0.454902, 0.623529"},
    fonts = {
        title = [[ui\ticker.font]],
        subtitle = [[ui\gamespy.font]],
        text = [[ui\large_ui.font]],
        button = [[ui\large_ui.font]]
    },
    screen = {width = width, height = height},
    getScreenBounds = function()
        return "0, 0, " .. height .. ", " .. width
    end,
    position = {
        header = {x = 40, y = 20},
        options = {x = 40, y = 60}
    }
}
