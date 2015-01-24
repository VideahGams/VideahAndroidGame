dif = {}

function dif.load()

	local types = {}
	types[1] = "Easy"
	types[2] = "Medium"
	types[3] = "Hard"
	types[4] = "Insane"

	for i=1, 5 do

		if i <= 4 then

			ui.createButton(types[i], (global.screenWidth / 2) - 145, 200 + 120 * i, 290, 100, {48, 62, 80}, function() dif.setDifficulty(string.lower(types[i])) end, "difficulty")

		else

			ui.createButton("Back", (global.screenWidth / 2) - 145, 200 + 120 * i, 290, 100, {48, 62, 80}, function() state.fadeToState("menu", 0.5) end, "difficulty")

		end

	end

end

function dif.setDifficulty(diff)

	state.fadeToState("game", 0.5)
	game.difficulty = diff

end