local G = love.graphics
local class = gClass
local push = gPush
local ui = gUi

local BaseState = require('src/states/BaseState')
local ScoreState = class('ScoreState', BaseState)

function ScoreState:initialize(handler)
  BaseState:initialize(handler)
end

function ScoreState:update(dt)
  local game = self.handler

  if game.keysPressed['space'] then
    game:reset()
  end
end

function ScoreState:render()
  local game = self.handler

  game.background:render()
  game.pipePairs:render()
  game.bird:render()
  game.ground:render()

  ui:addText('SCORE: ' .. game.score, 0, 30, {font = ui.fonts.title})
  ui:addText('PRESS SPACE TO TRY AGAIN', 0, push:getHeight() - 50)
end

function ScoreState:exit()
  local game = self.handler

  game.score = 0
end

return ScoreState
