function update_ship()
	--move ship
	ship.x+=ship.speed_x
	ship.y+=ship.speed_y
	
	if ship.x>127 then
		ship.x=-7
	elseif ship.x<-7 then
		ship.x=127
	end
	
	if ship.y>120 then
		ship.y=120
	elseif ship.y<0 then
		ship.y=0
	end

	--update invulnerability
	if ship.invul>0 then
		ship.invul-=1
	end
		
	--reset
	ship.speed_x,ship.speed_y=0,0
	ship.sprt=66
	ship.trail_dx=0
	
	--update muzzle flash
	if ship.muzzle>=0 then
		ship.muzzle-=3
	end
end