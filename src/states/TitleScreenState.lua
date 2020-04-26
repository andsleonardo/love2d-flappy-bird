local BaseState = require('src/states/BaseState')

local TitleScreenState = gClass('TitleScreenState', BaseState)

function TitleScreenState:initialize()
  BaseState:initialize()
end

function TitleScreenState:update(dt)
  game.background:update(dt)
  game.ground:update(dt)

  if game.keysPressed['space'] then
    fsm:change('countdown')
  end
end

function TitleScreenState:render()
  local G = love.graphics

  G.setFont(ui.fonts.title)
  G.setColor(0, 0, 0, 1)
  G.printf("FlappyLOVE", 0, 32, gPush:getWidth(), "center")
  G.setColor(1, 1, 1, 1)
  G.printf("FlappyLOVE", 0, 30, gPush:getWidth(), "center")
end

return TitleScreenState
