function update_gameover()
	poke(0x5f5c,255)
	lockout-=1
	if btnp(❎) and lockout<0 then
		start_game()
	end
end