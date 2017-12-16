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
if(is_jumping == false)
{
	moveY = obj_controller.force_gravity
}

if(moveY > 0)
{
	is_falling = true
}



//-------INTENDED MOVEMENT
moveX = (input_right - input_left) * spd
//if(moveX == 0) { moveY = (input_down - input_up) * spd }



//-------COLLISION CHECK
//Horizontal
if(moveX != 0)
{
	if(place_meeting(x + moveX, y, obj_wall)) {
		repeat(abs(moveX)) {
			if(!place_meeting(x + sign(moveX), y, obj_wall)) 
			{
				x += sign(moveX)
			}
			else 
			{
				break
			}
		}
		moveX = 0
	}
}


//Vertical
if(moveY != 0)
{
	if(place_meeting(x, y + moveY, obj_wall)) {
		repeat(abs(moveY)) {
			if(!place_meeting(x, y + sign(moveY), obj_wall)) 
			{
				y += sign(moveY)
			}
			else 
			{
				break
			}
		}
		moveY = 0
		
		on_ground = true
		in_air = false
		is_jumping = false
		is_falling = false
	}
}



//-------PLAYER JUMPING
if(input_jump) {
	if(on_ground && !is_falling)
	{
		moveY = jump_power
		on_ground = false
		in_air = true
		is_jumping = true
	
		sprite_index = spr_player_jump_prep
		alarm[0] = room_speed * 0.2
	}
}



//-------PLAYER ATTACKS
//Melee
if(input_melee && !attacking) {
	attacking = true
	sprite_index = spr_player_attack
	alarm[3] = room_speed * 0.23
	instance_create_layer(x + (15 * image_xscale), y + 4, "Instances", obj_melee)
}



//-------SPRITE MANAGEMENT
//Flipping sprite horizontally
if(input_left) {
	image_xscale = -1.0
}

else if(input_right) {
	image_xscale = 1.0
}


//Switching between walking, running and idle animation
if(attacking == false && hit == false) {
	if(moveY == 0 && moveX != 0) {
		sprite_index = spr_player_walking
		if(input_run) {
			sprite_index = spr_player_running
		}
	}

	else if(moveY == 0 && moveX == 0) {
		sprite_index = spr_player_idle
	}
}



//-------ADD MOVEMENT
y += moveY
x += moveX


