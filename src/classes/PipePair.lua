local tbl = gTbl
local class = gClass

local Pipe = require("src/classes/Pipe")

local PipePair = class("PipePair")

PipePair.static.gap = 70

function PipePair:initialize(y1, y2)
  local push = gPush

  self.x = push:getWidth()
  self.dx = -GAME_SPEED
  self.pipes = {Pipe(y1, "upper"), Pipe(y2, "lower")}
  self.beaten = false
  self.destroy = false
end

function PipePair:update(dt)
  self.x = self.x + self.dx * dt

  if self.x + Pipe.sprite:getWidth() < 0 then
    self.destroy = true
  end
end

function PipePair:render()
  tbl.each(self.pipes, function(p) p:render(self.x) end)
end

return PipePair
