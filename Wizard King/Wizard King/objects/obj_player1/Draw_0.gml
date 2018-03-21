var anim_length = 4
var frame_size = 32
var anim_speed = 8

if(moveX < 0) {
	if(input_run) {
		y_frame = 6
	}
	else {
		y_fram = 5
	}
}
else if(moveX > 0) {
	if(input_run) {
		y_frame = 1
	}
	else {
		y_fram = 0
	}
}
else if(moveY != 0) {
	y_frame = 10
}

//Draw initial sprite
draw_sprite_part(spr_player_sprite_sheet, 0, floor(x_frame) * frame_size, y_frame * frame_size, frame_size, frame_size, x * image_xscale, y)

//Increment frame for animation
if(x_frame < anim_length - 1) {
	x_frame += anim_speed/60
}
else {
	x_frame = 0
}