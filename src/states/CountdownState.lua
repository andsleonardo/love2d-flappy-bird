local BaseState = require('src/states/BaseState')

local CountdownState = gClass('CountdownState', BaseState)

function CountdownState:initialize()
  self.timer = 3

  BaseState:initialize()
end

function CountdownState:update(dt)
  game.background:update(dt)
  game.ground:update(dt)

  self.timer = self.timer - 1 * dt

  if self.timer <= 0 then
    game:goTo('playing')
  end
end

function CountdownState:render()
  local G = love.graphics
  local ceil = math.ceil

  G.setFont(ui.fonts.title)
  G.setColor(0, 0, 0, 1)
  G.printf(ceil(self.timer), 0, 32, gPush:getWidth(), "center")
  G.setColor(1, 1, 1, 1)
  G.printf(ceil(self.timer), 0, 30, gPush:getWidth(), "center")
end

return CountdownState
