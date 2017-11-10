Rectangle = {}

function Rectangle.new(x, y, width, height, sprite) 
  local self = {}
  self.x = x
  self.y = y
  self.width = width
  self.height = height
  self.sprite = sprite
  
  self.dragging = {
    active = false,
    dx = 0,
    dy = 0
  }
  
  return self
end

function Rectangle.draw(self) 
  love.graphics.draw(tshirtsFile, self.sprite, self.x, self.y)
end