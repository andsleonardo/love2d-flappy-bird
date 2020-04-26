local G = love.graphics
local class = gClass
local push = gPush

local Pipe = class('Pipe')

local function createPipeSprite()
  return G.newImage("assets/sprites/pipe.png")
end

Pipe.static.sprite = createPipeSprite()
Pipe.static.minHeight = Pipe.sprite:getHeight()/5

function Pipe:initialize(y, position)
  self.sprite = Pipe.sprite
  self.width, self.height = self.sprite:getDimensions()

  self.y = y
  self.sy = position == "lower" and 1 or -1
end

function Pipe:render(x)
  G.draw(self.sprite, x, self.y, 0, 1, self.sy)
end

return Pipe
