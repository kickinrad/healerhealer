-- manual.lua

manual = {
  buttons = {},
  introRead = false,
  pageNumberMax = 14,
  pageNumber = 1,
  dps = {
    { -- 1
      left = {
        title = "Grimoire of Solomon",
        description = "\tAn account of ailments and disease of strange and unnatural character.\n\tThe blind many seem undeterred by the many grave and terrible spirits who dwell beneath the hallowed ground.\n\tThey come in pilgrammage, they come for refuge, they come for trade.\n\tWeak souls and strong souls alike, they come, they sicken, they wretch, they go mad, they fall.\n\tYou may, in your time, have heard talk of the medicine man Solomon, the great Witch Doctor of Ludistan. I am he, but I am not so great as they would have you think."
      },
      right = {
        title = "",
        description = "\tMany a patient of mine have died after my best efforts, my most exhaustive treatment. Nothing you will find in these pages will surely cure yours. Treatment and prayer are the best you can do.\n\tI have documented within every illness I have thus encountered, and the most suitable treatments I have discovered for each.\n\tYou will not save many. You may not even save most. The sooner you come to terms with that, the sooner you will master your craft."
      }
    },
    { -- 2
      left = {
        title = "",
        description = "\n\n\n\n\tDo not be afraid. Keep your will strong and your heart stronger yet."
      },
      right = {
        title = "",
        description = "\n\n\n\n\tLest you join the carcasses and cadavers..."
      }
    },
    { -- 3 table of contents
      left = {
        title = "Table of Contents\nS",
        description = "\n\t    ymptoms:\n\n\t- Greyed Skin\n\n\t- Red Skin\n\n\t- Sweating\n\n\t- Bloodshot Eyes\n\n\t- Sunken Eyes\n\n\t- Welts\n\n\t- Pox\n" -- coughing, shivers, lost hair, rashes, gaunt features
      },
      right = {
        title = "\n\nT",
        description = "\n\t    reatments:\n\n\t- Balm of Vigor\n\n\t- Balm of Soothing\n\n\t- Cooling Tincture\n\n\t- Mesmer's Medicine\n\n\t- Enlivening Tincture\n\n\t- Blemishing Balm\n\n\t- Solomon's Tincture"
      }
    },
    { -- 4
      left = {
        title = "Greyed Skin",
        description = "\n\tCured by: Balm of Vigor" -- coughing, shivers, lost hair, rashes, gaunt features
      },
      right = {
        title = "",
        description = ""
      }
    },
    { -- 5
      left = {
        title = "Red Skin",
        description = "\n\tCured by: Balm of Soothing" -- coughing, shivers, lost hair, rashes, gaunt features
      },
      right = {
        title = "",
        description = ""
      }
    },
    { -- 6
      left = {
        title = "Sweating",
        description = "\n\tCured by: Cooling Tincture" -- coughing, shivers, lost hair, rashes, gaunt features
      },
      right = {
        title = "",
        description = ""
      }
    },
    { -- 7
      left = {
        title = "Bloodshot Eyes",
        description = "\n\tCured by: Mesmer's Medicine" -- coughing, shivers, lost hair, rashes, gaunt features
      },
      right = {
        title = "",
        description = ""
      }
    },
    { -- 8
      left = {
        title = "Sunken Eyes",
        description = "\n\tCured by: Enlivening Tincture" -- coughing, shivers, lost hair, rashes, gaunt features
      },
      right = {
        title = "",
        description = ""
      }
    },
    { -- 9
      left = {
        title = "Welts",
        description = "\n\tCured by: Blemishing Balm" -- coughing, shivers, lost hair, rashes, gaunt features
      },
      right = {
        title = "",
        description = ""
      }
    },
    { -- 10
      left = {
        title = "Pox",
        description = "\n\tCured by: Solomon's Tincture" -- coughing, shivers, lost hair, rashes, gaunt features
      },
      right = {
        title = "",
        description = ""
      }
    },
    { -- 11
      left = {
        title = "Balm of Vigor",
        description = "\t- Aloe\n\n\t- Dragonfly Wing\n\n\t- Fox's Tail\n\n\t- Cat's Paw x 2" -- coughing, shivers, lost hair, rashes, gaunt features
      },
      right = {
        title = "Balm of Soothing",
        description = "\n\t- Aloe\n\n\t- Olive Twin\n\n\t- Dove's Wing\n\n\t- Rosemary\n\n\t- Sow's Milk"
      }
    },
    { -- 12
      left = {
        title = "Cooling Tincture",
        description = "\n\t- Salt\n\n\t- Vinegar\n\n\t- Ash\n\n\t- Bog Water\n\n\t- Rosemary" -- coughing, shivers, lost hair, rashes, gaunt features
      },
      right = {
        title = "Mesmer s Medicine",
        description = "\n\t- Sage's Eye\n\n\t- Witch's Hair\n\n\t- Mandrake Root\n\n\t- Toad's Tongue\n\n\t- Wheat"
      }
    },
    { -- 13
      left = {
        title = "Enlivening Tincture",
        description = "\n\t- Wolf's Fang\n\n\t- Vinegar x 2\n\n\t- Fox's Tail\n\n\t- Quail Egg" -- coughing, shivers, lost hair, rashes, gaunt features
      },
      right = {
        title = "Blemishing Balm",
        description = "\n\t- Newt Tongue\n\n\t- Croc Scales\n\n\t- Rat's Tail\n\n\t- Frog\n\n\t- Mandrake Root"
      }
    },
    { -- 14
      left = {
        title = "Solomon s Tincture",
        description = "\n\t- Familiar's Blood\n\n\t- Wolf's Fang x 2\n\n\t- Dahlia\n\n\t- Cat's Paw" -- coughing, shivers, lost hair, rashes, gaunt features
      },
      right = {
        title = "",
        description = ""
      }
    }
  }
}

