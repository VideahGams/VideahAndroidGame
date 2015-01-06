ui = {}
ui.buttonlist = {}

function ui.createButton(text, x, y, width, height, color)

	local button = {text, x, y, width, height, color}

	table.insert(ui.buttonlist, button)

	util.dprint("Created UI object 'button'")

end

function ui.draw()

	for i=1, #ui.buttonlist do

		love.graphics.setColor(ui.buttonlist[i][6] or 255,255,255)

		love.graphics.rectangle("fill", ui.buttonlist[i][2], ui.buttonlist[i][3], ui.buttonlist[i][4], ui.buttonlist[i][5])

		love.graphics.setColor(0, 0, 0)

		love.graphics.print(ui.buttonlist[i][1], ui.buttonlist[i][2], ui.buttonlist[i][3])

	end

end