


function update_dead()
	death_count-=1
	update_bullets()
	update_enemies()
	update_explosions()
	update_shockwaves()

	if death_count<=0 then
		--todo sfx
		highscore=score>highscore
			and score
			or highscore

		fadeout()
		_upd=update_gameover
		_drw=draw_gameover
	end
end