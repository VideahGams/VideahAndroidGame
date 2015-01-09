game = {}
player = {}
player.wheel = {}

function game.load()

	player.wheel.image = love.graphics.newImage("data/images/gamecircle.png")
	player.wheel.scale = 0.5
	player.wheel.width = player.wheel.image:getWidth() * player.wheel.scale
	player.wheel.height = player.wheel.image:getHeight() * player.wheel.scale
	player.wheel.x = (global.screenWidth / 2) - (player.wheel.width / 2)
	player.wheel.y = (global.screenHeight / 2) - (player.wheel.height / 2)

end

function game.draw()

	love.graphics.setColor(menu.color)
	love.graphics.rectangle( "fill", 0, 0, global.screenWidth, global.screenHeight ) -- Background
	love.graphics.setColor(255, 255, 255)

	player.wheel.draw()

end

function player.wheel.draw()

	love.graphics.draw(player.wheel.image, player.wheel.x, player.wheel.y, 0, player.wheel.scale)

end