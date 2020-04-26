local G = love.graphics
local class = gClass
local game = game
local push = gPush
local ui = gUi

local BaseState = require('src/states/BaseState')

local PlayingState = class('Playing', BaseState)

function PlayingState:initialize(handler)
  BaseState:initialize(handler)
end

function PlayingState:update(dt)
  local game = self.handler

  game.background:update(dt)
  game.pipePairs:update(dt)
  game.ground:update(dt)
  game.bird:update(dt)
end

function PlayingState:render()
  local game = self.handler

  game.background:render()
  game.pipePairs:render()
  game.bird:render()
  game.ground:render()

  ui:addText(game.score, 0, 15, {
    font = ui.fonts.title,
    width = push:getWidth() - 15,
    align = "right"
  })
end

return PlayingState
