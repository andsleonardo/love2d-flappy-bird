gClass = require("lib/middleclass/middleclass")
gPush = require("lib/push/push")
gTbl = require("lib/tbl")
gUi = require('src/ui')

local game

local G = love.graphics
local push = gPush
local settings = require("src/settings")

local function setupPush()
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
  local randomseed = math.randomseed
  local osTime = os.time

  setupPush()
  randomseed(osTime())

  game = require("src/Game")()
end

function love.update(dt)
  game:update(dt)
end

function love.draw()
  push:start()
  game:render()
  push:finish()
end

function love.keypressed(key, _scanCode, _isRepeat)
  game.keysPressed[key] = true
end
