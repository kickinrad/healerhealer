big_gothic = love.graphics.newFont("gothic_pixel.ttf", 30)
thin = love.graphics.newFont("thintel.ttf", 16)

function writeDialog(dialog)
  love.graphics.setFont(big_gothic)
  love.graphics.printf(dialog, 360, 10, 430, "left")
end

function itemBox(item, x, y)
	love.graphics.rectangle("line", x, y, 45, 45)
	love.graphics.setFont(thin)
	love.graphics.printf(item, x+5, y+10, 35, "center")
end