ui = require("src/ui")

local StateMachine = require('lib/StateMachine')
local TitleScreenState = require('src/states/TitleScreenState')
local PlayingState = require('src/states/PlayingState')
local ScoreState = require('src/states/ScoreState')
local GameOverState = require('src/states/GameOverState')
local CountdownState = require('src/states/CountdownState')

game = {}

fsm = StateMachine({
  titleScreen = function() return TitleScreenState() end,
  countdown = function() return CountdownState() end,
  playing = function() return PlayingState() end,
  gameOver = function() return GameOverState() end,
  score = function() return ScoreState() end,
})

function game:load()
  local Bird = require("src/classes/Bird")
  local Ground = require("src/classes/Ground")

  self.background = require("src/background")
  self.pipePairs = require("src/pipe_pairs")

  self.ground = Ground()
  self.bird = Bird()

  self.pipePairs:load()

  self.keysPressed = {}
  self.score = 0

  fsm:change('titleScreen', {})
end

function game:update(dt)
  fsm:update(dt)

  self.keysPressed = {}
end

function game:draw()
  self.background:render()
  self.bird:render()

  fsm:render()

  self.ground:render()
end
