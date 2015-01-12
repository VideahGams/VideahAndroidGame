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
	player.wheel.lockedcolor = "red"

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

		local angle = math.atan2(global.mouseX - player.wheel.x, global.mouseY - player.wheel.y)

		if ui.getBoolean(1) == false then

			player.wheel.r = (player.wheel.roffset - angle)

		else

			if player.wheel.lockedcolor == "red" then

				player.wheel.r = -angle - math.rad(135)

			elseif player.wheel.lockedcolor == "green" then

				player.wheel.r = -angle - math.rad(225)

			elseif player.wheel.lockedcolor == "yellow" then

				player.wheel.r = -angle - math.rad(315)

			elseif player.wheel.lockedcolor == "blue" then

				player.wheel.r = -angle - math.rad(45)

			end

		end

	end

end

function game.mousepressed(x, y, button)

	local angle = math.atan2(global.mouseX - player.wheel.x, global.mouseY - player.wheel.y)
	
	player.wheel.roffset = player.wheel.r + angle
	game.isDown = true


end

function game.mousereleased(x, y, button)

	game.isDown = false

end

function player.wheel.draw()

	love.graphics.draw(player.wheel.image, player.wheel.x, player.wheel.y, player.wheel.r, player.wheel.scale, player.wheel.scale, player.wheel.width, player.wheel.height)

end

function game.setColor(string)

	if ui.getBoolean(1) then

		if player.wheel.lockedcolor ~= string then

			if string == "red" or string == "green" or string == "blue" or string == "yellow" then

				player.wheel.lockedcolor = string

				util.dprint("Set locked color to '" .. string .. "'")

			else

				util.dprint("Can't set locked color, invalid argument.")

			end

		end

	else

		util.dprint("Locked color option not true. Failed to set locked color.")

	end

end