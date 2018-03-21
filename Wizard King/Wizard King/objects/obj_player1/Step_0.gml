//-------UPDATE INPUT
input_up = keyboard_check(ord("W"))
input_down = keyboard_check(ord("S"))
input_left = keyboard_check(ord("A"))
input_right = keyboard_check(ord("D"))
input_run = keyboard_check(vk_shift)
input_jump = keyboard_check(vk_space)
input_melee = mouse_check_button_pressed(mb_right)



//-------ALTER SPEED
if(input_run)	{ spd = r_spd }
else			{ spd = w_spd }



//-------RESET MOVE VARIABLES
moveX = 0
moveY = 0



//-------INTENDED MOVEMENT
moveX = (input_right - input_left) * spd
if(moveX == 0) { moveY = (input_down - input_up) * spd }



//-------COLLISION CHECK
//Horizontal
if(place_meeting(x + moveX, y, obj_wall)) {
	repeat(abs(moveX)) {
		if(!place_meeting(x + sign(moveX), y, obj_wall)) {
			x += sign(moveX)
		}
		else {
			break
		}
	}	
	moveX = 0
}

//Vertical
if(place_meeting(x, y + moveY, obj_collision_box)) {
	repeat(abs(moveY)) {
		if(!place_meeting(x, y + sign(moveY), obj_wall)) {
			y += sign(moveY)
		}
		else {
			break
		}
	}
	moveY = 0
}



//-------ADD MOVEMENT
y += moveY
x += moveX


