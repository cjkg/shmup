function detect_collisions()
	for e in all(enemies) do
		for b in all(bullets) do
			if col(b,e) then
				e.hp-=curr_bullet.dmg
				make_sparks(b.x,b.y,10,{9,10})
				del(bullets,b)
				sfx(2)
			end
		end
		
		if col(ship,e) and 
			ship.invul==0 then
			e.hp-=1
			hearts-=1
			sfx(1)
			if hearts>0 then
				ship.invul=30
			end
		end
	end
end
