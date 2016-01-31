-- Global Game Jam 2016

debug = false

require "text"
require "manual"
local inventory = require "inventory"
require "patient"
require "cauldron"
require "math"
require "game"

gameStart = false

startButton = {
  x = 315,
  y = 215,
  w = 175,
  h = 50,
  text = "Start",
  drawBackground = false
}

function love.load()
  musicForest = love.audio.newSource("assets/sounds/forest.ogg", stream)
  soundBell = love.audio.newSource("assets/sounds/belltoll.wav", static)
  rng = love.math.newRandomGenerator()
  rng:setSeed(os.time())
  score = 0
  finished = 0

  loadInv() -- load's inventory.buttons with names and positons
  loadPatient(1)
  loadManual()
  --loadButtons()
  loadSayings()
  loadCauldron()
end

function love.update(dt)
  if not musicForest:isPlaying() then
    love.audio.play(musicForest)
  end

  if love.keyboard.isDown("space") then
    --addToCauldron()
    -- call treat button
  end

  updateManual(dt)

  if gameStart then
    updateButtons(dt)
    updateDialogue(dt)

    updatePatient(dt)
    updateGame(dt)
  end

  if gameStart == false then
    -- button clickable
    if love.mouse.getX() > startButton.x and love.mouse.getX() < startButton.x + startButton.w and
      love.mouse.getY() > startButton.y and love.mouse.getY() < startButton.y + startButton.h and
      love.mouse.isDown(1) then
        gameStart = true
        setMsg("              Day 1")
        love.audio.play(soundBell)
    end
  end

end

function love.draw()
  --love.graphics.line(350, 0, 350, 600) -- split patient/inventory sections
  --love.graphics.rectangle("line", inventory.box.x, inventory.box.y, inventory.box.w, inventory.box.h) -- inventory box
  --love.graphics.rectangle("line", 350, 0, 450, 100) -- dialogue box

  if gameStart then
    -- inventory draws:
    drawInv() -- draws button text
    drawGrid() -- draws button grid

    -- dialogue draws:
    drawDialogue()

    -- patient draws:
    drawPatient()
  end
    -- manual draws:
    drawManual()

  if gameStart then
    -- cauldron draws:
    drawCauldron()

    -- message draw
    drawMsg()

    -- game draws:
    drawRoundEnd()
  end

  if gameStart == false then
    -- draw button
    if love.mouse.getX() > startButton.x and love.mouse.getX() < startButton.x + startButton.w and
      love.mouse.getY() > startButton.y and love.mouse.getY() < startButton.y + startButton.h then
        love.graphics.setColor(255, 0, 0, 150)
        love.graphics.rectangle("fill", startButton.x, startButton.y, startButton.w, startButton.h)
        love.graphics.setColor(255, 255, 255, 255)
        love.graphics.rectangle("line", startButton.x + 5, startButton.y + 5, startButton.w - 10, startButton.h - 10)
    end
    love.graphics.setFont(titleFont)
    love.graphics.printf("Healer, Healer", 200, 100, 500)
    love.graphics.setFont(big_gothic)
    love.graphics.printf(startButton.text, 377, 225, 200)
    love.graphics.setFont(thin)
  end

  if debug then
    love.graphics.setColor(255, 0, 0, 255) -- set color to red
    love.graphics.print("X     Y", 5, 560)
    love.graphics.print(",", 22, 575)
    love.graphics.print(tostring(love.mouse.getX()), 5, 575) -- mouse x coords
    love.graphics.print(tostring(love.mouse.getY()), 30, 575) -- mouse y coords
    love.graphics.print(tostring(love.timer.getFPS()), 5, 5) -- fps
    love.graphics.print(score, 20,5)
    testDrawCauldron() -- outputs array of ingredient aliases
    love.graphics.setColor(255, 255, 255, 255) -- set color back to white
  end
end
