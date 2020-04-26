local game = game
local ui = gUi

local BaseState = require('src/states/BaseState')

local GameOverState = gClass('GameOverState', BaseState)

function GameOverState:initialize(handler)
  BaseState:initialize(handler)
end

function GameOverState:update(dt)
  local game = self.handler
  local bird = game.bird
  local ground = game.ground

  bird.dy = bird.dy + GRAVITY_Y * dt
  bird.y = bird.y + bird.dy * dt

  -- Bird and ground collision
  if bird.y + bird.height/2 >= ground.y then
    bird.y = ground.y - bird.height/2
    game:goTo('score')
  end
end

function GameOverState:render()
  local game = self.handler

  game.background:render()
  game.pipePairs:render()
  game.bird:render()
  game.ground:render()
end

function GameOverState:enter()
  local game = self.handler
  local bird = game.bird

  bird.dy = 0
end

return GameOverState
