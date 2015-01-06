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

-- Get functions --

function ui:getText(id)

	return ui.buttonlist[id][1]

end

function ui:getX(id)

	return ui.buttonlist[id][2]

end

function ui:getY(id)

	return ui.buttonlist[id][3]

end

function ui:getWidth(id)

	return ui.buttonlist[id][4]

end

function ui:getHeight(id)

	return ui.buttonlist[id][5]

end

-- Set functions --

function ui:setText(id, text)

	ui.buttonlist[id][1] = text

end

function ui:setX(id, x)

	ui.buttonlist[id][2] = x

end

function ui:setY(id, y)

	ui.buttonlist[id][3] = y

end

function ui:setWidth(id, width)

	ui.buttonlist[id][4] = width

end

function ui:setHeight(id, height)

	ui.buttonlist[id][5] = height

end

