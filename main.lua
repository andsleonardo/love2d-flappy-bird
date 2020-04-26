gPush = require("lib/push/push")
gClass = require("lib/middleclass/middleclass")
gTbl = require("lib/tbl")

require("src/constants")
require("src/game")

local function setupPush()
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

function love.load()
  local game = game
  local randomseed = math.randomseed
  local osTime = os.time

  randomseed(osTime())
  setupPush()

  game:load()
end

function love.update(dt)
  local game = game

  game:update(dt)
end

function love.draw()
  local game = game
  local push = gPush

  push:start()
  game:draw()
  push:finish()
end

function love.keypressed(key, _scanCode, _isRepeat)
  local game = game

  game.keysPressed[key] = true
end
