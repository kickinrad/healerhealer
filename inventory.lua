-- inventory.lua

local inventory = {
  box = {
    x = 0,
    y = 0,
    w = 350,
    h = 350
  },
  buttons = {}
}

local bounds = {
  width   = 350,
  height  = 350,
  left    = 0,
  top     = 0,
  rows    = 5,
  columns = 5
}

local buttonTimerMax = 0.2
local buttonTimer = 0

local function addIngredient(xPos, yPos, textName, nName)
  newButton = {x = xPos, y = yPos, w = 70, h = 70, text = textName, alias = nName, backgroundDraw = false}
  table.insert(inventory.buttons, newButton)
end

function loadInv()
  -- first row:
  addIngredient(0, 0, "Frog", "fr") --fr
  addIngredient(70, 0, "Salt", "sa")--sa
  addIngredient(140, 0, "Eyeball", "ey") --ey
  addIngredient(210, 0, "Flower", "fl") -- fl
  addIngredient(280, 0, "Wheat", "wh") -- wh
  -- second row:
  addIngredient(0, 70, "Olive Twig", "ot") -- ot
  addIngredient(70, 70, "Goat Milk", "gm") -- gm
  addIngredient(140, 70, "Bog Water", "bw") -- bw
  addIngredient(210, 70, "Aloe", "al") -- al
  addIngredient(280, 70, "Witch's Hair", "wi") -- wi
  -- third row:
  addIngredient(0, 140, "Newt Tongue", "nt") --nt
  addIngredient(70, 140, "Croc Scales", "cs") -- cs
  addIngredient(140, 140, "Vinegar", "vi") -- vi
  addIngredient(210, 140, "Wolf Fang", "wf") -- wf
  addIngredient(280, 140, "Quail Egg", "qe") -- qe
  -- fourth row:
  addIngredient(0, 210, "Rosemary", "ro") --ro
  addIngredient(70, 210, "Rats Tail", "rt") -- rt
  addIngredient(140, 210, "Ash", "as") -- as
end

function updateButtons(dt)
  -- checks for mouse clicks
  for i, button in ipairs(inventory.buttons) do
    if love.mouse.getX() > button.x and love.mouse.getX() < button.x + button.w and
      love.mouse.getY() > button.y and love.mouse.getY() < button.y + button.h and
      love.mouse.isDown(1) and buttonTimer <= 0 then
        addToCauldron(button.alias)
        button.backgroundDraw = true
        buttonTimer = buttonTimerMax
        -- spawn object to fall into cauldron
      elseif buttonTimer <= 0 then
        button.backgroundDraw = false
      end
  end

  -- decrement button Timer
  if buttonTimer > 0 then
    buttonTimer = buttonTimer - (1 *  dt)
  end
end

function drawGrid()
  local columnWidth = bounds.width / bounds.columns
  for x=1, bounds.columns do
    love.graphics.line(x*columnWidth, 0, x*columnWidth, bounds.height)
  end
  local rowHeight = bounds.height / bounds.rows
  for y=1, bounds.rows do
    love.graphics.line(0, y*rowHeight, bounds.width, y*rowHeight)
  end
end

function drawInv()
  for i, button in ipairs(inventory.buttons) do
    if button.backgroundDraw then
      love.graphics.setColor(255, 0, 0, 255)
      love.graphics.rectangle("fill", button.x, button.y, button.w, button.h)
      love.graphics.setColor(255, 255, 255, 255)
      -- continue drawing object
    end
    love.graphics.setFont(thin)
    love.graphics.printf(button.text, button.x+3, button.y+25, button.w-6, "center")
  end
end

return inventory
