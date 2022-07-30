function update_explosions()
	local col
	for e in all(explosions) do
		e.dur-=1
		e.x+=e.dx
		e.y+=e.dy
		
		local dur_rate=e.dur/e.maxdur
		if dur_rate>.9 then
			col=7
		elseif dur_rate>.8 then
			col=10
		elseif dur_rate>.55 then
			col=9
		elseif dur_rate>.35 then
			col=8
		else
			col=6
		end
		
		e.c=col
		
		if rnd(3)<1 then
			e.r-=rnd()
		end
		
		if e.dur < 0 then
			del(explosions,e)
		end	
	end
end