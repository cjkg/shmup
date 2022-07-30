function update_wave()
	update_ship()
	do_buttons()
	update_bullets()
	update_explosions()
	update_shockwaves()
	detect_collisions()
	update_sparks()
	
	
	countdown-=1
	if countdown<=0 then
		make_wave()
		_upd=update_game
		_drw=draw_game
	end
end