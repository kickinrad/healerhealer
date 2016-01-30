--[[ manual.lua

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
