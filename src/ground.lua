local settings = require("src/settings")

local G = love.graphics
local virtualWindow = settings.window.gameDimensions

local ground = {
  img = G.newImage("assets/images/ground.png")
}

function ground:load()
  local P = love.physics
  local G = love.graphics

  self.ox = 0
  self.dx = 200
  self.loopAt = self.img:getWidth()

  self.body = P.newBody(game.world, 0, virtualWindow.height, "static")
  self.shape = P.newRectangleShape(self:getWidth(), self:getHeight())
  self.fixture = P.newFixture(self.body, self.shape)
end

function ground:update(dt)
  self.ox = (self.ox + self.dx * dt) % self.loopAt
end

function ground:render()
  local G = love.graphics

  G.draw(self.img, 0, self:getY() - self:getHeight(), 0, 1, 1, self.ox)
  G.draw(self.img, self:getWidth(), self:getY() - self:getHeight(), 0, 1, 1, self.ox)
end

function ground:getX() return self.body:getX() end
function ground:getY() return self.body:getY() end

function ground:getWidth() return self.img:getWidth() end
function ground:getHeight() return self.img:getHeight() end

return ground
