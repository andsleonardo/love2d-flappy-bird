local G = love.graphics
local push = gPush

local ui = {}

local function createFonts()
  return {
    small = G.newFont("assets/fonts/1980.ttf", 22),
    normal = G.newFont("assets/fonts/1980.ttf", 32),
    large = G.newFont("assets/fonts/1980.ttf", 40),
    title = G.newFont("assets/fonts/flappy.ttf", 52),
    timer = G.newFont('assets/fonts/flappy.ttf', 120)
  }
end

ui.fonts = createFonts()

function ui:addText(content, x, y, opts)
  local opts = opts or {}
  local font = opts.font or self.fonts.normal
  local width = opts.width or push:getWidth()
  local align = opts.align or "center"

  G.setFont(font)

  G.setColor(0, 0, 0, 1)
  G.printf(content, x, y + 2, width, align)

  G.setColor(1, 1, 1, 1)
  G.printf(content, x, y, width, align)
end

return ui
