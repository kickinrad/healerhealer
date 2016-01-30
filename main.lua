-- Global Game Jam 2016

debug = true

require "text"
inventory = require "inventory"
require "cauldron"

function love.load()
  loadInv() -- load's inventory.buttons with names and positons
end

function love.update(dt)
  if love.keyboard.isDown("space") then
    addToCauldron()
  end

  updateButtons(dt)
end

function love.draw()
  love.graphics.line(350, 0, 350, 600) -- split patient/inventory sections
  love.graphics.rectangle("line", inventory.box.x, inventory.box.y, inventory.box.w, inventory.box.h) -- inventory box
  love.graphics.rectangle("line", 350, 0, 450, 100) -- dialogue box
  love.graphics.rectangle("line", 350, 400, 450, 200) -- reference manual box

  -- inventory draws:
  drawInv() -- draws button text
  drawGrid() -- draws button grid
  if debug then
    love.graphics.setColor(255, 0, 0, 255) -- set color to red
    love.graphics.print("X     Y", 5, 560)
    love.graphics.print(",", 29, 575)
    love.graphics.print(tostring(love.mouse.getX()), 5, 575) -- mouse x coords
    love.graphics.print(tostring(love.mouse.getY()), 32, 575) -- mouse y coords
    love.graphics.print(tostring(love.timer.getFPS()), 5, 5) -- fps
    testDrawCauldron() -- outputs array of ingredient aliases
    love.graphics.setColor(255, 255, 255, 255) -- set color back to white
  end
end
