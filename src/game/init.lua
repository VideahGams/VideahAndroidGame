game = {}
game.path = ... .. '/'

game.playername = "Untitled Player"

function game.load()

	game.menu = engine.script.require("menu")

	-- Set default state --
	engine.state.setState("splash")

	-- Splash Screen --
	engine.splash.addSplash(love.graphics.newImage("game/data/images/splashes/love.png"))
	engine.splash.onComplete(function() engine.state.setState("menu") end)

	-- Debug Vars --
	engine.panel.addVar("FPS", function() return _G.fps end)
	--engine.input.mouse.bind("l", "click")

	local buttonwidth = 500
	local buttonheight = 100
	local buttonx = (_G.screenWidth / 2) - (buttonwidth / 2)
	local buttony = 10

	game.menu.addButton("Play", function() engine.state.setState("game") end)
	game.menu.addButton("Options", function() print("TODO: Add Options Menu.") end)
	game.menu.addButton("Quit", function() love.event.quit() end)

end

function game.draw()

	if engine.state:isCurrentState("menu") then	
		
		love.graphics.setBackgroundColor(engine.uitheme.bg.color)

		game.menu.draw()

	end

	if engine.state:isCurrentState("game") then

		engine.camera:set()

			-- Game Draw Code Here --

		engine.camera:unset()

	end

end

function game.update(dt)

	if engine.state:isCurrentState("menu") then
		game.menu.update(dt)
	end

	if engine.state:isCurrentState("game") then

	end

end

function game.resize(w, h)

end

function game.mousepressed(x, y, button)

end
 
function game.mousereleased(x, y, button)

end
 
function game.keypressed(key, unicode)

end
 
function game.keyreleased(key)

end

function game.textinput(text)

end

return game