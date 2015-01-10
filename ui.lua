ui = {}
ui.buttonlist = {}
ui.checkboxlist = {}

function ui.createButton(text, x, y, width, height, color, func, state)

	if text == nil then text = "Text" end
	if x == nil then x = 0 end
	if y == nil then y = 0 end
	if width == nil then width = 200 end
	if height == nil then height = 50 end
	if color == nil then color = {255, 255, 255} end
	if func == nil then func = function() end end
	if state == nil then state = "all" end

	local button = {text, x, y, width, height, color, func, state}

	table.insert(ui.buttonlist, button)

	util.dprint("Created UI object 'button'")

end

function ui.createCheckbox(text, x, y, width, height, color, boolean, state)

	if text == nil then text = "Text" end
	if x == nil then x = 0 end
	if y == nil then y = 0 end
	if width == nil then width = 50 end
	if height == nil then height = 50 end
	if color == nil then color = {255, 255, 255} end
	if boolean == nil then boolean = false end
	if state == nil then state = "all" end

	local checkbox = {text, x, y, width, height, color, boolean, state}

	table.insert(ui.checkboxlist, checkbox)

	util.dprint("Created UI object 'checkbox'")

end

function ui.draw()

	for i=1, #ui.buttonlist do

		local text = ui.getText(i)
		local x = ui.getX(i)
		local y = ui.getY(i)
		local width = ui.getWidth(i)
		local height = ui.getHeight(i)
		local color = ui.getColor(i)
		local gstate = ui.getState(i)

		if gstate == state:getState() or gstate == "all" then

			love.graphics.setColor(color)

			util.drawRoundedRectangle("fill", x, y, width, height, 10, 25)

			love.graphics.setColor(255, 255, 255)

			love.graphics.setFont(font.buttontext)

			love.graphics.printf(text, x + (width / 2), y + (height / 2) - (font.buttontext:getHeight() / 2), 0, "center")

			if global.debug then -- DEBUG: Draws button ID number to help with debugging.

				love.graphics.setFont(font.default)

				love.graphics.print(i, ui.getX(i) + 10, ui.getY(i) + 10)

			end

		end

	end

	for i=1, #ui.checkboxlist do

		local text = ui.getText(i, "checkbox")
		local x = ui.getX(i, "checkbox")
		local y = ui.getY(i, "checkbox")
		local width = ui.getWidth(i, "checkbox")
		local height = ui.getHeight(i, "checkbox")
		local color = ui.getColor(i, "checkbox")
		local gstate = ui.getState(i, "checkbox")
		local bool = ui.getBoolean(i, "checkbox")

		if gstate == state:getState() or gstate == "all" then

			love.graphics.setColor(color)

			love.graphics.rectangle("line", x, y, width, height)

			love.graphics.setFont(font.checkboxtext)

			love.graphics.printf(text, x + width + 15, y, 0, "left")

			if bool then

				love.graphics.line( x, y, x + width, y + height)

				love.graphics.line( x, y + height, x + width, y)

			end

			if global.debug then -- DEBUG: Draws checkbox ID number to help with debugging.

				love.graphics.setFont(font.default)

				love.graphics.print(i, x - 10, y - 10)

			end

		end

	end

end

function ui.touchpressed(id, x, y, pressure)

	if button == "l" then

		for i=1, #ui.buttonlist do

			if ui.getState(i) == state:getState() or ui.getState(i) == "all" then

				local uix = ui.getX(i)
				local uiy = ui.getY(i)

				local uiw = ui.getWidth(i)
				local uih = ui.getHeight(i)

				if x >= uix and x <= uix + uiw and y >= uiy and y <= uiy + uih then -- Oh god is this messy or what?
					ui.buttonlist[i][7]()
				end

			end

		end

		for i=1, #ui.checkboxlist do

			if ui.getState(i, "checkbox") == state:getState() or ui.getState(i, "checkbox") == "all" then

				local uix = ui.getX(i, "checkbox")
				local uiy = ui.getY(i, "checkbox")

				local uiw = ui.getWidth(i, "checkbox")
				local uih = ui.getHeight(i, "checkbox")
				local bool = ui.getBoolean(i, "checkbox")

				if x >= uix and x <= uix + uiw and y >= uiy and y <= uiy + uih then -- Yup, still messy.
					ui.setBoolean(i, not bool)
				end

			end

		end

	end

end

