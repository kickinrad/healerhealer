-- Global Game Jam 2016

debug = true

require "text"
require "manual"
local inventory = require "inventory"
require "patient"
require "cauldron"
require "math"

function love.load()
  rng = love.math.newRandomGenerator()
  rng:setSeed(os.time())

  loadInv() -- load's inventory.buttons with names and positons
  loadPatient(2)
  loadManual()
  --loadButtons()
  loadSayings()
  loadCauldron()
end

function love.update(dt)
  if love.keyboard.isDown("space") then
    addToCauldron()
  end

  updateButtons(dt)
  updateDialogue(dt)
  updateManual(dt)
end

function love.draw()
  love.graphics.line(350, 0, 350, 600) -- split patient/inventory sections
  love.graphics.rectangle("line", inventory.box.x, inventory.box.y, inventory.box.w, inventory.box.h) -- inventory box
  love.graphics.rectangle("line", 350, 0, 450, 100) -- dialogue box

  -- inventory draws:
  drawInv() -- draws button text
  drawGrid() -- draws button grid

  -- dialogue draws:
  drawDialogue()

  -- patient draws:
  drawPatient()

  -- manual draws:
  drawManual()

  -- cauldron draws:
  drawCauldron()

  if debug then
    love.graphics.setColor(255, 0, 0, 255) -- set color to red
    love.graphics.print("X     Y", 5, 560)
    love.graphics.print(",", 22, 575)
    love.graphics.print(tostring(love.mouse.getX()), 5, 575) -- mouse x coords
    love.graphics.print(tostring(love.mouse.getY()), 30, 575) -- mouse y coords
    love.graphics.print(tostring(love.timer.getFPS()), 5, 5) -- fps
    testDrawCauldron() -- outputs array of ingredient aliases
    love.graphics.setColor(255, 255, 255, 255) -- set color back to white
  end
end
