local tbl = gTbl
local class = gClass
local push = gPush

local Pipe = require("src/classes/Pipe")

local PipePair = class("PipePair")

PipePair.static.gap = 70

function PipePair:initialize(y1, y2)
  self.x = push:getWidth()
  self.dx = -GAME_SPEED
  self.pipes = {Pipe(y1, "upper"), Pipe(y2, "lower")}
  self.beaten = false
  self.destroy = false
end

function PipePair:update(dt)
  -- Horizontal scrolling
  self.x = self.x + self.dx * dt

  -- Set for destruction after vanishing from screen
  if self.x + Pipe.sprite:getWidth() < 0 then
    self.destroy = true
  end
end

function PipePair:render()
  tbl.each(self.pipes, function(p) p:render(self.x) end)
end

return PipePair
