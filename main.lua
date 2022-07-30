function _init()
	g=json_parse('{"dirx":[-1,1,0,0,1,1,-1,-1],"diry":[0,0,-1,1,-1,1,1,-1],"dpal":[0,1,1,2,1,13,6,4,4,9,3,13,1,13,14],"bullets":{"fire_blast":{"sprt":36,"spd":2,"trigger":5,"traj":[[0,0]],"bsfx":0,"w":1,"h":2,"hb_lx_off":0,"hb_ty_off":0,"hb_rx_off":1,"hb_by_off":1,"dmg":1},"fire_spray":{"sprt":20,"spd":2,"trigger":15,"traj":[[0,-1],[0,0],[0,1]],"bsfx":0,"w":1,"h":1,"hb_lx_off":1,"hb_ty_off":3,"hb_rx_off":1,"hb_by_off":0,"dmg":1},"twin_blast":{"sprt":32,"spd":3,"trigger":4,"traj":[[-4,0],[4,0]],"bsfx":0,"w":1,"h":2},"fire_ball":{"sprt":36,"spd":2,"trigger":5,"traj":[[0,0]],"bsfx":0,"w":1,"h":2}},"ship":{"h":2,"w":2,"hb_lx_off":1,"hb_ty_off":3,"hb_rx_off":1,"hb_by_off":0,"sprt":130,"trail_x":4,"trail_y":14,"trail_sprt":5,"trail_frames":4},"enemies":{"greenie":{"sprt":76,"spd":1,"hp":3,"h":2,"w":2,"hb_lx_off":0,"hb_rx_off":0,"hb_by_off":0,"hb_ty_off":0}},"waves":{"1":{"timer":450,"enemies":[{"name":"greenie","x":32,"y":-8,"dy":32,"mode":"approach","goalmode":"fight","mission":"X"}]}}}')
	highscore=0

	start_game()
end

function _update()
	t+=1
	_upd()
end

function _draw()
	cls()
	checkfade()
	_drw()	
end

function start_game()
	wave=0
	t=0
	
 --todo
	score=0
	new_high_score=false
	death_count=45
	button_buffer,lockout=0,60
	fadeperc=0
	
	bullets,enemies,stars,explosions,shockwaves,sparks={},{},{},{},{},{}
	waves={}
	
	ship=g.ship
	ship.speed_x,ship.speed_y=0,0
	ship.x,ship.y=56,60
	ship.muzzle,ship.trail_dx,ship.invul=0,0,0
	
	curr_bullet=g.bullets["fire_blast"]
	hearts,max_hearts=1,3
	
	for i=1,128 do
		add(stars,
			{
				flr(rnd(128)),
				flr(rnd(128)),
				max(1,rnd(4))	
			})
	end
	
	_upd=update_start
	_drw=draw_start
end

function next_wave()
	wave+=1
	if wave<11 then
		countdown=120
		_upd=update_wave
		_drw=draw_wave
	else
		fadeout()
		_upd=update_win
		_drw=draw_win
	end
end