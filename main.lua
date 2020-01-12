gPush = require("lib/push/push")
gClass = require("lib/middleclass/middleclass")
gTbl = require("lib/tbl")

require("src/constants")
require("src/game")

function love.load()
  local game = game
  local randomseed = math.randomseed
  local osTime = os.time

  randomseed(osTime())

  game:load()
end

function love.update(dt)
  local game = game

  game:update(dt)
end

function love.draw()
  local game = game

  game:draw()
end

function love.keypressed(key, _scanCode, _isRepeat)
  local game = game

  game.keysPressed[key] = true
end
