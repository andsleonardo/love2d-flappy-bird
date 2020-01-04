local windowScalingFactor = 0.4

local settings = {
  window = {
    title = "FlappyLÖVE",
    fullscreen = false,
    resizable = false,
    vsync = 1,
    width = 1280,
    height = 720,
  }
}

settings.window.gameDimensions = {
  width = settings.window.width * windowScalingFactor,
  height = settings.window.height * windowScalingFactor
}

return settings
