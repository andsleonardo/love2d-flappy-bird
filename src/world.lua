local P = love.physics
local gravityY = 200

local world = P.newWorld(0, gravityY, false)

return world
