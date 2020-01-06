local class = require("lib/middleclass/middleclass")

local Bird = class('Bird')

function Bird:initialize()
  local G = love.graphics
  local P = love.physics

  local settings = require("src/settings")
  local virtualWindow = settings.window.gameDimensions

  self.sprite = G.newImage("assets/sprites/bird.png")

  local x = virtualWindow.width/2 - self.sprite:getWidth()/2
  local y = virtualWindow.height/2 - self.sprite:getHeight()/2

  self.body = P.newBody(game.world, x, y, "dynamic")
  self.shape = P.newCircleShape(self.sprite:getWidth())
  self.fixture = P.newFixture(self.body, self.shape)
end

function Bird:update(dt)
  if game.keysPressed["space"] then
    local _, linearVelY = self.body:getLinearVelocity()
    if linearVelY > 0 then
      self.body:applyLinearImpulse(0, -800)
    end
  end
end

function Bird:render()
  local G = love.graphics

  G.draw(self.sprite, self:getX(), self:getY())
end

function Bird:getX() return self.body:getX() end
function Bird:getY() return self.body:getY() end

return Bird
