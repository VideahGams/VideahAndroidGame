font = {}

function font.load()

	font.default = love.graphics.newFont(12)
	font.debug = love.graphics.newFont(16)
	font.playername = love.graphics.newFont(24)
	font.menutitle = love.graphics.newFont(72)
	font.buttontext = love.graphics.newFont(32)
	font.pausetitle = love.graphics.newFont(62)
	font.checkboxtext = love.graphics.newFont(24)

	print("Loaded font cache ...")

end