state = {}
state.transparency = 0

print("Loaded gamestate system ...")

state.currentState = "splash"

-- Change the current gamestate.

function state:changeState(input)
	self.currentState = input

	util.dprint("Changing state to " .. input)

end

-- Get the current gamestate.

function state:getState()
	return self.currentState
end	

-- Check if the current gamestate is a certain one.

function state:isStateEnabled(input)
	if input == self.currentState then
		return true
	else
		return false
	end
end

-- Fades out from current state.

function state.fadeToState(input, duration)

	if duration == nil then duration = 1 end

	print("HUE")
	state.fadeout = flux.to(state, duration, { transparency = 255 })
	:oncomplete(function() state.fadeIn(input, duration) end)

end

-- Fades back in on inputed state.

function state.fadeIn(input, duration)

	state:changeState(input)

	state.fadeout = flux.to(state, duration, { transparency = 0 })

end

function state.draw()

	love.graphics.setColor(236,240,241, state.transparency)

	love.graphics.rectangle("fill", 0, 0, global.screenWidth, global.screenHeight)

end