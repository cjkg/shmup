function update_win()
	poke(0x5f5c,255)
	lockout-=1
	
	if btnp(❎) then
		start_game()
	end
end