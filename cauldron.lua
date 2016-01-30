-- cauldron.lua

cauldron = {}

function addToCauldron(x)
  --cauldron = cauldron .. x
  table.insert(cauldron, x)
end

function testDrawCauldron()
  love.graphics.print(cauldron, 5, 545)
end
