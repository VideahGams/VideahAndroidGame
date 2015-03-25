local VideahTheme = {}

VideahTheme.bg = {color = {236,240,241}}

VideahTheme.Button = {}
VideahTheme.Button.font = love.graphics.newFont(34)

VideahTheme.Button.draw = function(self)

	love.graphics.setColor(64, 64, 64)
	if self.hot then love.graphics.setColor(96, 96, 96) end
	if self.down then love.graphics.setColor(32, 32, 32) end
	engine.graphics.roundedRectangle('fill', self.x, self.y, self.w, self.h, 10, 25)
	love.graphics.setColor(255, 255, 255)
	love.graphics.setFont(VideahTheme.Button.font)
	love.graphics.printf(self.text, self.x + (self.w / 2), self.y + (self.h / 2) - (VideahTheme.Button.font:getHeight() / 2), 0, "center")
	if self.selected then 
		love.graphics.setColor(128, 32, 32) 
		love.graphics.rectangle('line', self.x, self.y, self.w, self.h)
	end

end

return VideahTheme