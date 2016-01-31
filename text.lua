big_gothic = love.graphics.newFont("gothic_pixel.ttf", 30) -- *keep these*
thin = love.graphics.newFont("thintel.ttf", 16)

dialogueBox = {
    x = 350,
    y = 0,
    w = 450,
    h = 100,
    backgroundDraw = false
}

--[[patientSayings = {
  "Wowee, I am sick doc!",
  "Please fix my head, it hurts!",
  "I got eggs in my skin! Is there no cure? I tried everything!"
}--]]

patientSayings = {}

local buttonTimerMax = 0.2
local buttonTimer = 0

function loadSayings()
 --load all sayings from patient and store in patient sayings to be displayed
 patientSayings = getDialogue()
end

local i = 1

function updateDialogue(dt)
  -- if mouse clicks dialogueBox
  if love.mouse.getX() > dialogueBox.x and love.mouse.getX() < dialogueBox.x + dialogueBox.w and
    love.mouse.getY() > dialogueBox.y and love.mouse.getY() < dialogueBox.y + dialogueBox.h and
    love.mouse.isDown(1) and buttonTimer <= 0 then
      buttonTimer = buttonTimerMax
      dialogueBox.backgroundDraw = true -- set background draw to true
      if i < table.getn(patientSayings) then
        i = i + 1
      elseif i >= table.getn(patientSayings) then
        i = 1
      end
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
  if dialogueBox.backgroundDraw then -- if clicked draw background
    love.graphics.setColor(255, 0, 0, 150) -- set color to red
    love.graphics.rectangle("fill", 350, 0, 450, 100)
    love.graphics.setColor(255, 255, 255, 255)
  end

  love.graphics.setFont(big_gothic)
  love.graphics.printf(patientSayings[i], 360, 5, 440)
  love.graphics.setFont(thin)
  love.graphics.printf(i, 360, 75, 50)
  love.graphics.printf("/", 365, 75, 50)
  love.graphics.printf(table.getn(patientSayings), 370, 75, 50)
end
