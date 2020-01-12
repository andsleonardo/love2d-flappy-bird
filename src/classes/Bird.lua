local class = gClass

local Bird = class('Bird')

function createImage()
  local G = love.graphics

  return G.newImage("assets/sprites/bird.png")
end

Bird.static.sprite = createImage()
Bird.static.jumpDy = -200

function Bird:initialize()
  local G = love.graphics
  local push = gPush

  self.sprite = Bird.sprite

  self.x = push:getWidth()/2
  self.y = push:getHeight()/2

  self.dy = 0

  self.width, self.height = self.sprite:getDimensions()
end

function Bird:update(dt)
  local ground = game.ground

  self.dy = self.dy + GRAVITY_Y * dt
  self.y = self.y + self.dy * dt

  if game.keysPressed["space"] then self:jump() end

  -- Bird and ground collision
  if self.y + self.height/2 >= ground.y then
    self.y = ground.y - self.height/2
  end
end

function Bird:render()
  local G = love.graphics

  G.draw(self.sprite, self.x, self.y, 0, 1, 1, self.width/2, self.height/2)
end

function Bird:jump()
  self.dy = Bird.jumpDy
end

return Bird
