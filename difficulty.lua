dif = {}

function dif.load()

	local types = {}
	types[1] = "Easy"
	types[2] = "Medium"
	types[3] = "Hard"
	types[4] = "Insane"

	for i=1, 4 do

		ui.createButton(types[i], (global.screenWidth / 2) - 145, 200 + 100 * i, 290, 100, {48, 62, 80}, function() state.fadeToState(menu.optionsstate[i], 0.5) end, "difficulty")

	end

end