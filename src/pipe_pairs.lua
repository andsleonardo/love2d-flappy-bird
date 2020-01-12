local tbl = gTbl

local Pipe = require("src/classes/Pipe")
local PipePair = require("src/classes/PipePair")

local pipePairs = {}

function pipePairs:load()
  local push = gPush

  self.spawnCountdown = 2
  self.gapY = math.random(Pipe.minHeight, push:getHeight() - game.ground.height - Pipe.minHeight)
end

function pipePairs:update(dt)
  self.spawnCountdown = self.spawnCountdown - dt

  if self.spawnCountdown < 0 then
    self:spawn()
    self.spawnCountdown = 2
  end

  tbl.each(self, function(pair, i) pair:update(dt) end)

  tbl.each(
    self,
    function(pair, i)
      if pair.destroy then table.remove(self, i) end
    end
  )
end

function pipePairs:render()
  tbl.each(self, function(pair) pair:render() end)
end

function pipePairs:spawn()
  self.gapY = math.random(30, 120)

  table.insert(self, PipePair(self.gapY, self.gapY + PipePair.gap))
end

return pipePairs
