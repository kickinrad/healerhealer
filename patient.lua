patient = {
	ailments={skin=nil, sweating=1, bloodshot=1, sunken=1, welts=0, spots=1},
	skin={k=nil, r=nil, g=nil, b=nil, img=love.graphics.newImage("assets/character/skin.png")},
	shirt={r=nil, g=nil, b=nil, img=love.graphics.newImage("assets/character/shirt.png")},
	hair={r=nil, g=nil, b=nil, img=love.graphics.newImage("assets/character/hair.png")},
	eyes={r=nil, g=nil, b=nil, img=love.graphics.newImage("assets/character/eyes.png")},
	pants={r=nil, g=nil, b=nil, img=love.graphics.newImage("assets/character/pants.png")},
	shoes={r=nil, g=nil, b=nil, img=love.graphics.newImage("assets/character/shoes.png")}
}
ailments = {
	spots=love.graphics.newImage("assets/character/spots.png"),
	sweating=love.graphics.newImage("assets/character/sweating.png"),
	welts=love.graphics.newImage("assets/character/welts.png"),
	sunken=love.graphics.newImage("assets/character/sunken.png"),
	bloodshot=love.graphics.newImage("assets/character/bloodshot.png")
}

function loadPatient(difficulty)

	--for i=1,6 do
		--print(patients.ailments[i])
  
  --for ailment, value in pairs(patient.ailments) do
  --	print(ailment, value)
  --end

  
  if(patient.ailments.skin=="red") then
  	patient.skin.r=163
		patient.skin.g=92
		patient.skin.b=85
  elseif (patient.ailments.skin=="grey") then
  	patient.skin.r=192
		patient.skin.g=192
		patient.skin.b=192
  else
		patient.skin.k=rng:random(-3,3)
		patient.skin.r=168.8+38.5*patient.skin.k
		patient.skin.g=122.5+32.1*patient.skin.k
		patient.skin.b=96.7+26.3*patient.skin.k
	end
	patient.shirt.r=rng:random(1,255)
	patient.shirt.g=rng:random(1,255)
	patient.shirt.b=rng:random(1,255)

	patient.hair.r=rng:random(100,150)
	patient.hair.g=rng:random(60,80)
	patient.hair.b=rng:random(10,30)

	patient.eyes.r=rng:random(10,40)
	patient.eyes.g=rng:random(10,40)
	patient.eyes.b=rng:random(10,40)

	patient.pants.r=rng:random(1,255)
	patient.pants.g=rng:random(1,255)
	patient.pants.b=rng:random(1,255)

	patient.shoes.r=rng:random(1,255)
	patient.shoes.g=rng:random(1,255)
	patient.shoes.b=rng:random(1,255)

	if(patient.ailments.skin=="red") then
		patient.skin.r=233
		patient.skin.g=98
		patient.skin.b=98
	end
end

function drawPatient()
  love.graphics.setColor(patient.skin.r,patient.skin.g,patient.skin.b,255)
  love.graphics.draw(patient.skin.img, 580, 250, 0, 1, 1, 100, 100)

  drawAilments()

  love.graphics.setColor(patient.shirt.r,patient.shirt.g,patient.shirt.b,255)
  love.graphics.draw(patient.shirt.img, 580, 250, 0, 1, 1, 100, 100)
  love.graphics.setColor(patient.pants.r,patient.pants.g,patient.pants.b,255)
  love.graphics.draw(patient.pants.img, 580, 250, 0, 1, 1, 100, 100)
  love.graphics.setColor(patient.shoes.r,patient.shoes.g,patient.shoes.b,255)
  love.graphics.draw(patient.shoes.img, 580, 250, 0, 1, 1, 100, 100)
  
  love.graphics.setColor(patient.hair.r,patient.hair.g,patient.hair.b,255)
  love.graphics.draw(patient.hair.img, 580, 250, 0, 1, 1, 100, 100)
end

function drawAilments()
	if(patient.ailments.spots==1) then
  love.graphics.setColor(130,0,0,190)
  love.graphics.draw(ailments.spots, 580, 250, 0, 1, 1, 100, 100)
	end
	if(patient.ailments.sweating==1) then
	love.graphics.setColor(185,238,251,180)
  love.graphics.draw(ailments.sweating, 580, 250, 0, 1, 1, 100, 100)
	end
	if(patient.ailments.welts==1) then
	love.graphics.setColor(205,78,78,160)
  love.graphics.draw(ailments.welts, 580, 250, 0, 1, 1, 100, 100)
	end
	if(patient.ailments.sunken==1) then
	love.graphics.setColor(0,0,0,80)
  love.graphics.draw(ailments.sunken, 580, 250, 0, 1, 1, 100, 100)
	end
	if(patient.ailments.bloodshot==1) then
	love.graphics.setColor(208,77,64,200)
  love.graphics.draw(ailments.bloodshot, 580, 250, 0, 1, 1, 100, 100)
	else
  love.graphics.setColor(patient.eyes.r,patient.eyes.g,patient.eyes.b,255)
  love.graphics.draw(patient.eyes.img, 580, 250, 0, 1, 1, 100, 100)
	end
end