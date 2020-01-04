local push = require("lib/push/push")
local settings = require("src/settings")

local window = settings.window
local virtualWindow = window.gameDimensions

local game = {}

function game:load()
  local push = push

  push:setupScreen(
    virtualWindow.width, virtualWindow.height,
    window.width, window.height,
    {
      fullscreen = window.fullscreen,
      resizable = window.resizable
    }
  )
end

function game:update(dt)
end

function game:draw()
end

return game
