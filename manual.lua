-- manual.lua

manual = {
  buttons = {},
  introRead = false,
  pageNumber = 1,
  dps = {
    { -- 1
      left = {
        title = "Grimoire of Solomon",
        description = "\tAn account of ailments and disease of strange and unnatural character.\n\tThe blind many seem undeterred by the many grave and terrible spirits who dwell beneath the hollowed ground.\n\tThey come in pilgrammage, they come for refuge, they come for trade.\n\tWeak souls and strong souls alike, they come, they sicken, they wretch, they go mad, they fall.\n\tYou may in your time, have heard talk of the medicine man Solomon, the great Witch Doctor of Ludistan. I am he, but I am not so great as they would have you think."
      },
      right = {
        title = "",
        description = "\tMany a patient of mine have died after my best efforts, my most exhaustive treatment. Nothing you will find in these pages will surely cure yours. Treatment and prays are the best you can do.\n\tI have documented within every illness I have thus encountered, and the worst suitable treatments I have discovered for each.\n\tYou will not save many. You may not even save most. The sooner you come to terms with that, the sooner you will master your craft."
      }
    },
    { -- 2
      left = {
        title = "",
        description = "\n\n\n\n\tDo not be afraid. Keep your will strong and your heart stronger yet."
      },
      right = {
        title = "",
        description = "\n\n\n\n\tLest you joing the carcasses and cadavers..."
      }
    },
  }
}

local buttonTimerMax = 0.2
local buttonTimer = 0

function addButton(xPos, yPos, width, height, textName)
    newButton = {x = xPos, y = yPos, w = width, h = height, text = textName, backgroundDraw = false}
    table.insert(manual.buttons, newButton)
end

function loadManual()
  manualImage = love.graphics.newImage("assets/book.png")
  addButton(575, 380, 200, 255, "") -- right page button
end

function updateManual(dt)
  for _, button in ipairs(manual.buttons) do
    if love.mouse.getX() > button.x and love.mouse.getX() < button.x + button.w and
    love.mouse.getY() > button.y and love.mouse.getY() < button.y + button.h and
    love.mouse.isDown(1) and buttonTimer <= 0 then
      buttonTimer = buttonTimerMax
      manual.buttons = {}
      manual.pageNumber = manual.pageNumber + 1
    end
  end

  -- decrement button Timer
  if buttonTimer > 0 then
    buttonTimer = buttonTimer - (1 *  dt)
  end
end

function drawManual()
  love.graphics.setColor(255, 255, 255, 255)
  love.graphics.draw(manualImage, 453, 400, 0, 1, 1, 100, 100)
  love.graphics.setFont(big_gothic)
  love.graphics.setColor(0, 0, 0, 255)
  love.graphics.printf(manual.dps[manual.pageNumber].left.title, 398, 360, 150)
  love.graphics.printf(manual.dps[manual.pageNumber].right.title, 600, 360, 150)
  love.graphics.setFont(thin)
  love.graphics.printf(manual.dps[manual.pageNumber].left.description, 398, 410, 150)
  love.graphics.printf(manual.dps[manual.pageNumber].right.description, 600, 410, 150)
  love.graphics.setColor(255, 255, 255, 255)

  for _, button in ipairs(manual.buttons) do
    love.graphics.rectangle("line", button.x, button.y, button.w, button.h)
  end

end


--[[
manual = {
  open = false,
  mainMenu = false,
  buttons = {}
}

local buttonTimerMax = 0.2
local buttonTimer = 0

function addButton(xPos, yPos, width, height, textName)
    newButton = {x = xPos, y = yPos, w = width, h = height, text = textName, backgroundDraw = false}
    table.insert(manual.buttons, newButton)
end

function loadButtons()
  --addButton()
  addButton(730, 530, 70, 70, "Grimoire")
end

function updateManual(dt)
  for _, button in ipairs(manual.buttons) do
    -- if mouse over button, draw background
    -- if display manual button is clicked, add 4 buttons to buttons array (diseases ailments treatments and close X))
    if manual.open == false and love.mouse.getX() > button.x and love.mouse.getX() < button.x + button.w and
      love.mouse.getY() > button.y and love.mouse.getY() < button.y + button.h and love.mouse.isDown(1) and buttonTimer <= 0 then
        buttonTimer = buttonTimerMax
        manual.open = true
        manual.buttons = {}
        -- add 4 buttons
        addButton(350, 400, 150, 200, "Diseases")
        addButton(500, 400, 150, 200, "Ailments")
        addButton(650, 400, 150, 200, "Treatments")
    elseif manual.open then
      --awdawd
    end
  end

  -- decrement button Timer
  if buttonTimer > 0 then
    buttonTimer = buttonTimer - (1 *  dt)
  end
end

function drawMenuGrid()
  --if manual.open == false then
    -- display manual button bottom right
    --love.graphics.rectangle("line", 730, 530, 70, 70)
    for _, button in ipairs(manual.buttons) do
      love.graphics.rectangle("line", button.x, button.y, button.w, button.h)
      love.graphics.printf(button.text, button.x, button.y, button.w)
    end
  --end

  --[[if manual.open then
    if manual.mainMenu then -- mode,  x,   y,   w,   h
      love.graphics.rectangle("line", 350, 400, 150, 200)
      love.graphics.rectangle("line", 500, 400, 150, 200)
      love.graphics.rectangle("line", 650, 400, 150, 200)
    end

  end]]
--end
