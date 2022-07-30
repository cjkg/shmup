function make_deathsplosions(px,py,pnum,prad,pdur,pc)
	for i=1,pnum do
		make_explosion(px+4,py+4,prad,pdur,pc)
	end
	make_shockwave(px+4,py+4)
end