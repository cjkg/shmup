function draw_start()
	print("shmup!",52,61,8)
	print("christopher gibilisco", 23, 114, 5)
	
	if lockout<0 then
		print("press ❎",48,90,6+min(sin(time()-10)),1)
	end
end