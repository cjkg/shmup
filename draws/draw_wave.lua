function draw_wave()
	draw_game()
	
	if countdown > 90 then
		print("wave "..wave.."!",51,40,11) 
	elseif countdown>60 then
		spr(11,60,40)
	elseif countdown>30 then
		spr(12,60,40)
	else
		spr(13,60,40)
	end
end