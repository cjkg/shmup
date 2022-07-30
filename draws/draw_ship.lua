function draw_ship()
	if ship.invul%3==1 then
		pal(8,10)
	end

	spr(ship.trail_sprt+t%ship.trail_frames,
		ship.x+ship.trail_x+ship.trail_dx,
		ship.y+ship.trail_y)

	drawspr(ship)

	pal()
end