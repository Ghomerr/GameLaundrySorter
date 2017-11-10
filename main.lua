require "rectangle"

tshirtsFile = {}
tshirtsSprites = {}
rectanglesList = {}


function love.load(arg)
  -- Debug mode activation
  if arg and arg[#arg] == "-debug" then require("mobdebug").start() end
  
  -- Assets loading
  tshirtsFile = love.graphics.newImage("assets/tshirts.png")
  tshirtsSprites[1] = love.graphics.newQuad(0, 0, 54, 52, tshirtsFile:getDimensions())
  tshirtsSprites[2] = love.graphics.newQuad(55, 0, 54, 52, tshirtsFile:getDimensions())
  tshirtsSprites[3] = love.graphics.newQuad(110, 0, 54, 52, tshirtsFile:getDimensions())
  tshirtsSprites[4] = love.graphics.newQuad(165, 0, 54, 52, tshirtsFile:getDimensions())
  
  -- TShirts models loading
  rectanglesList[1] = Rectangle.new( 10, 100, 54, 52, tshirtsSprites[1])
  rectanglesList[2] = Rectangle.new(100, 100, 54, 52, tshirtsSprites[2])
  rectanglesList[3] = Rectangle.new(200, 100, 54, 52, tshirtsSprites[3])
  rectanglesList[4] = Rectangle.new(300, 100, 54, 52, tshirtsSprites[4])
  
end

function love.draw()
  for i=1,4 do
    -- Drawing thisrts
    Rectangle.draw(rectanglesList[i])
  end
end

function love.update(dt)
  for i=1,4 do
    if rectanglesList[i].dragging.active then
      -- Updating current dragged rectangle with mouse position
      rectanglesList[i].x = love.mouse.getX() - rectanglesList[i].dragging.dx
      rectanglesList[i].y = love.mouse.getY() - rectanglesList[i].dragging.dy
    end
  end
end


function love.mousepressed(x, y, button, istouch)
  for i=1,4 do
    -- Detect which rectangle is pressed by the mouse
    if button == 1 and x > rectanglesList[i].x and x < rectanglesList[i].x + rectanglesList[i].width and y > rectanglesList[i].y and y < rectanglesList[i].y + rectanglesList[i].height then
      -- Drag'n'drop init for current rect
      rectanglesList[i].dragging.active = true
      rectanglesList[i].dragging.dx = x - rectanglesList[i].x
      rectanglesList[i].dragging.dy = y - rectanglesList[i].y
    end
  end
end

function love.mousereleased(x, y, button)
  for i=1,4 do
    if button == 1 and rectanglesList[i].dragging.active then
      -- Drag'n'drop stop for dragged rect
      rectanglesList[i].dragging.active = false
    end
  end
end

