function draw_game()
	if fadeperc==1 then return end
	
	draw_starfield()
	foreach(explosions,draw_explosion)
	foreach(shockwaves,draw_shockwave)
	
	if hearts>0 then
		draw_ship()
	end
	
	foreach(enemies,drawspr)
	foreach(bullets,drawspr)
	foreach(sparks,draw_spark)
	
	circfill(ship.x+7,ship.y-4,ship.muzzle-1,7)

	draw_ui()
end