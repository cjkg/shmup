function update_shockwaves()
	for s in all(shockwaves) do
		s.dur+=1
		s.r+=1
		if s.dur>20 then
			del(shockwaves,s)
		end
	end
end