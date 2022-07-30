function update_sparks()
	for s in all(sparks) do
		s.dur+=1
		s.x+=s.dx
		s.y+=s.dy
		if s.dur>10 then
			del(sparks,s)
		end
	end
end