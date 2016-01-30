big_gothic = love.graphics.newFont("gothic_pixel.ttf", 30) -- *keep these*
thin = love.graphics.newFont("thintel.ttf", 16)

dialogueBox = {
    x = 350,
    y = 0,
    w = 450,
    h = 100,
    backgroundDraw = false
}

patientSayings = {
  "Wowee, I am sick doc!",
  "Please fix my head, it hurts!",
  "I got eggs in my skin! Is there no cure? I tried everything!"
}

local buttonTimerMax = 0.2
local buttonTimer = 0

--function loadSayings()
--  stuff
--end

function updateDialogue(dt)
  -- if mouse clicks dialogueBox
  if love.mouse.getX() > dialogueBox.x and love.mouse.getX() < dialogueBox.x + dialogueBox.w and
    love.mouse.getY() > dialogueBox.y and love.mouse.getY() < dialogueBox.y + dialogueBox.h and
    love.mouse.isDown(1) and buttonTimer <= 0 then
      buttonTimer = buttonTimerMax
      dialogueBox.backgroundDraw = true -- set background draw to true
  end

  if buttonTimer <= 0 then -- if button timer runs out
     dialogueBox.backgroundDraw = false
  end

  -- decrement button Timer
  if buttonTimer > 0 then
    buttonTimer = buttonTimer - (1 *  dt)
  end
end

function drawDialogue()
  love.graphics.setFont(big_gothic)
  love.graphics.printf(patientSayings[3], 360, 5, 450)
  love.graphics.setFont(thin)
  if dialogueBox.backgroundDraw then
    love.graphics.setColor(255, 0, 0, 255)
    love.graphics.rectangle("fill", 350, 0, 450, 100)
    love.graphics.setColor(255, 255, 255, 255)
  end
end
