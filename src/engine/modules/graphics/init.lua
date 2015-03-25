local graphics = {}

function graphics.newImage(filename)

	local image = nil

	if love.filesystem.exists(filename) then

		image = love.graphics.newImage(filename)

	else

		local missingtexture = 'engine/data/images/missing.png'

		assert(love.filesystem.exists(missingtexture), "CRITICAL ERROR: cannot load missing texture")

		image = love.graphics.newImage(missingtexture)

	end

	return image

end

function graphics.rectangle(mode, x, y, width, height, bordersize)

	assert(mode == "fill" or mode == "line", "mode requires a valid value.")

	bordersize = bordersize or 0

	if mode == "fill" then
		love.graphics.rectangle(mode, x, y, width, height)
	end

	if mode == "line" and bordersize <= 0 then
		bordersize = 1
	end

	-- Border --

	if bordersize ~= 0 then

		-- Top Bar --
		love.graphics.rectangle("fill", x - bordersize, y - bordersize, width + bordersize * 2, bordersize)

		-- Left Bar --

		love.graphics.rectangle("fill", x - bordersize, y - bordersize, bordersize, height + bordersize * 2)

		-- Right Bar --

		love.graphics.rectangle("fill", x + width, y - bordersize, bordersize, height + bordersize * 2)

		-- Bot Bar --

		love.graphics.rectangle("fill", x - bordersize, y + height, width + bordersize * 2, bordersize)

	end

end

function graphics.roundedRectangle(mode, x, y, w, h, r, n)
  n = n or 20  -- Number of points in the polygon.
  if n % 4 > 0 then n = n + 4 - (n % 4) end  -- Include multiples of 90 degrees.
  local pts, c, d, i = {}, {x + w / 2, y + h / 2}, {w / 2 - r, r - h / 2}, 0
  while i < n do
    local a = i * 2 * math.pi / n
    local p = {r * math.cos(a), r * math.sin(a)}
    for j = 1, 2 do
      table.insert(pts, c[j] + d[j] + p[j])
      if p[j] * d[j] <= 0 and (p[1] * d[2] < p[2] * d[1]) then
        d[j] = d[j] * -1
        i = i - 1
      end
    end
    i = i + 1
  end
  love.graphics.polygon(mode, pts)
end

return graphics