local tshirtsFile
local tshirtsSprites = {}

function love.load(arg)
  -- Debug mode activation
  if arg and arg[#arg] == "-debug" then require("mobdebug").start() end
  
  -- Assets loading
  tshirtsFile = love.graphics.newImage("assets/tshirts.png")
  tshirtsSprites[1] = love.graphics.newQuad(0, 0, 54, 52, tshirtsFile:getDimensions())
  tshirtsSprites[2] = love.graphics.newQuad(55, 0, 54, 52, tshirtsFile:getDimensions())
  tshirtsSprites[3] = love.graphics.newQuad(110, 0, 54, 52, tshirtsFile:getDimensions())
  tshirtsSprites[4] = love.graphics.newQuad(165, 0, 54, 52, tshirtsFile:getDimensions())
  
end


function love.draw()
  
  love.graphics.draw(tshirtsFile, tshirtsSprites[1], 10, 100)
  love.graphics.draw(tshirtsFile, tshirtsSprites[2], 100, 100)
  love.graphics.draw(tshirtsFile, tshirtsSprites[3], 200, 100)
  love.graphics.draw(tshirtsFile, tshirtsSprites[4], 300, 100)
  
end
