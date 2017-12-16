if(!invincible) {
	sprite_index = spr_player_hit
	alarm[4] = room_speed * 0.25
	alarm[5] = room_speed * 1.6
	alarm[6] = 6
	invincible = true
	hit = true
}