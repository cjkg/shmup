pico-8 cartridge // http://www.pico-8.com
version 36
__lua__
#include utils/centx.lua
#include utils/collision.lua
#include utils/drawspr.lua
#include utils/fadeout.lua
#include utils/json.lua

#include updates/checkend.lua
#include updates/detect_collisions.lua
#include updates/update_bullets.lua
#include updates/update_explosions.lua
#include updates/update_enemies.lua
#include updates/update_ship.lua
#include updates/update_shockwaves.lua
#include updates/update_sparks.lua
#include updates/update_wave.lua

#include updates/update_dead.lua
#include updates/update_game.lua
#include updates/update_gameover.lua
#include updates/update_start.lua
#include updates/update_waves.lua
#include updates/update_win.lua

#include draws/draw_dead.lua
#include draws/draw_explosion.lua
#include draws/draw_game.lua
#include draws/draw_gameover.lua
#include draws/draw_ship.lua
#include draws/draw_shockwave.lua
#include draws/draw_spark.lua
#include draws/draw_starfield.lua
#include draws/draw_start.lua
#include draws/draw_ui.lua
#include draws/draw_wave.lua
#include draws/draw_win.lua

#include objects/make_bullet.lua
#include objects/make_deathsplosions.lua
#include objects/make_enemy.lua
#include objects/make_explosion.lua
#include objects/make_shockwave.lua
#include objects/make_spark.lua
#include objects/make_sparks.lua
#include objects/make_wave.lua

#include ui/do_buttons.lua

#include main.lua

