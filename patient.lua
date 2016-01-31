patient = {
	ailments={skin=nil, sweating=0, bloodshot=0, sunken=0, welts=0, spots=0},
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

dialogue = {
	grey = {
		"I look like a skeleton!", -- 1
		"I don't feel that great...", -- 2
		"You ever watch Daredevil on Netflix? That shit rocks!", -- 3
		"Yo! Google Dunk De La Mort, it's wild!", -- 4
		"You ever watch X-Files? I feel like I have a pretty good chance of being casted.", -- 5
		"I'm kinda like Elvis from Perfect Dark right now...", -- 6
		"I got a 2 litre of Mountain Dew, you want some dawg?", -- 7
		"I'm grey daba dee daba di", -- 8
		"Beep boop bop, I am a robot!", -- 9
		"This is the 10th message for the grey dialogue option." -- 10
	},
	redskin = {
		"I got the red skin doc, lmao", -- 1
		"Help me please.", -- 2
		"Can you check out this mole on my back?", -- 3
		"Go Cleveland!", -- 4
		"I love that 70s Show!", -- 5
		"This game was made in 48 hours, pretty cool, huh?", -- 6
		"Kid Rock is one of my all time heroes.", -- 7
		"This game is kinda like Theme Hospital, but it hurts more.", -- 8
		"Lemme see that Grimoire!", -- 9
		"This is the 10th message for the red skin dialogue option." -- 10
	}
}

function getDialogue()
	returnArray = {} -- return this table lmao

	for dialogue, value in pairs(dialogue) do
		rand = rng:random(1, table.getn(value)) -- random number from 1 - value.size
		table.insert(returnArray, value[rand])
	end
	-- return array of dialogue
	return returnArray
end

function loadPatient(difficulty)

	for i=1, difficulty do
  	print("test")
  	done = 0
  	while (done==0) do
	  	rand = rng:random(1,7)
	  	if (rand==1 and patient.ailments.skin==nil) then
	  		patient.ailments.skin="red"
	  		done = 1
	  	end
	  	if (rand==2 and patient.ailments.skin==nil) then
	  		patient.ailments.skin="grey"
	  		done = 1
	  	end
	  	if (rand==3 and patient.ailments.sweating==0) then
	  		patient.ailments.sweating=1
	  		done = 1
	  	end
	  	if (rand==4 and patient.ailments.bloodshot==0) then
	  		patient.ailments.bloodshot=1
	  		done = 1
	  	end
	  	if (rand==5 and patient.ailments.sunken==0) then
	  		patient.ailments.sunken=1
	  		done = 1
	  	end
	  	if (rand==6 and patient.ailments.welts==0) then
	  		patient.ailments.welts=1
	  		done = 1
	  	end
	  	if (rand==7 and patient.ailments.spots==0) then
	  		patient.ailments.spots=1
	  		done = 1
	  	end
  	end
  end


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

function getCures()
 cures = {}
 if (patient.ailments.skin=="red") then table.insert(cures, {"ey", "fr", "sa", 1}) end
 if (patient.ailments.skin=="grey") then table.insert(cures, {"fl", "ot", "wh", 2}) end
 if (patient.ailments.sweating==1) then table.insert(cures, {"al", "bw", "gm", 3}) end
 if (patient.ailments.bloodshot==1) then table.insert(cures, {"cs", "nt", "wi", 4}) end
 if (patient.ailments.sunken==1) then table.insert(cures, {"qe", "vi", "wf", 5}) end
 if (patient.ailments.welts==1) then table.insert(cures, {"as", "ro", "rt", 6}) end
 if (patient.ailments.spots==1) then table.insert(cures, {"al", "fl", "ot", 7}) end
 return cures
end

function cure(num)
	print("trying to cure")
	print("num:",num)
	if (num==1 or num ==2) then
		patient.ailments.skin=nil
		print("ayy")
		fixSkin()
	end
	if (num==3) then
		patient.ailments.sweating=0
		fixSkin()
	end
	if (num==4) then patient.ailments.bloodshot=0 end
	if (num==5) then patient.ailments.sunken=0 end
	if (num==6) then patient.ailments.welts=0 end
	if (num==7) then patient.ailments.spots=0 end
	drawPatient()
	drawAilments()
	return checkIfCured()
end

function checkIfCured()
	if (patient.ailments.skin==nil and patient.ailments.sweating and patient.ailments.bloodshot and patient.ailments.sunken and patient.ailments.welts and patient.ailments.spots) then
		--patient is cured code here
		return 1
	end
	return 0
end

function fixSkin()
	patient.skin.k=rng:random(-3,3)
	patient.skin.r=168.8+38.5*patient.skin.k
	patient.skin.g=122.5+32.1*patient.skin.k
	patient.skin.b=96.7+26.3*patient.skin.k
end
