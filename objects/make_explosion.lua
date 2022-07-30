function make_explosion(px,
	py,
	prad,
	pdur)

	local new_ex = {
		x=px,
		y=py,
		c=7,
		r=flr(rnd(prad))+1,
		dx=rnd(4)-2,
		dy=rnd(4)-2,
		dur=pdur,
		maxdur=pdur
	}
	
	add(explosions, new_ex)
end