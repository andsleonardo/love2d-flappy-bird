local class = require("lib/middleclass/middleclass")
local settings = require("src/settings")

local virtualWindow = settings.window.gameDimensions

local Bird = class('Bird')

function Bird:initialize()
  local G = love.graphics

  self.sprite = G.newImage("assets/sprites/bird.png")
  self.width = self.sprite:getWidth()
  self.height = self.sprite:getHeight()
  self.x = virtualWindow.width/2 - self.width/2
  self.y = virtualWindow.height/2 - self.height/2
end

function Bird:render()
  local G = love.graphics

  G.draw(self.sprite, self.x, self.y)
end

return Bird
