if(hitX == false && hitY == false && hp > 0) {
	hp -= 10
	sprite_index = spr_snake_red
	alarm[0] = room_speed * 0.420
	alarm[1] = room_speed * 0.25
	hitX = true
	hitY = true
	if(obj_player.x < x) {
		hit_dir = 1
	}

	else {
		hit_dir = -1
	}
}