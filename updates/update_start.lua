function update_start()
	poke(0x5f5c,255)
	lockout-=1
	if btnp(❎) and lockout<0 then	
		fadeout()
		next_wave()
		lockout=60
	end
end
