local class = require("lib/middleclass/middleclass")

local BgLayer = class('BgLayer')

function BgLayer:initialize(image, dx, loopAt)
  self.image = image
  self.dx = dx
  self.loopAt = image:getWidth()
  self.x = 0
  self.y = 0
end

function BgLayer:render()
  local G = love.graphics
  G.draw(self.image, self.x, self.y, 0, 0.5, 0.5, self.ox, 0)
end

return BgLayer
