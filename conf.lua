local settings = require("src/settings")

function love.conf(t)
  local window = settings.window

  t.version = "11.3"

  t.window.title = window.title

  t.window.width = window.width
  t.window.height = window.height

  t.window.fullscreen = window.fullscreen
  t.window.resizable = window.resizable
  t.window.vsync = window.vsync
end
