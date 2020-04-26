local BaseState = require('src/states/BaseState')

local GameOverState = gClass('GameOverState', BaseState)

function GameOverState:initialize()
  BaseState:initialize()
end

function GameOverState:update(dt)
  local bird = game.bird
  local ground = game.ground

  bird.dy = bird.dy + GRAVITY_Y * dt
  bird.y = bird.y + bird.dy * dt

  -- Bird and ground collision
  if bird.y + bird.height/2 >= ground.y then
    bird.y = ground.y - bird.height/2
    fsm:change('score')
  end
end

function GameOverState:render()
  game.pipePairs:render()
end

return GameOverState
