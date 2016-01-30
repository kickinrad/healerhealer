-- Global Game Jam 2016

debug = true

require "inventory"

function love.load()

end

function love.update(dt)

end

function love.draw()
  love.graphics.line(350, 0, 350, 600) -- split patient/inventory sections
  love.graphics.rectangle("line", 25, 25, 300, 300) -- inventory box -- extend to left and top edges
  love.graphics.rectangle("line", 350, 0, 450, 100) -- dialogue box
  love.graphics.rectangle("line", 350, 400, 450, 200) -- reference manual box
  if debug then
    love.graphics.print(tostring(love.timer.getFPS()), 5, 5) -- fps
    love.graphics.setColor(255, 0, 0, 255)
    love.graphics.print("X     Y", 5, 560)
    love.graphics.print(tostring(love.mouse.getX()), 5, 575) -- mouse x coords
    love.graphics.print(",", 29, 575)
    love.graphics.print(tostring(love.mouse.getY()), 32, 575) -- mouse x coords
    love.graphics.setColor(255, 255, 255, 255)
  end
end
