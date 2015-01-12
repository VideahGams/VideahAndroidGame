options = {}
options.resolutions = {}
options.counter = 0

function options.load()

	ui.createButton("Back", (global.screenWidth / 2) - 145, (global.screenHeight / 2) - (62 * #menu.options) + 375, 290, 100, {48, 62, 80}, function() state:changeState("menu") end, "options") -- Ew.
	ui.createCheckbox("Color Locking", (global.screenWidth / 2) - 75, (global.screenHeight / 2) - (62 * (#menu.options + 4)) + 400, nil, nil, {48, 62, 80}, false, "options") -- Still Ew.

	ui.createButton("", ((global.screenWidth / 2) - 200), (global.screenHeight / 2) - (62 * (#menu.options + 2)) + 365, 400, 95, {48, 62, 80}, function() options.obviouslynotaneasteregg() ui.setSelected(i, true) end, "options") -- Background

	for i=1, 4 do

		local color = {}

		color[1] = {231, 76, 60} -- Red
		
		color[2] = {46, 204, 113} -- Green
		
		color[3] ={52, 152, 219} -- Blue
		
		color[4] ={241, 196, 15} -- Yellow

		ui.createButton("", ((global.screenWidth / 2) - 275) + (i * 95), (global.screenHeight / 2) - (62 * (#menu.options + 2)) + 375, 75, 75, color[i], function() options.colorButtonSelect(i) end, "options")

	end

end

function options.applySettings()

	options.resolutions[#options.resolutions+1] = "1200x768"
	options.resolutions[#options.resolutions+1] = "1200x900"
	options.resolutions[#options.resolutions+1] = "1280x1024"
	options.resolutions[#options.resolutions+1] = "1440x900"
	options.resolutions[#options.resolutions+1] = "1680x1050"
	options.resolutions[#options.resolutions+1] = "1600x900"
	options.resolutions[#options.resolutions+1] = "1600x1200"
	options.resolutions[#options.resolutions+1] = "1366x768"
	options.resolutions[#options.resolutions+1] = "1920x1200"
	options.resolutions[#options.resolutions+1] = "2560x1600"
	options.resolutions[#options.resolutions+1] = "1280x720"
	options.resolutions[#options.resolutions+1] = "1920x1080"
	options.resolutions[#options.resolutions+1] = "2560x1440"
	options.resolutions[#options.resolutions+1] = "2560x1600"


	if love.filesystem.exists("cfg/settings.ini") == false then
        local defaultSettings = 
        {
            settings = 
            {
                vsync = true,
                resolutionwidth = 1280,
                resolutionheight = 720,
                fullscreen = false,
                borderless = true,
                debug = false,
            },
        };

        LIP.save("cfg/settings.ini", defaultSettings)
    end

    options.settings = LIP.load('cfg/settings.ini');

    love.window.setMode(options.settings.settings.resolutionwidth, options.settings.settings.resolutionheight, {vsync = options.settings.settings.vsync, fullscreen = options.settings.settings.fullscreen, borderless = options.settings.settings.borderless})

    options.resize()

end


function options.resize()

	global.screenWidth = love.graphics.getWidth()
	global.screenHeight = love.graphics.getHeight()

	global.centerWidth = (global.screenWidth / 2) * camera.scale
	global.centerHeight = (global.screenHeight / 2) * camera.scale

end

function options.update(dt)

	if ui.getBoolean(1) then

		local color = {}

		color[6] = {231, 76, 60}
		
		color[7] = {46, 204, 113}
		
		color[8] ={52, 152, 219}
		
		color[9] ={241, 196, 15}

		for i=6, 9 do

		ui.setColor(i, color[i])

		end

	else

		local color = {}

		color[6] = {231, 76, 60, 100}
		
		color[7] = {46, 204, 113, 100}
		
		color[8] ={52, 152, 219, 100}
		
		color[9] ={241, 196, 15, 100}

		for i=6, 9 do

		ui.setColor(i, color[i])

		end

	end

	if ui.getBoolean(1) then

		local stringcolor = {}

		stringcolor[1] = "red"

		stringcolor[2] = "green"

		stringcolor[3] = "blue"

		stringcolor[4] = "yellow"

		ui.setEnabled(5, false)

		for i=1, 4 do

			if player.wheel.lockedcolor == stringcolor[i] then

				ui.setSelected(i + 5, true)

			end

		end

	else

		ui.setEnabled(5, true)

		ui.setSelected(6, false)
		ui.setSelected(7, false)
		ui.setSelected(8, false)
		ui.setSelected(9, false)

	end


end

function options.obviouslynotaneasteregg()

	if ui.getBoolean(1) == false then

		options.counter = options.counter + 1

		if options.counter == 20 then

			menu.title = "Easter Egg Activated!"
			player.wheel.image = love.graphics.newImage("data/images/notaneasteregg.png")
			ui.isPressed = false

		end

	end

end

function options.colorButtonSelect(i)

	local stringcolor = {}

	stringcolor[1] = "red"

	stringcolor[2] = "green"

	stringcolor[3] = "blue"

	stringcolor[4] = "yellow"

	ui.setSelected(6, false)
	ui.setSelected(7, false)
	ui.setSelected(8, false)
	ui.setSelected(9, false)

	game.setColor(stringcolor[i])

	ui.setSelected(i + 5, true)

end