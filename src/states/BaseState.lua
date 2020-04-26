--[[
  GD50 2018
  Match-3 Remake
  -- BaseState Class --
  https://github.com/cs50/gd50/blob/master/flappy-bird/states/BaseState.lua
  Author: Colton Ogden
  cogden@cs50.harvard.edu
  Used as the base class for all of our states, so we don't have to
  define empty methods in each of them. StateMachine requires each
  State have a set of four "interface" methods that it can reliably call,
  so by inheriting from this base state, our State classes will all have
  at least empty versions of these methods even if we don't define them
  ourselves in the actual classes.
]]

local class = gClass
local game = game

local BaseState = class('BaseState')

function BaseState:initialize(handler)
  self.handler = handler

  return self
end

function BaseState:enter()
end

function BaseState:exit() end
function BaseState:update(dt) end
function BaseState:render() end

return BaseState
