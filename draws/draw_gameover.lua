function draw_gameover()
	--todo make pretty
	print("game over",46,20,8)
	
	print("you died on",42,46,14)
	print("wave "..wave,52,52,14)
	
	print("your score:",42,70,12) 
	print(score,centx(#tostr(score)),76,12)

	print("high score:",42,94,11)
	print(highscore,centx(#tostr(score)),100,11)
	
	if lockout<0 then
		print("press ❎",48,114,6+min(sin(time()-10)),1)
	end	
end