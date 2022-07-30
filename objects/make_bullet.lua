function make_bullet(
	px,
	py,
	psprt,
	pspd,
	pdir,
	pw,
	ph,
	phb_lx_off,
	phb_rx_off,
	phb_by_off,
	phb_ty_off)
		
	local newbull=	{
		x=px,
		y=py,
		sprt=psprt,
		spd=pspd,
		dir=pdir, --todo cut a couple token
		w=pw,
		h=ph,
		hb_lx_off=phb_lx_off,
		hb_rx_off=phb_rx_off,
		hb_by_off=phb_by_off,
		hb_ty_off=phb_ty_off
	}
	add(bullets,newbull)
end