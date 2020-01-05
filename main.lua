local game = require("src/game")

function love.load()
  local game = game

  game:load()
end

function love.update(dt)
  game:update(dt)
end

function love.draw()
  local game = game

  game:draw()
end
