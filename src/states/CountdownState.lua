local game = game
local ui = gUi
local push = gPush
local tbl = gTbl

local BaseState = require('src/states/BaseState')

local CountdownState = gClass('CountdownState', BaseState)

function CountdownState:initialize(handler)
  BaseState:initialize(handler)

  local game = self.handler

  self.timer = 3

  tbl.each(game.pipePairs, function(pair, i)
    table.remove(game.pipePairs, i)
  end)
end

function CountdownState:update(dt)
  local game = self.handler

  game.background:update(dt)
  game.ground:update(dt)

  self.timer = self.timer - 1 * dt

  if self.timer <= 0 then
    game:goTo('playing')
  end
end

function CountdownState:render()
  local ceil = math.ceil
  local game = self.handler

  game.background:render()
  game.bird:render()
  game.ground:render()

  ui:addText(ceil(self.timer), 0, 30, {font = ui.fonts.title})
  ui:addText('GET READY...', 0, push:getHeight() - 50)
end

return CountdownState
