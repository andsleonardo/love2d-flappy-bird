local push = require("lib/push/push")
local settings = require("src/settings")

local window = settings.window
local virtualWindow = window.gameDimensions

local game = {
  background = require("src/background")
}

function game:load()
  local G = love.graphics
  local push = push

  push:setupScreen(
    virtualWindow.width, virtualWindow.height,
    window.width, window.height,
    {
      fullscreen = window.fullscreen,
      resizable = window.resizable
    }
  )

  G.setDefaultFilter("nearest", "nearest")
end

function game:draw()
  local push = push

  push:start()
  self.background:render()
  push:finish()
end

return game