local buttonTimerMax = 0.2
local buttonTimer = 0

function addButton(xPos, yPos, width, height, textName)
    newButton = {x = xPos, y = yPos, w = width, h = height, text = textName, backgroundDraw = false}
    table.insert(manual.buttons, newButton)
end

function loadManual()
  soundPageTurn = love.audio.newSource("assets/sounds/pageturn.wav")
  soundPageTurn:setVolume(.3)
  manualImage = love.graphics.newImage("assets/book.png")
  addButton(575, 345, 200, 255, "right") -- right page button
  addButton(690, 319, 110, 10, "toc") -- table of contents

  greySkinI = love.graphics.newImage("assets/gImages/greyboy.png")
  redSkinI = love.graphics.newImage("assets/gImages/redboy.png")
  sweatI = love.graphics.newImage("assets/gImages/wet.png")
  bloodshotI = love.graphics.newImage("assets/gImages/bs.png")
  sunkenI = love.graphics.newImage("assets/gImages/sink.png")
  weltsI = love.graphics.newImage("assets/gImages/weltboy.png")
  spotsI = love.graphics.newImage("assets/gImages/spotboy.png")
end

function updateManual(dt)
  -- key presses left and right
    -- manual.pageNumber = manual.pageNumber + 1 (cant go over pageNumberMax, and cant be less than 1)
    -- manual.pageNumber = manual.pageNumber - 1

  for _, button in ipairs(manual.buttons) do
    if love.mouse.getX() > button.x and love.mouse.getX() < button.x + button.w and
    love.mouse.getY() > button.y and love.mouse.getY() < button.y + button.h and
    love.mouse.isDown(1) and buttonTimer <= 0 then
      if button.text == "right" then
        manual.pageNumber = manual.pageNumber + 1
        love.audio.play(soundPageTurn)
      elseif button.text == "left" then
        manual.pageNumber = manual.pageNumber - 1
        love.audio.play(soundPageTurn)
      elseif button.text == "grey" then
        love.audio.play(soundClick)
        manual.pageNumber = 4
      elseif button.text == "redskin" then
        love.audio.play(soundClick)
        manual.pageNumber = 5
      elseif button.text == "sweat" then
        manual.pageNumber = 6
        love.audio.play(soundClick)
      elseif button.text == "bloodshot" then
        manual.pageNumber = 7
        love.audio.play(soundClick)
      elseif button.text == "sunken" then
        manual.pageNumber = 8
        love.audio.play(soundClick)
      elseif button.text == "welts" then
        manual.pageNumber = 9
        love.audio.play(soundClick)
      elseif button.text == "redspots" then
        manual.pageNumber = 10
        love.audio.play(soundClick)
      elseif button.text == "vigor" or button.text == "soothing" then
        manual.pageNumber = 11
        love.audio.play(soundClick)
      elseif button.text == "cooling" or button.text == "mesmer" then
        manual.pageNumber = 12
        love.audio.play(soundClick)
      elseif button.text == "enlivening" or button.text == "blemish" then
        manual.pageNumber = 13
        love.audio.play(soundClick)
      elseif button.text == "whip" then
        manual.pageNumber = 14
        love.audio.play(soundClick)
      elseif button.text == "toc" then
        manual.pageNumber = 3
        love.audio.play(soundClick)
      end

      buttonTimer = buttonTimerMax
      manual.buttons = {}
      addButton(690, 319, 110, 10, "toc")
      if manual.pageNumber == 1 then
        addButton(575, 345, 200, 255, "right") -- right page button
      elseif manual.pageNumber == 2 then
        addButton(575, 345, 200, 255, "right") -- right page button
        addButton(375, 345, 200, 255, "left") -- left page button
      elseif manual.pageNumber == 3 then -- table of contents
        -- add a ton of buttons
        addButton(730, 345, 40, 255, "right") -- right page button
        addButton(375, 345, 35, 255, "left") -- left page button

        -- symptoms
        addButton(410, 444, 135, 10, "grey") -- grey skin 22 difference in pixels on the y axis
        addButton(410, 466, 135, 10, "redskin") -- red skin
        addButton(410, 488, 135, 10, "sweat") -- sweating
        addButton(410, 510, 135, 10, "bloodshot") -- bloodshot eyes
        addButton(410, 532, 135, 10, "sunken") -- sunken eyes
        addButton(410, 554, 135, 10, "welts") -- welts
        addButton(410, 576, 135, 10, "redspots") -- red spots

        addButton(590, 444, 135, 10, "vigor") -- grey skin 22 difference in pixels on the y axis
        addButton(590, 466, 135, 10, "soothing")
        addButton(590, 488, 135, 10, "cooling")
        addButton(590, 510, 135, 10, "mesmer")
        addButton(590, 532, 135, 10, "enlivening")
        addButton(590, 554, 135, 10, "blemish")
        addButton(590, 576, 135, 10, "whip")
      elseif manual.pageNumber >= 4 and manual.pageNumber <= 13 then
        addButton(575, 345, 200, 255, "right") -- right page button
        addButton(375, 345, 200, 255, "left") -- left page button
      elseif manual.pageNumber == 14 then -- !!!last page!!!
        addButton(375, 345, 200, 255, "left") -- left page button
      end
    end

    if love.mouse.getX() > button.x and love.mouse.getX() < button.x + button.w and
    love.mouse.getY() > button.y and love.mouse.getY() < button.y + button.h then
      button.backgroundDraw = true
    else
      button.backgroundDraw = false
    end
  end

  -- decrement button Timer
  if buttonTimer > 0 then
    buttonTimer = buttonTimer - (1 *  dt)
  end
