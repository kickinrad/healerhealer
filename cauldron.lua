-- cauldron.lua

cauldron = {}

testPatient = {"fr","fr","rt","ey","nt"}

local sortTreatment = function (a, b) return a < b end

function loadCauldron()
  caulFront = love.graphics.newImage("assets/character/cauldront_front.png")
  caulBack = love.graphics.newImage("assets/character/cauldron_back.png")
  logs = love.graphics.newImage("assets/character/logs.png")
  fire = love.graphics.newImage("assets/character/fire.png")
  soundGrunt = love.audio.newSource("assets/sounds/grunt.wav", static)
end

function addToCauldron(x)
  table.insert(cauldron, x)
end

function treatPatient()
  --print("We're gonna treat ya lmao")
  --table.sort(testPatient, sortTreatment)
  table.sort(cauldron, sortTreatment)

  if table.getn(cauldron) == 0 then
    --print("You didn't do anything!")
    return
  end

  status = false
  wasCured = false
  curesNeeded = getCures()

  for n=1, table.getn(curesNeeded) do
	  for i=1,table.getn(curesNeeded[n])-1 do
	    if curesNeeded[n][i] == cauldron[i] then
	      status = true
	    else
	      status = false
	      break
	    end
	  end

	  if status then

	    print(curesNeeded[n][1])
	    cure(curesNeeded[n][table.getn(curesNeeded[n])])
      wasCured = true
	  end
	end

  if wasCured == false then
    love.audio.play(soundGrunt)
    killPatient()
  end
  cauldron = {} -- empty cauldron
end

function drawCauldron()
  love.graphics.draw(logs, 225, 500, 0, 1, 1, 100, 100)

  love.graphics.draw(caulFront, 225, 500, 0, 1, 1, 100, 100)
  love.graphics.draw(fire, 225, 500, 0, 1, 1, 100, 100)
  love.graphics.draw(caulBack, 225, 500, 0, 1, 1, 100, 100)

  if table.getn(cauldron) >= 5 then
    love.graphics.setFont(big_gothic)
    love.graphics.printf("Cauldron is full!", 100, 360, 200)
    love.graphics.setFont(thin)
  end
end

function testDrawCauldron(asd)
  love.graphics.print(cauldron, 5, 545)
  --love.graphics.print(testPatient, 550, 300)
end
