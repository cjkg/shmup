function draw_ui()
	print("score: "..score,40,2,11)
	
	for i=1,max_hearts do
		spr(10,1+i*8,1)
	end

	for i=1,hearts do
		spr(9,1+i*8,1)
	end
end