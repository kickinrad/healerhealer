-- cauldron.lua

cauldron = {}

testPatient = {"fr","fr","rt","ey","nt"}

local sortTreatment = function (a, b) return a < b end

function addToCauldron(x)
  table.insert(cauldron, x)
end

function treatPatient()
  print("We're gonna treat ya lmao")
  table.sort(testPatient, sortTreatment)
  table.sort(cauldron, sortTreatment)

  if table.getn(cauldron) == 0 then
    print("You didn't do anything!")
    return
  end

  status = false
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
	    print("Treated symptom!!!")
	    print(curesNeeded[n][1])
	    cure(curesNeeded[n][table.getn(curesNeeded[n])])
	  else
	    print("Symptom not treated")
	  end
	end
  cauldron = {} -- empty cauldron
end

function testDrawCauldron(asd)
  love.graphics.print(cauldron, 5, 545)
  love.graphics.print(testPatient, 550, 300)
end
