local BaseState = require('src/states/BaseState')

local ScoreState = gClass('ScoreState', BaseState)

function ScoreState:initialize()
  BaseState:initialize()
end

function ScoreState:update(dt)
  if game.keysPressed['space'] then
    game:goTo('countdown')
  end
end

function ScoreState:render()
  local G = love.graphics

  game.pipePairs:render()

  G.setFont(ui.fonts.title)
  G.setColor(0, 0, 0, 1)
  G.printf('Score: ' .. game.score, 0, 32, gPush:getWidth(), "center")
  G.setColor(1, 1, 1, 1)
  G.printf('Score: ' .. game.score, 0, 30, gPush:getWidth(), "center")

  G.setFont(ui.fonts.normal)
  G.setColor(0, 0, 0, 1)
  G.printf('PRESS SPACE TO TRY AGAIN', 0, 122, gPush:getWidth(), "center")
  G.setColor(1, 1, 1, 1)
  G.printf('PRESS SPACE TO TRY AGAIN', 0, 120, gPush:getWidth(), "center")
end

return ScoreState
