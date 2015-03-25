local menu = {}
menu.buttonlist = {}

function menu.load()



end

function menu.draw()

	for i=1, #menu.buttonlist do

		local buttonw = 500
		local buttonh = 100
		local buttonx = (_G.screenWidth / 2) - (buttonw / 2)
		local buttony = 10 + ((buttonh + 10) * i)

		menu.buttonlist[i].button.x = buttonx
		menu.buttonlist[i].button.y = buttony

		menu.buttonlist[i].button.w = buttonw
		menu.buttonlist[i].button.h = buttonh

		menu.buttonlist[i].button:draw()

	end

end

function menu.update(dt)

	for i=1, #menu.buttonlist do

		menu.buttonlist[i].button:update(dt)

		if menu.buttonlist[i].button.pressed then

			menu.buttonlist[i].func()

		end

	end

end

function menu.addButton(text, func)

	local btn = {button = engine.ui.Button(text, 0, 0, 0, 0, {extensions = {engine.uitheme.Button}}), func = func}

	table.insert(menu.buttonlist, btn)

end

return menu