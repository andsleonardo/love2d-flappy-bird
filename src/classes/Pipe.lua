local class = gClass

local Pipe = class('Pipe')

function createPipeSprite()
  local G = love.graphics

  return love.graphics.newImage("assets/sprites/pipe.png")
end

Pipe.static.sprite = createPipeSprite()
Pipe.static.minHeight = Pipe.sprite:getHeight()/5

function Pipe:initialize(y, position)
  local push = gPush

  self.sprite = Pipe.sprite
  self.width, self.height = self.sprite:getDimensions()

  self.y = y
  self.sy = position == "lower" and 1 or -1
end

function Pipe:render(x)
  local G = love.graphics

  G.draw(self.sprite, x, self.y, 0, 1, self.sy)
end

return Pipe
