require("src/constants")

local StateMachine = require('lib/StateMachine')
local TitleScreenState = require('src/states/TitleScreenState')
local PlayingState = require('src/states/PlayingState')
local ScoreState = require('src/states/ScoreState')
local GameOverState = require('src/states/GameOverState')
local CountdownState = require('src/states/CountdownState')

local Bird = require("src/classes/Bird")
local Ground = require("src/classes/Ground")

local function setupStateMachine()
  return StateMachine({
    titleScreen = function() return TitleScreenState() end,
    countdown = function() return CountdownState() end,
    playing = function() return PlayingState() end,
    gameOver = function() return GameOverState() end,
    score = function() return ScoreState() end,
  })
end

return function()
  game = {}

  function game:load()
    game.background = require("src/background")
    game.pipePairs = require("src/pipe_pairs")

    game.score = 0
    game.keysPressed = {}
    game.bird = Bird()
    game.ground = Ground()

    game.pipePairs:load()

    game.stateMachine = setupStateMachine()
    game:goTo('titleScreen', {})

    return game
  end

  function game:update(dt)
    self.stateMachine:update(dt)
    self.keysPressed = {}
  end

  function game:render()
    self.background:render()
    self.bird:render()

    self.stateMachine:render()

    self.ground:render()
  end

  function game:goTo(stateName, opts)
    self.stateMachine:change(stateName, opts)
  end

  return game:load()
end
