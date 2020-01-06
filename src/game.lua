local push = require("lib/push/push")

game = {}

function game:load()
  local Bird = require("src/classes/Bird")

  self:setupPush()
  self.world = require("src/world")
  self.background = require("src/background")
  self.bird = Bird()

  self.keysPressed = {}
end

function game:update(dt)
  self.world:update(dt)
  self.background:update(dt)
  self.bird:update(dt)
  self.keysPressed = {}
end

function game:draw()
  local push = push

  push:start()
  self.background:render()
  self.bird:render()
  push:finish()
end

function game:setupPush()
  local settings = require("src/settings")

  local G = love.graphics
  local push = push
  local window = settings.window
  local virtualWindow = window.gameDimensions

  G.setDefaultFilter("nearest", "nearest")

  push:setupScreen(
    virtualWindow.width, virtualWindow.height,
    window.width, window.height,
    {
      fullscreen = window.fullscreen,
      resizable = window.resizable
    }
  )
end
