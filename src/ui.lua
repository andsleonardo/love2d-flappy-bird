local ui = {}

local function createFonts()
  local G = love.graphics

  return {
    small = G.newFont("assets/fonts/monogram_extended.ttf", 16),
    normal = G.newFont("assets/fonts/flappy.ttf", 22),
    large = G.newFont("assets/fonts/monogram_extended.ttf", 30),
    title = G.newFont("assets/fonts/flappy.ttf", 42),
    timer = G.newFont('assets/fonts/flappy.ttf', 120)
  }
end

ui.fonts = createFonts()

return ui
