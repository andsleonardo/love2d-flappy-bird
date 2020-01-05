local tbl = require("lib/tbl")

local G = love.graphics

local background = {}

function createLayers()
  local BgLayer = require("src/classes/BgLayer")

  local G = love.graphics
  local FS = love.filesystem

  local layerFiles = FS.getDirectoryItems("assets/images/background/")

  return tbl.map(
    layerFiles,
    function(file, i)
      local img = G.newImage("assets/images/background/" .. file)
      return BgLayer(img, 150.0/i)
    end
  )
end

background.layers = createLayers()

function background:update(dt)
  tbl.each(self.layers, function(l) l:update(dt) end)
end

function background:render()
  tbl.reverseEach(self.layers, function(l) l:render() end)
end

return background
