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
		"My skin is grey as ash, and my heart seems black as soot.", -- 1
		"The vibrance has fled from my bones! Not a cheer in sight.", -- 2
		"Dear healer, it seems my skin is as bleak as I.", -- 3
		"Am I not a sad sight, brother? This dull flesh dulls yet its owners heart.", -- 4
		"What a dreadful shade. Wrought no doubt by a spirit as wretched as its taste in colors.", -- 5
		"What a horrible night to have a curse." -- 6
	},
	redskin = {
		"Make haste, healer. My time is limited and my temper is low.", -- 1
		"My blood is boiling. I can scarcely see through this fierce red.", -- 2
		"With my skin as this, what sets me apart from unholy wretches below?", -- 3
		"My veins are fire. Please, healer, qwell this burning...", -- 4
		"I have never seeemed so... flustered. Dont flatter yourself, healer. It is not you." -- 5
	},
	sweating = {
		"I am soaked head to toe. My feverish fits grow graver by the day.", -- 1
		"God, what a wreck am I. Perhaps I am sweating out these vile spirits.", -- 2
		"Please, a drop of water, healer... I am so parched.", -- 3
		"My haze is frienzied, brother... Anything...Anything for respite from the nightmares...", -- 4
		"Please, a lasting care, healer. I have drenched all of my good attire." -- 5
	},
	bloodshot = {
		"I have forsaken sleep for days. These bleeding eyes simply cannot close.", -- 1
		"I cannot bear the site of you, healer. I swear it be my eyes speeking there, not I.", -- 2
		"All my sight is bathed in red. Does this shade not haunt your vision too, healer?" -- 3
	},
	sunken = {
		"I have seen portents, healer, terrible portents, etched into my eyes...", -- 1
		"Sleep is death, healer.", -- 2
		"These eyes have beared witness to wickedness, my healer. True wickedness." -- 3
	},
	welts = {
		"Can one ever leave a blemished fool such as I?", -- 1
		"What a twisted creature I have become. Bumps and boils as some sort of ogre." -- 2
	},
	spots = {
		"I can see constellations in my skin." -- 1
	}
}

local patTimerMax = 0.5
local patTimer = 0

function getDialogue()
	returnArray = {} -- return this table lmao

	-- change to if/else tree for later when adding patient ailment checks
	if patient.ailments.skin == "grey" then
		rand = rng:random(1, table.getn(dialogue.grey)) -- random number from 1 - value.size
		table.insert(returnArray, dialogue.grey[rand])
	end
	if patient.ailments.skin == "red" then
		rand = rng:random(1, table.getn(dialogue.redskin)) -- random number from 1 - value.size
		table.insert(returnArray, dialogue.redskin[rand])
	end
	if patient.ailments.sweating == 1 then
		rand = rng:random(1, table.getn(dialogue.sweating)) -- random number from 1 - value.size
		table.insert(returnArray, dialogue.sweating[rand])
	end
	if patient.ailments.bloodshot == 1 then
		rand = rng:random(1, table.getn(dialogue.bloodshot)) -- random number from 1 - value.size
		table.insert(returnArray, dialogue.bloodshot[rand])
	end
	if patient.ailments.sunken == 1 then
		rand = rng:random(1, table.getn(dialogue.sunken)) -- random number from 1 - value.size
		table.insert(returnArray, dialogue.sunken[rand])
	end
	if patient.ailments.welts == 1 then
		rand = rng:random(1, table.getn(dialogue.welts)) -- random number from 1 - value.size
		table.insert(returnArray, dialogue.welts[rand])
	end
	if patient.ailments.spots == 1 then
		rand = rng:random(1, table.getn(dialogue.spots)) -- random number from 1 - value.size
		table.insert(returnArray, dialogue.spots[rand])
	end

	-- return array of dialogue
	return returnArray
end

function loadPatient(difficulty)

	for i=1, difficulty do
  	--print("test")
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

function updatePatient(dt)
	if patTimer <=0 then
	 	finished = 0
  end
  if patTimer > 0 then
	 	patTimer = patTimer - (1 * dt)
	end
end

function drawPatient()
	if (finished==0) then
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
 if (patient.ailments.skin=="red") then table.insert(cures, {"Aloe", "Dove's Wing", "Olive Twig", "Rosemary", "Sow's Milk", 1}) end
 if (patient.ailments.skin=="grey") then table.insert(cures, {"Aloe", "Cat's Paw", "Cat's Paw", "Dragonfly's Wing", "Fox's Tail", 2}) end
 if (patient.ailments.sweating==1) then table.insert(cures, {"Ash", "Bog Water", "Rosemary", "Salt", "Vinegar",  3}) end
 if (patient.ailments.bloodshot==1) then table.insert(cures, {"Mandrake Root", "Sage's Eye", "Toad's Tongue", "Wheat", "Witch's Hair", 4}) end
 if (patient.ailments.sunken==1) then table.insert(cures, {"Fox's Tail", "Quail Egg", "Vinegar", "Vinegar", "Wolf Fang", 5}) end
 if (patient.ailments.welts==1) then table.insert(cures, {"Croc Scales", "Frog", "Mandrake Root", "Newt Tongue", "Rat's Tail", 6}) end
 if (patient.ailments.spots==1) then table.insert(cures, {"Cat's Paw", "Dahlia", "Familiar's Blood", "Wolf Fang", "Wolf Fang", 7}) end
 return cures
end

function cure(num)
	--print("trying to cure")
	--print("num:",num)
	if (num==1 or num ==2) then
		patient.ailments.skin=nil
		--print("ayy")
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
	if (patient.ailments.skin==nil and patient.ailments.sweating==0 and patient.ailments.bloodshot==0 and patient.ailments.sunken==0 and patient.ailments.welts==0 and patient.ailments.spots==0) then
		--patient is cured code here
		print("CURED!!!!")
		score = score+1
		finished = 1
		loadPatient(2)
		patTimer = patTimerMax

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
