local class = gClass
local Ground = class('Ground')

local function createImage()
  local G = love.graphics

  return G.newImage("assets/images/ground.png")
end

Ground.static.dx = GAME_SPEED
Ground.static.image = createImage()

function Ground:initialize()
  local G = love.graphics
  local push = gPush

  self.image = Ground.image
  self.width, self.height = self.image:getDimensions()

  self.x = 0
  self.y = push:getHeight() - self.height

  self.ox = 0
  self.dx = Ground.dx
  self.loopAt = self.width
end

function Ground:update(dt)
  self.ox = (self.ox + self.dx * dt) % self.loopAt
end

function Ground:render()
  local G = love.graphics

  G.draw(self.image, 0, self.y, 0, 1, 1, self.ox)
  G.draw(self.image, self.width, self.y, 0, 1, 1, self.ox)
end

return Ground
