
function do_buttons()
	--todo
	if button_buffer>0 then
		button_buffer-=1
	end
	
	if btn(0) then
		ship.speed_x=-1.5
		ship.sprt=64
		ship.trail_dx=-2
	end
	if btn(1) then
		ship.speed_x=1.5
		ship.sprt=68
		ship.trail_dx=2
	end
	if btn(2) then
		ship.speed_y=-1.5
	end
	if btn(3) then
		ship.speed_y=1.5
	end
	if btn(5) and button_buffer==0 then
		button_buffer=curr_bullet.trigger
		
		for i=1,#curr_bullet.traj do		
			make_bullet(ship.x+4+curr_bullet.traj[i][1],
				ship.y-4,
				curr_bullet.sprt,
				curr_bullet.spd,
				curr_bullet.traj[i][2],
				curr_bullet.w,
				curr_bullet.h,
				curr_bullet.hb_lx_off,
				curr_bullet.hb_rx_off,
				curr_bullet.hb_by_off,
				curr_bullet.hb_ty_off)
		end
		sfx(curr_bullet.bsfx)
		ship.muzzle=8
	end
end