local windowScalingFactor = 1

local settings = {
  window = {
    title = "FlappyLÖVE",
    fullscreen = false,
    resizable = false,
    vsync = 1,
    width = 992,
    height = 749,
  }
}

settings.window.gameDimensions = {
  width = settings.window.width * windowScalingFactor,
  height = settings.window.height * windowScalingFactor
}

return settings
