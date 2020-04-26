require("src/constants")

local StateMachine = require('lib/StateMachine')
local TitleScreenState = require('src/states/TitleScreenState')
local PlayingState = require('src/states/PlayingState')
local ScoreState = require('src/states/ScoreState')
local GameOverState = require('src/states/GameOverState')
local CountdownState = require('src/states/CountdownState')

local Bird = require("src/classes/Bird")
local Ground = require("src/classes/Ground")

return function()
  game = {}

  local function setupStateMachine()
    return StateMachine({
      titleScreen = function() return TitleScreenState(game) end,
      countdown = function() return CountdownState(game) end,
      playing = function() return PlayingState(game) end,
      gameOver = function() return GameOverState(game) end,
      score = function() return ScoreState(game) end,
    })
  end

  game.stateMachine = setupStateMachine()

  function game:load()
    self.score = 0
    self.keysPressed = {}

    self.bird = Bird()
    self.ground = Ground()

    self.background = require("src/background")
    self.pipePairs = require("src/pipe_pairs")()
  end

  function game:update(dt)
    self.stateMachine:update(dt)
    self.keysPressed = {}
  end

  function game:render()
    self.stateMachine:render()
  end

  function game:goTo(stateName, opts)
    self.stateMachine:change(stateName, opts)
  end

  function game:reset()
    self:load()
    self:goTo('countdown', {})
  end

  game:load()
  game:goTo('titleScreen', {})

  return game
end
