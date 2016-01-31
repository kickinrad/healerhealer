-- inventory.lua

local inventory = {
  box = {
    x = 0,
    y = 0,
    w = 350,
    h = 350
  },
  buttons = {},
  lastItemAdded = ""
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
  addIngredient(140, 0, "Sage's Eye", "ey") --ey
  addIngredient(210, 0, "Dahlia", "fl") -- fl
  addIngredient(280, 0, "Wheat", "wh") -- wh
  -- second row:
  addIngredient(0, 70, "Olive Twig", "ot") -- ot
  addIngredient(70, 70, "Sow's Milk", "gm") -- gm
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
  addIngredient(70, 210, "Rat's Tail", "rt") -- rt
  addIngredient(140, 210, "Ash", "as") -- as
  addIngredient(210, 210, "Dove's Wing", "dw") -- dw
  addIngredient(280, 210, "Dragonfly's Wing", "df") -- df

  -- fifth row:
  addIngredient(0, 280, "Mandrake Root", "mr") -- da
  addIngredient(70, 280, "Fox's Tail", "ft") -- ft
  addIngredient(140, 280, "Toad's Tongue", "tt") -- tt
  addIngredient(210, 280, "Cat's Paw", "cp")-- cat's eye
  addIngredient(280, 280, "Familiar's Blood", "fb") -- bb

  -- treatment buttons
  addIngredient(280, 530, "Treat", "")
end

function updateButtons(dt)
  -- checks for mouse clicks
  for _, button in ipairs(inventory.buttons) do
    if love.mouse.getX() > button.x and love.mouse.getX() < button.x + button.w and
      love.mouse.getY() > button.y and love.mouse.getY() < button.y + button.h and
      love.mouse.isDown(1) and buttonTimer <= 0 then
        if button.text == "Treat" then -- if the player clicks Treat
          button.backgroundDraw = true
          buttonTimer = buttonTimerMax
          inventory.lastItemAdded = ""
          treatPatient()
        elseif table.getn(cauldron) ~= 5 then
          addToCauldron(button.text)
          inventory.lastItemAdded = button.text
          button.backgroundDraw = true
          buttonTimer = buttonTimerMax
        else
          print("Cauldron Full!")
          button.backgroundDraw = true
          buttonTimer = buttonTimerMax
        end
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
  for _, button in ipairs(inventory.buttons) do
    if button.backgroundDraw then
      love.graphics.setColor(255, 0, 0, 150)
      love.graphics.rectangle("fill", button.x, button.y, button.w, button.h)
      love.graphics.setColor(255, 255, 255, 255)
      -- continue drawing object
    end
    love.graphics.setFont(thin)
    love.graphics.printf(button.text, button.x+3, button.y+25, button.w-6, "center")
  end

  -- draw last item added
  love.graphics.printf(inventory.lastItemAdded, 145, 555, 70, "center")
end

return inventory