end

function drawManual()
  love.graphics.setColor(255, 255, 255, 255)
  love.graphics.draw(manualImage, 451, 400, 0, 1, 1, 100, 100)



  love.graphics.setFont(blokk)
  blokk:setLineHeight(2) -- default is 1
  if manual.pageNumber == 4 then
    love.graphics.draw(greySkinI, 680, 480, 0, 1, 1, 100, 100)
    love.graphics.setColor(0, 0, 0, 200)
    love.graphics.printf("\tLorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi. Nulla quis sem at nibh elementum imperdiet. Duis sagittis ipsum. Praesent mauris. Fusce nec tellus sed augue semper porta. Mauris massa. Vestibulum lacinia arcu eget nulla. Class ", 398, 450, 150)
    love.graphics.setColor(255, 255, 255, 255)
  end
  if manual.pageNumber == 5 then
    love.graphics.draw(redSkinI, 680, 480, 0, 1, 1, 100, 100)
    love.graphics.setColor(0, 0, 0, 200)
    love.graphics.printf("\tCurabitur tortor. Pellentesque nibh. Aenean quam. In scelerisque sem at dolor. Maecenas mattis. Sed convallis tristique sem. Proin ut ligula vel nunc egestas porttitor. Morbi lectus risus, iaculis vel, suscipit quis, luctus non, massa. Fusce ac turpis quis ligula lacinia aliquet. Mauris ipsum. Nulla metus metus, lipsummm", 398, 450, 150)
    love.graphics.setColor(255, 255, 255, 255)
  end
  if manual.pageNumber == 6 then
    love.graphics.draw(sweatI, 680, 480, 0, 1, 1, 100, 100)
    love.graphics.setColor(0, 0, 0, 200)
    love.graphics.printf("\tNam nec ante. Sed lacinia, urna non tincidunt mattis, tortor neque adipiscing diam, a cursus ipsum ante quis turpis. Nulla facilisi. Ut fringilla. Suspendisse potenti. Nunc feugiat mi a tellus consequat imp", 398, 450, 150)
    love.graphics.setColor(255, 255, 255, 255)
  end
  if manual.pageNumber == 7 then
    love.graphics.draw(bloodshotI, 680, 480, 0, 1, 1, 100, 100)
    love.graphics.setColor(0, 0, 0, 200)
    love.graphics.printf("\tLorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi. Nulla quis sem at nibh elementum imperdiet. Duis sagittis ipsum. Praesent mauris. Fusce nec tellus sed augue semper porta. Mauris massa. Vestibulum lacinia arcu eget nulla. Class ", 398, 450, 150)
    love.graphics.setColor(255, 255, 255, 255)
  end
  if manual.pageNumber == 8 then
    love.graphics.draw(sunkenI, 680, 480, 0, 1, 1, 100, 100)
    love.graphics.setColor(0, 0, 0, 200)
    love.graphics.printf("\tNam nec ante. Sed lacinia, urna non tincidunt mattis, tortor neque adipiscing diam, a cursus ipsum ante quis turpis. Nulla facilisi. Ut fringilla. Suspendisse potenti. Nunc feugiat mi a tellus consequat imp", 398, 450, 150)
    love.graphics.setColor(255, 255, 255, 255)
  end
  if manual.pageNumber == 9 then
    love.graphics.draw(weltsI, 680, 480, 0, 1, 1, 100, 100)
    love.graphics.setColor(0, 0, 0, 200)
    love.graphics.printf("\tLorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi. Nulla quis sem at nibh elementum imperdiet. Duis sagittis ipsum. Praesent mauris. Fusce nec tellus sed augue semper porta. Mauris massa. Vestibulum lacinia arcu eget nulla. Class ", 398, 450, 150)
    love.graphics.setColor(255, 255, 255, 255)
  end
  if manual.pageNumber == 10 then
    love.graphics.draw(spotsI, 680, 480, 0, 1, 1, 100, 100)
    love.graphics.setColor(0, 0, 0, 200)
    love.graphics.printf("\tNam nec ante. Sed lacinia, urna non tincidunt mattis, tortor neque adipiscing diam, a cursus ipsum ante quis turpis. Nulla facilisi. Ut fringilla. Suspendisse potenti. Nunc feugiat mi a tellus consequat imp", 398, 450, 150)
    love.graphics.setColor(255, 255, 255, 255)
  end

  for _, button in ipairs(manual.buttons) do
    if button.backgroundDraw then
      love.graphics.setColor(0, 0, 0, 15) -- light grey
      love.graphics.rectangle("fill", button.x, button.y, button.w, button.h)
    end
    if button.backgroundDraw and button.text == "toc" then
      love.graphics.setColor(255, 0, 0, 150) -- red
      love.graphics.rectangle("fill", button.x, button.y, button.w, button.h)
    end
  end

  love.graphics.setColor(255, 255, 255, 255)
  love.graphics.setFont(big_gothic)
  love.graphics.setColor(0, 0, 0, 255)
  love.graphics.printf(manual.dps[manual.pageNumber].left.title, 398, 360, 150)
  love.graphics.printf(manual.dps[manual.pageNumber].right.title, 600, 360, 150)
  love.graphics.setFont(thin)
  love.graphics.printf(manual.dps[manual.pageNumber].left.description, 398, 410, 150)
  love.graphics.printf(manual.dps[manual.pageNumber].right.description, 600, 410, 150)
  love.graphics.setColor(255, 255, 255, 255)
  love.graphics.printf("Table of Contents", 695, 318, 150)
end