__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000008808800088088000bbbbb300bbbbb3000bb30000000000000000000
0070070000000000000000000000000000000000009779000007700000077000000770008ee8e7808118118003333b3003333b30003b30000000000000000000
0007700000000000000000000000000000000000009999000097790000077000009779008eeeee8081111180000bbb300bbbbb30000b30000000000000000000
00077000000000000000000000000000000000000009900000977900000770000097790008eee8000811180000033b300b333330000b30000000000000000000
007007000000000000000000000000000000000000000000009779000007700000977900008e80000081800000000b300b000000000b30000000000000000000
00000000000000000000000000000000000000000000000000099000000990000009900000080000000800000bbbbb300bbbbb300bbbbb300000000000000000
00000000000000000000000000000000000000000000000000000000000990000000000000000000000000000333333003333330033333300000000000000000
0000000000000000000000000000000000aaaa000000000000000000000000000000000000000000000000000000000000aaaa00009999000088880000eeee00
000000000000000000000000000000000a7777a0009999000000000000999900000000000000000000000000000000000a9999a00988889008eeee800eaaaae0
00000000000000000000000000000000a7aaaa7a099aa99000088000099aa99000000000000000000000000000000000a998899a988ee8898eeaaee8eaa99aae
00000000000000000000000000000000a7aaaa7a09a99a900089980009a99a9000000000000000000000000000000000a98ee89a98eaae898ea99ae8ea9889ae
00000000000000000000000000000000a7aaaa7a09a99a900089980009a99a9000000000000000000000000000000000a98ee89a98eaae898ea99ae8ea9889ae
00000000000000000000000000000000a7aaaa7a099aa99000088000099aa99000000000000000000000000000000000a998899a988ee8898eeaaee8eaa99aae
000000000000000000000000000000000a7777a0009999000000000000999900000000000000000000000000000000000a9999a00988889008eeee800eaaaae0
0000000000000000000000000000000000aaaa000000000000000000000000000000000000000000000000000000000000aaaa00009999000088880000eeee00
000dd000000dd000000dd000000dd000000000000000000000000000000990000000000000000000000000000000000000000000000000000000000000000000
000dd000000dd000000dd000000dd0000009900000000000000990000097a9000000000000000000000000000000000000000000000000000000000000000000
00d77d00000dd00000d77d00000dd000009a790000099000009a7900009a79000000000000000000000000000000000000000000000000000000000000000000
00d77d00000dd00000d77d00000dd00009a77a900097790009a77a90009779000000000000000000000000000000000000000000000000000000000000000000
0d7777d000d77d000d7777d000d77d0009a7aa9009a7aa9009a7aa900097a9000000000000000000000000000000000000000000000000000000000000000000
0d7777d000d77d000d7777d000d77d0009a77a909aa77aa909a77a90009779000000000000000000000000000000000000000000000000000000000000000000
0d7777d000d77d000d7777d000d77d0009aa7a909aaa7aa909aa7a90009a79000000000000000000000000000000000000000000000000000000000000000000
d7c77c7d00d77d00d7c77c7d00d77d0009a77a909aa77aa909a77a90009779000000000000000000000000000000000000000000000000000000000000000000
d7c77c7d00d77d00d7c77c7d00d77d0009a7aa909aa7aaa909a7aa900097a9000000000000000000000000000000000000000000000000000000000000000000
dcc77ccd00d77d00dcc77ccd00d77d0009a77a909aa77aa909a77a90009779000000000000000000000000000000000000000000000000000000000000000000
dcdccdcd00dccd00dcdccdcd00dccd0009aa7a909aaa7aa909aa7a90009a79000000000000000000000000000000000000000000000000000000000000000000
dddccddd00dccd00dddccddd00dccd0009a77a9009a77a9009a77a90009a79000000000000000000000000000000000000000000000000000000000000000000
0ddccdd000dccd000ddccdd000dccd0009a7aa900097a90009a7aa90009779000000000000000000000000000000000000000000000000000000000000000000
00dddd0000dddd0000dddd0000dddd00009a790000099000009a79000097a9000000000000000000000000000000000000000000000000000000000000000000
000dd000000dd000000dd000000dd000000990000000000000099000009a79000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000990000000000000000000000000000000000000000000000000000000000000000000
00000ee0000000000000000ee0000000000000000ee0000000000000000000000550055555500550000000000000000000003055550300000000000000000000
00002ffe00000000000000effe00000000000000eff2000000000000000000000dc000dccd000cd0000000000000000000003355553300000000070000700000
00028ff8e000000000000e8ff8e000000000000e8ff82000066000000000066000dccccccccccd0000004444444400000003b3baab3b30000000070000700000
00288ff88e0000000000e88ff88e0000000000e88ff8820005d6000000006d50000dddddddddd00000049aaaa99940000333b3baab3b33300700070000700070
02888c6888e00000000e888c6888e00000000e8886c88820005d60066006d5000000000dd0000000044999aaaaa99440033bb3b33b3bb3300a300b3003b003a0
0288dcc68880000000e888ccc6888e00000008886ccd88200005e60dd06e50000000000dd0000000049999cccc999940003bbb3c73bbb3000ab33bb33bb33ba0
2888dccc888e00000e8888cccc8888e00000e888cccd888200005dddddd5000000000666666000004aa99ccc7cc99aa40033bbccc7bb33000ab33bbaabb33ba0
2888ddcc88880000e88888cccc88888e00008888ccdd8882000666dddd66600000006cccccc600004aaaacccc7caaaa4003b3bccccb3b3000ab03bbc7bb30ba0
2888dddd88880000e88888dddd88888e00008888dddd8882666d5dd67dd5d6660006cc6666cc60004aa99dccccd99aa4003bbbccccbbb3000ab00bbccbb00ba0
28882dd288880000e888882dd288888e000088882dd2888205ddddd66ddddd50006cc667666cc600499999dddd999994003bbbccccbbb3000ab003bccb300ba0
228882288888000088828882288828880000888882288822005dddd55dddd50000ccc676666ccc00049999aaaa9999400003bbdccdbb30000ab000b55b000b30
22288ff8888800008822288ff8822288000088888ff882220005dddddddd500000cccd6666dccc000449999aa99994400003bbbddbbb3000003000baab000300
22228ff8828800008220228ff8220228000088288ff8222200005dddddd5000000dcccddddcccd000004999aa999400000003bbaabb300000000003aa3000000
220222222088000022000222222000220000880222222022000005dddd500000000dccccccccd0000000444444440000000003baab3000000000000aa0000000
2200555500880000220000555500002200008800555500220000005dd50000000000dccccccd000000000000000000000000003aa30000000000000330000000
2200588500ee000088000058850000880000ee0058850022000000055000000000000dddddd00000000000000000000000000003300000000000000000000000
0000000000000000b00000b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000dddd000000b3aaa3b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00dd00dddd00dd00b33333b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0089a098890a9800b3bbb3b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00899a9889a998003bbbbb3000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
008999cc7c99980000bbb00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00899cccc7c99800000b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00899cccccc9980000bbb00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00899dccccd998003bbbbb3000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
008999dddd9998003bcc7b3000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00049998899940003bc7cb3000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00004998899400003bcccb3000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000498894000003bcccb3000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000048840000003bbcbb3000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000044000000003bbb30000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000033300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
930100003a5103851036510325102e5102951026510235101f5101d5101a51016510145101251011510105100e5100c5100b5100c510135101b5100c40005400064000c4000c4000b4000c5000c5000c5002e500
070100002a67026660216501e640186401464012640106400c6300a63007630076300563004610036100161000610006100061000610006100000000000000000000000000000000000000000000000000000000
1601000024650206503f65039650336501c6401d6301d6301c6201c6201b6101b6101b6101b6101a610196101761015610146101261011610106100f6100f6100e6100e6100d6100c6100b6100a6100961008610