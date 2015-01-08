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

function ui.touchpressed(id, x, y, pressure)

	local cx = x * love.graphics.getWidth()
	local cy = y * love.graphics.getHeight()

	for i=1, #ui.buttonlist do

		local uix = ui.getX(i)
		local uiy = ui.getY(i)

		local uiw = ui.getWidth(i)
		local uih = ui.getHeight(i)

		if x >= uix and x <= uix + uiw and y >= uiy and y <= uiy + uih then -- Oh god is this messy or what?
			menu.title = "SUCCESS"
		end

	end

end

function ui.mousepressed(x, y, button)

	for i=1, #ui.buttonlist do

		local uix = ui.getX(i)
		local uiy = ui.getY(i)

		local uiw = ui.getWidth(i)
		local uih = ui.getHeight(i)

		if x >= uix and x <= uix + uiw and y >= uiy and y <= uiy + uih then -- Yep, still messy.
			print("SUCCESS")
		end

	end

end

-- Get functions --

function ui.getText(id)

	return ui.buttonlist[id][1]

end

function ui.getX(id)

	return ui.buttonlist[id][2]

end

function ui.getY(id)

	return ui.buttonlist[id][3]

end

function ui.getWidth(id)


	return ui.buttonlist[id][4]

end

function ui.getHeight(id)

	return ui.buttonlist[id][5]

end

-- Set functions --

function ui.setText(id, text)

	ui.buttonlist[id][1] = text

end

function ui.setX(id, x)

	ui.buttonlist[id][2] = x

end

function ui.setY(id, y)

	ui.buttonlist[id][3] = y

end

function ui.setWidth(id, width)

	ui.buttonlist[id][4] = width

end

function ui.setHeight(id, height)

	ui.buttonlist[id][5] = height

end

