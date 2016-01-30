patient = {
	ailments={skin = 0, head = 0},
	skin={r=math.random(255), g=math.random(255), r=math.random(255)}
}

function loadPatient()
	--quad = love.graphics.newQuad(0,0,0,1,1,200,200)
	body=love.graphics.newImage("assets/character/base.png")
	--love.graphics.draw(body,quad,200,200)
	love.graphics.draw(body, 100, 100, math.rad(90), 1, 1, 100, 100)
end

function drawPatient()
  --[[body=love.graphics.newImage("assets/character/skin.png")
  love.graphics.setColor(217,160,102,255)
  love.graphics.draw(body, 580, 250, 0, 1, 1, 100, 100)
  body=love.graphics.newImage("assets/character/shirt.png")
  love.graphics.setColor(math.random(255),math.random(255),math.random(255),255)
  love.graphics.draw(body, 580, 250, 0, 1, 1, 100, 100)
  hair=love.graphics.newImage("assets/character/hair.png")
  love.graphics.setColor(143,86,59,255)
  love.graphics.draw(hair, 580, 250, 0, 1, 1, 100, 100)
  eyes=love.graphics.newImage("assets/character/eyes.png")
  love.graphics.setColor(20,20,20,255)
  love.graphics.draw(eyes, 580, 250, 0, 1, 1, 100, 100)
  pants=love.graphics.newImage("assets/character/pants.png")
  love.graphics.setColor(math.random(255),math.random(255),math.random(255),255)
  love.graphics.draw(pants, 580, 250, 0, 1, 1, 100, 100)
  shoes=love.graphics.newImage("assets/character/shoes.png")
  love.graphics.setColor(math.random(255),math.random(255),math.random(255),255)
  love.graphics.draw(shoes, 580, 250, 0, 1, 1, 100, 100)]]--
  skin=love.graphics.newImage("assets/character/skin.png")
  love.graphics.setColor(patient.skin.r,patient.skin.g,patient.skin.b,255)
  love.graphics.draw(patient.body, 580, 250, 0, 1, 1, 100, 100)
end