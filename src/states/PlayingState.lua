local BaseState = require('src/states/BaseState')

local PlayingState = gClass('Playing', BaseState)

function PlayingState:initialize()
  BaseState:initialize()
end

function PlayingState:update(dt)
  game.background:update(dt)
  game.pipePairs:update(dt)
  game.ground:update(dt)
  game.bird:update(dt)
end

function PlayingState:render()
  local G = love.graphics
  local push = gPush

  game.pipePairs:render()

  G.setFont(ui.fonts.title)
  G.setColor(0, 0, 0, 1)
  G.printf(game.score, 0, 17, push:getWidth() - 15, "right")
  G.setColor(1, 1, 1, 1)
  G.printf(game.score, 0, 15, push:getWidth() - 15, "right")
end

return PlayingState
