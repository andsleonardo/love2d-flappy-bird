game = {}

function game:load()
  local Bird = require("src/classes/Bird")
  local Ground = require("src/classes/Ground")
  local Pipe = require("src/classes/Pipe")

  setupPush()

  self.background = require("src/background")

  self.ground = Ground()
  self.bird = Bird()

  self.keysPressed = {}
end

function game:update(dt)
  self.background:update(dt)
  self.ground:update(dt)
  self.bird:update(dt)

  self.keysPressed = {}
end

function game:draw()
  local push = gPush

  push:start()

  self.background:render()
  self.ground:render()
  self.bird:render()

  push:finish()
end

function setupPush()
  local G = love.graphics
  local push = gPush

  local settings = require("src/settings")
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
