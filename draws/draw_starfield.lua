function draw_starfield()
	--todo remove update logic
	for i=1,#stars do
		local star_x,
			star_y,
			star_spd,
			star_color=	stars[i][1],
						stars[i][2],
						stars[i][3]
		
		if star_spd>2 then
			star_color=7
		elseif star_spd>1 then
			star_color=13
		else
			star_color=1
		end

		if star_spd>3 then
			line(star_x,star_y,star_x,star_y+3,star_color)
		else
			pset(star_x,star_y,star_color)
		end
		
		stars[i][2]=star_y+star_spd
		
		if star_y>128 then 
			stars[i][1]=flr(rnd(128))
			stars[i][2]=0
		end
	end
end