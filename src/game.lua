local ui = require("src/ui")

game = {}

function game:load()
  local Bird = require("src/classes/Bird")
  local Ground = require("src/classes/Ground")

  setupPush()

  self.background = require("src/background")
  self.pipePairs = require("src/pipe_pairs")

  self.ground = Ground()
  self.bird = Bird()

  self.pipePairs:load()

  self.keysPressed = {}
  self.score = 0
  self.state = "startMenu"
end

function game:update(dt)
  if game.state == "startMenu" then
    self.background:update(dt)
    self.ground:update(dt)

    if self.keysPressed['space'] then
      game.state = "playing"
    end
  elseif game.state == "playing" then
    self.background:update(dt)
    self.pipePairs:update(dt)
    self.ground:update(dt)
    self.bird:update(dt)
  end

  self.keysPressed = {}
end

function game:draw()
  local G = love.graphics
  local push = gPush

  push:start()

  self.background:render()

  if self.state == "playing" then
    self.pipePairs:render()
    G.setFont(ui.fonts.title)
    G.setColor(0, 0, 0, 1)
    G.printf(self.score, 0, 17, push:getWidth() - 15, "right")
    G.setColor(1, 1, 1, 1)
    G.printf(self.score, 0, 15, push:getWidth() - 15, "right")
  elseif self.state == "gameOver" then
    self.pipePairs:render()
  end

  self.ground:render()
  self.bird:render()

  if self.state == "startMenu" then
    G.setFont(ui.fonts.title)
    G.setColor(
0, 0, 0, 1)
    G.printf("FlappyLOVE", 0, 32, push:getWidth(), "center")
    G.setColor(1, 1, 1, 1)
    G.printf("FlappyLOVE", 0, 30, push:getWidth(), "center")
  end

  push:finish()
end

function setupPush()
  local G = love.graphics
  local push = gPush

  local settings = require("src/settings")
  local window = settings.window
  local virtualWindow = window.gameDimensions

  G.setDefaultFilter("nearest", "nearest")

  push:setupScreen(
    virtualWindow.width, virtualWindow.height,
    window.width, window.height,
    {
      fullscreen = window.fullscreen,
      resizable = window.resizable
    }
  )
end
