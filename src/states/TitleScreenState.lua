local G = love.graphics
local class = gClass
local ui = gUi

local BaseState = require('src/states/BaseState')

local TitleScreenState = class('TitleScreenState', BaseState)

function TitleScreenState:initialize(handler)
  BaseState:initialize(handler)
end

function TitleScreenState:update(dt)
  local game = self.handler

  game.background:update(dt)
  game.ground:update(dt)

  if game.keysPressed['space'] then
    game:goTo('countdown')
  end
end

function TitleScreenState:render()
  local game = self.handler

  game.background:render()
  game.bird:render()
  game.ground:render()

  ui:addText('FlappyLOVE', 0, 30, {font = ui.fonts.title})
end

return TitleScreenState
