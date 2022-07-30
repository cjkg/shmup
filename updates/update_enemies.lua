function update_enemies()
	for e in all(enemies) do
		--e.sprt+=.25
		if e.mode=="approach" then
			if e.y<e.dy then
				e.y+=e.spd
			else
				e.mode=e.goalmode
			end
		end
		
		if e.y>128 then
			del(enemies,e)			
		end
		
		if this_wave.timer<0 then
			e.y+=e.spd*2.5
		end
				
		if e.hp<1 then
			del(enemies,e)
			make_deathsplosions(e.x,e.y,45,7,30)
		end	
	end
	
	if #enemies==0 and hearts>0 then
		next_wave()
	end
end