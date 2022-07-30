function col(a,b)
	
	local a_left,a_right,a_top,a_bottom=
		a.x+a.hb_lx_off,a.x+a.w*8-1-a.hb_lx_off,a.y+a.hb_ty_off,a.y+a.h*8-1-a.hb_by_off
	
	local b_left,b_right,b_top,b_bottom=
		b.x+b.hb_lx_off,b.x+b.w*8-1-b.hb_lx_off,b.y+b.hb_ty_off,b.y+b.h*8-1-a.hb_by_off

	if a_left	< b_right and
		a_right > b_left and
		a_top < b_bottom and
		a_bottom > b_top then
		return true
	end
	
	return false
end