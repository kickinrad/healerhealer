--[[ To commit from console/terminal:
	git add *
	git commit -m [I, include description of changes, Esc, shift + :, wq, enter]
	git tag -a [Version #]
	git push origin
--]]

function love.conf(t)
	t.title = "Global Game Jam 2016" -- The title of the window the game is in (string)
	t.version = "0.10.0"         -- The LÖVE version this game was made for (string)
	t.window.width = 800
	t.window.height = 600

	-- For Windows debugging
	t.console = false
end