function ui.mousepressed(x, y, button)

	local isPressed = false

	if button == "l" then

		if isPressed == false then

			for i=1, #ui.buttonlist do

				if isPressed ==false then

					if ui.getState(i) == state:getState() or ui.getState(i) == "all" then

						local uix = ui.getX(i)
						local uiy = ui.getY(i)

						local uiw = ui.getWidth(i)
						local uih = ui.getHeight(i)

						if x >= uix and x <= uix + uiw and y >= uiy and y <= uiy + uih then -- It's never gonna stop being messy.

							ui.buttonlist[i][7]()
							isPressed = true

						end

					end

				end

			end

		end

		if isPressed == false then

			for i=1, #ui.checkboxlist do

				if isPressed == false then

					if ui.getState(i, "checkbox") == state:getState() or ui.getState(i, "checkbox") == "all" then

						local uix = ui.getX(i, "checkbox")
						local uiy = ui.getY(i, "checkbox")

						local uiw = ui.getWidth(i, "checkbox")
						local uih = ui.getHeight(i, "checkbox")
						local bool = ui.getBoolean(i, "checkbox")

						if x >= uix and x <= uix + uiw and y >= uiy and y <= uiy + uih then -- Forever a mess.
							ui.setBoolean(i, not bool)
							isPressed = true
						end

					end

				end

			end

		end
	end

end

-- Get functions --

function ui.getText(id, type)

	if type == nil then type = "button" end

	if type == "button" then

		return ui.buttonlist[id][1]

	elseif type == "checkbox" then

		return ui.checkboxlist[id][1]

	end

end

function ui.getX(id, type)

	if type == nil then type = "button" end

	if type == "button" then

		return ui.buttonlist[id][2]

	elseif type == "checkbox" then

		return ui.checkboxlist[id][2]

	end

end

function ui.getY(id, type)

	if type == nil then type = "button" end

	if type == "button" then

		return ui.buttonlist[id][3]

	elseif type == "checkbox" then

		return ui.checkboxlist[id][3]

	end

end

function ui.getWidth(id, type)


	if type == nil then type = "button" end

	if type == "button" then

		return ui.buttonlist[id][4]

	elseif type == "checkbox" then

		return ui.checkboxlist[id][4]

	end

end

function ui.getHeight(id, type)

	if type == nil then type = "button" end

	if type == "button" then

		return ui.buttonlist[id][5]

	elseif type == "checkbox" then

		return ui.checkboxlist[id][5]

	end

end

function ui.getColor(id, type)

	if type == nil then type = "button" end

	if type == "button" then

		return ui.buttonlist[id][6]

	elseif type == "checkbox" then

		return ui.checkboxlist[id][6]

	end

end

function ui.getFunction(id, type)

	if type == nil then type = "button" end

	if type == "button" then

		return ui.buttonlist[id][7]

	end

end

function ui.getBoolean(id, type)

	if type == nil then type = "checkbox" end

	if type == "checkbox" then

		return ui.checkboxlist[id][7]

	end

end

function ui.getState(id, type)

	if type == nil then type = "button" end

	if type == "button" then

		return ui.buttonlist[id][8]

	elseif type == "checkbox" then

		return ui.checkboxlist[id][8]

	end

end

-- Set functions --

function ui.setText(id, text, type)

	if type == nil then type = "button" end

	if type == "button" then

		ui.buttonlist[id][1] = text

	elseif type == "checkbox" then

		ui.checkboxlist[id][1] = text

	end

end

function ui.setX(id, x, type)

	if type == nil then type = "button" end

	if type == "button" then

		ui.buttonlist[id][2] = x

	elseif type == "checkbox" then

		ui.checkboxlist[id][2] = x

	end

end

function ui.setY(id, y, type)

	if type == nil then type = "button" end

	if type == "button" then

		ui.buttonlist[id][3] = y

	elseif type == "checkbox" then

		ui.checkboxlist[id][3] = y

	end

end

function ui.setWidth(id, width, type)

	if type == nil then type = "button" end

	if type == "button" then

		ui.buttonlist[id][4] = width

	elseif type == "checkbox" then

		ui.checkboxlist[id][4] = width

	end

end

function ui.setHeight(id, height, type)

	if type == nil then type = "button" end

	if type == "button" then

		ui.buttonlist[id][5] = height

	elseif type == "checkbox" then

		ui.checkboxlist[id][5] = height

	end

end

function ui.setColor(id, color, type)

	if type == nil then type = "button" end

	if type == "button" then

		ui.buttonlist[id][6] = color

	elseif type == "checkbox" then

		ui.checkboxlist[id][6] = color

	end

end

function ui.setFunction(id, func, type)

	if type == nil then type = "button" end

	if type == "button" then

		ui.buttonlist[id][7] = func

	end

end

function ui.setBoolean(id, bool, type)

	if type == nil then type = "checkbox" end

	if type == "checkbox" then

		ui.checkboxlist[id][7] = bool

	end

end

function ui.setState(id, state, type)

	if type == nil then type = "button" end

	if type == "button" then

		ui.buttonlist[id][8] = state

	elseif type == "checkbox" then

		ui.checkboxlist[id][8] = state

	end

end