game = {}
player = {}
player.wheel = {}

function game.load()

	game.isDown = false

	player.wheel.image = love.graphics.newImage("data/images/gamecircle.png")
	player.wheel.scale = 0.5
	player.wheel.width = player.wheel.image:getWidth() * player.wheel.scale
	player.wheel.height = player.wheel.image:getHeight() * player.wheel.scale
	player.wheel.x = (global.screenWidth / 2)
	player.wheel.y = (global.screenHeight / 2)
	player.wheel.r = 0
	player.wheel.roffset = 0

	game.score = 0

end

function game.draw()

	love.graphics.setColor(menu.color)
	love.graphics.rectangle( "fill", 0, 0, global.screenWidth, global.screenHeight ) -- Background
	love.graphics.setColor(255, 255, 255)

	player.wheel.draw()

end

function game.update(dt)

	if game.isDown then

		if ui.getBoolean(1) == false then

			local angle = math.atan2(global.mouseX - player.wheel.x, global.mouseY - player.wheel.y)

			player.wheel.r = (player.wheel.roffset - angle)

		end

	end

end

function game.mousepressed(x, y, button)

	if ui.getBoolean(1) == false then

		local angle = math.atan2(global.mouseX - player.wheel.x, global.mouseY - player.wheel.y)
	
		player.wheel.roffset = player.wheel.r + angle
		game.isDown = true

	end

end

function game.mousereleased(x, y, button)

	game.isDown = false

end

function player.wheel.draw()

	love.graphics.draw(player.wheel.image, player.wheel.x, player.wheel.y, player.wheel.r, player.wheel.scale, player.wheel.scale, player.wheel.width, player.wheel.height)

end