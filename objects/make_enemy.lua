function make_enemy(
	px,
	py,
	penemy,
	pwavedata
	)
	local new_enemy = {
		x=px,
		y=py,
		dy=pwavedata.dy,
		mode=pwavedata.mode,
		goalmode=pwavedata.goalmode,
		mission=pwavedata.mission,
		sprt=penemy.sprt,
		start_sprt=penemy.sprt,
		hp=penemy.hp,
		spd=penemy.spd,
		w=penemy.w,
		h=penemy.h,
		hb_lx_off=penemy.hb_lx_off,
		hb_rx_off=penemy.hb_rx_off,
		hb_by_off=penemy.hb_by_off,
		hb_ty_off=penemy.hb_ty_off
																			
	}
	
	add(enemies,new_enemy)
end