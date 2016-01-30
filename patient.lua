patient = {
	ailments={skin = 0, head = 0},
	skin={k=nil, r=nil, g=nil, b=nil},
	shirt={r=nil, g=nil, b=nil},
	hair={r=nil, g=nil, b=nil},
	eyes={r=nil, g=nil, b=nil},
	pants={r=nil, g=nil, b=nil},
	shoes={r=nil, g=nil, b=nil}
}

function loadPatient()
	patient.skin.k=rng:random(-3,3)
	patient.skin.r=168.8+38.5*patient.skin.k
	patient.skin.g=122.5+32.1*patient.skin.k
	patient.skin.b=96.7+26.3*patient.skin.k

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
end

function drawPatient()
  skin=love.graphics.newImage("assets/character/skin.png")
  love.graphics.setColor(patient.skin.r,patient.skin.g,patient.skin.b,255)
  love.graphics.draw(skin, 580, 250, 0, 1, 1, 100, 100)
  shirt=love.graphics.newImage("assets/character/shirt.png")
  love.graphics.setColor(patient.shirt.r,patient.shirt.g,patient.shirt.b,255)
  love.graphics.draw(shirt, 580, 250, 0, 1, 1, 100, 100)
  pants=love.graphics.newImage("assets/character/pants.png")
  love.graphics.setColor(patient.pants.r,patient.pants.g,patient.pants.b,255)
  love.graphics.draw(pants, 580, 250, 0, 1, 1, 100, 100)
  shoes=love.graphics.newImage("assets/character/shoes.png")
  love.graphics.setColor(patient.shoes.r,patient.shoes.g,patient.shoes.b,255)
  love.graphics.draw(shoes, 580, 250, 0, 1, 1, 100, 100)
  eyes=love.graphics.newImage("assets/character/eyes.png")
  love.graphics.setColor(patient.eyes.r,patient.eyes.g,patient.eyes.b,255)
  love.graphics.draw(eyes, 580, 250, 0, 1, 1, 100, 100)
  hair=love.graphics.newImage("assets/character/hair.png")
  love.graphics.setColor(patient.hair.r,patient.hair.g,patient.hair.b,255)
  love.graphics.draw(hair, 580, 250, 0, 1, 1, 100, 100)
end