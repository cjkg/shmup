function make_wave()
	this_wave=g.waves[tostr(wave)]
	for e in all(this_wave.enemies) do
		make_enemy(e.x,
			e.y,
			g.enemies[e.name],
			e)
	end
end