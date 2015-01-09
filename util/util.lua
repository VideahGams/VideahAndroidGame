util = {}

function util.getTimestamp()

  return os.date("%x_%X"):gsub("[/:]", "-")

end

function util.getDistance( x1, y1, x2, y2)

	local dx = x1 - x2
	local dy = y1 - y2
	return math.sqrt( dx * dx ), math.sqrt( dy * dy)

end

function util.getDistanceX( x1, y1, x2, y2)

	local dx = x1 - x2
	local dy = y1 - y2
	return math.sqrt( dx * dx )

end

function util.getDistanceY( x1, y1, x2, y2)

	local dx = x1 - x2
	local dy = y1 - y2
	return math.sqrt( dy * dy )

end

function util.dprint(string)
	if global.debug then
		print("[DEBUG]:" .. string)
	end
end

function util.round(num)
	return math.floor(num + 0.5)
end

function util.drawRoundedRectangle(mode, x, y, w, h, r, n)
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