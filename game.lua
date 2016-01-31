message = ""

msgTimerMax = 2
msgTimer = 0
msgDisplay = 0

function updateGame(dt)
	if msgTimer <=0 then
	 	msgDisplay = 0
  end
  if msgTimer > 0 then
	 	msgTimer = msgTimer - (1 * dt)
	end
end

function drawMsg()
	if msgDisplay then
  	love.graphics.printf(message, 398, 360, 150)
	end
end

function setMsg(msg)
	msgDisplay = 1
	message = msg
	love.graphics.setFont(big_gothic)
  love.graphics.setColor(255, 255, 255, 255)
	msgTimer = msgTimerMax
end