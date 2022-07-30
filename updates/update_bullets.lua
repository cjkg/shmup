function update_bullets()
	--todo
	--bullet
	
	for b in all(bullets) do
		b.y-=b.spd
		b.x+=b.dir
		b.sprt+=.5
		
		if b.sprt>curr_bullet.sprt+3 then
			b.sprt=curr_bullet.sprt
		end
		
		if b.y<-8 then
			del(bullets,b)
		end
	end
end