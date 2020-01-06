require("src/game")

function love.load()
  local game = game
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
