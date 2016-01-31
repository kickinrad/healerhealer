message = ""

population = 200
saved = 0
deaths = 0

days = 0

roundTimerMax = 120
roundTimer = 120 -- should 120
roundEnd = false

roundEndTimerMax = 7
roundEndTimer = 0

gameover = false

gameoverTimer = 20

msgTimerMax = 2.0
msgTimer = 0
msgDisplay = false

function updateGame(dt)
	if msgTimer <= 0 then
	 	msgDisplay = false
  end
  if msgTimer > 0 then
	 	msgTimer = msgTimer - (1 * dt)
	end

	-- decrement roundTimer
	if roundTimer > 0 and gameover == false then
		roundTimer = roundTimer - (1 * dt)
	end

	if roundTimer <= 0 and roundEnd == false and gameover == false then
		roundEnd = true
		roundEndTimer = roundEndTimerMax
		loadPatient(1)
		days = days + 1
		saved = score
		score = 0
		deaths = rng:random(1,10)

		if deaths > saved then
			deaths = deaths - saved
			population = population - deaths
		end
	end

	if roundEndTimer > 0 and gameover == false then
		roundEndTimer = roundEndTimer - (1 * dt)
	end

	if roundEndTimer <= 0 and roundEnd == true and gameover == false then
		roundEnd = false
		roundTimer = roundTimerMax
	end

	if population <= 0 then
		gameover = true
		if love.keyboard.isDown("space") then
			love.load()
		end
	end

	if gameover then
		gameoverTimer = gameoverTimer - (1 * dt)
	end

end

function drawMsg()
	if msgDisplay then
		love.graphics.setFont(big_gothic)
  	love.graphics.printf(message, 455, 110, 300)
		love.graphics.setFont(thin)
	end
end

--function drawSplashScreen()
	-- if true
		--love.graphics.setFont(big_gothic)
		--love.graphics.printf("Starting game...", 455, 110, 300)
	-- end
--end

function drawRoundEnd()
	if roundEnd then
		love.mouse.setVisible(false)
		love.mouse.setPosition(0,0)
		----
		love.graphics.setColor(0, 0, 0, 255)
		love.graphics.rectangle("fill", 200, 100, 400, 270)
		love.graphics.setColor(255, 255, 255, 255)
		love.graphics.rectangle("line", 205, 105, 390, 260)
		love.graphics.setFont(big_gothic)
		love.graphics.printf("End of day...",  340, 110, 300)
		love.graphics.printf(tostring(saved), 500, 150, 200)
		love.graphics.printf("People Saved.....", 250, 150, 200)
		love.graphics.printf("Population..........", 250, 200, 200)
		love.graphics.printf(tostring(population), 500, 200, 200)
		love.graphics.printf("Deaths.................", 250, 250, 200)
		love.graphics.printf(tostring(deaths), 500, 250, 200)
		love.graphics.printf("Day......................", 250, 300, 200)
		love.graphics.printf(tostring(days), 500, 300, 200)
		love.graphics.setFont(thin)
	elseif roundEnd == false then
		love.mouse.setVisible(true)
	end

	if gameover then
		love.graphics.setColor(0, 0, 0, 255)
		love.graphics.rectangle("fill", 200, 100, 400, 200)
		love.graphics.setColor(255, 255, 255, 255)
		love.graphics.rectangle("line", 205, 105, 390, 190)
		love.graphics.setFont(big_gothic)
		love.graphics.printf("Game Over",  340, 180, 300)
		love.graphics.setFont(thin)

		if gameoverTimer <= 0 then
			love.window.close()
		end
	end
end

function setMsg(msg)
	msgDisplay = true
	message = msg
	love.graphics.setFont(big_gothic)
  love.graphics.setColor(255, 255, 255, 255)
	msgTimer = msgTimerMax
end
