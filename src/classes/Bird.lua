local G = love.graphics
local A = love.audio
local class = gClass

local Bird = class('Bird')

function createImage()
  return G.newImage("assets/sprites/bird.png")
end

Bird.static.sprite = createImage()
Bird.static.jumpDy = -200
Bird.static.sounds = {
  flap = A.newSource('assets/sfx/bird-flap.wav', 'static'),
  hurt = A.newSource('assets/sfx/bird-hurt.wav', 'static')
}

function Bird:initialize()
  local push = gPush

  self.sprite = Bird.sprite

  self.x = push:getWidth()/2
  self.y = push:getHeight()/2

  self.dy = 0

  self.width, self.height = self.sprite:getDimensions()
end

function Bird:update(dt)
  self.dy = self.dy + GRAVITY_Y * dt
  self.y = self.y + self.dy * dt

  -- Bird and ground collision
  local ground = game.ground

  if self.y + self.height/2 >= ground.y then
    self.y = ground.y - self.height/2
  end

  for _, pair in ipairs(game.pipePairs) do
    for _, pipe in ipairs(pair.pipes) do
      -- Bird and pipes collision
      local collidedInY
      local collidedInX = self.x + self.width/2 >= pair.x and
        self.x - self.width/2 <= pair.x + pipe.width

      if pipe.sy == 1 then
        collidedInY = self.y + self.height/2 >= pipe.y
      elseif pipe.sy == -1 then
        collidedInY = self.y - self.height/2 <= pipe.y
      end

      if collidedInY and collidedInX then
        Bird.static.sounds.hurt:play()
        game:goTo("gameOver")
      end

      -- Bird scoring after going through gap
      if not pair.beaten then
        if self.x > pair.x + pipe.width then
          game.score = game.score + 1
          pair.beaten = true
        end
      end
    end
  end

  if game.keysPressed["space"] then self:flap() end
end

function Bird:render()
  G.draw(self.sprite, self.x, self.y, 0, 1, 1, self.width/2, self.height/2)
end

function Bird:flap()
  self.dy = Bird.jumpDy
  Bird.static.sounds.flap:play()
end

return Bird
