function checkend()
	if hearts<=0 then
		make_deathsplosions(ship.x,ship.y,120,6,120)
		--todo sfx
		_upd=update_dead
		_drw=draw_dead
	end
end