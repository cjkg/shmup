function make_spark(px,py,pc)
	local spark = {
		x=px,
		y=py,
		dur=0,
		c=rnd(pc),
		dx=rnd(5)-2,
		dy=rnd(5)-2
	}
	
	add(sparks,spark)
end