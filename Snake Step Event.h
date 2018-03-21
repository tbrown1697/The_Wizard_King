//-------RESET MOVE VARIABLES
if(hp > 0) {
	//X VARIABLES
	if(hitX == true) {
		moveX = 3 * hit_dir
	}

	else if(tracking) {
		moveX = 2 * dir
		if(x == obj_player.x) {
			moveX = 0
		}
	}

	else {
		if(wandering = "Left") {
			moveX = -2
		}
		else if(wandering = "Right") {
			moveX = 2
		}
		else {
			moveX = 0
		}
	}

	//Y VARIABLES	
	if(hitY == true && hp > 0) {
		moveY = -2
	}

	else {
		moveY = obj_controller.force_gravity
	}
}

else {
	moveX = 0
	moveY = obj_controller.force_gravity
}


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
		
		if(fear_of_heights && !position_meeting(x + (sprite_width/2) * dir, y + (sprite_height/2) + 8, obj_collision_box)) {
			moveX = 0
		}
	}
}



//-------SPRITE MANAGEMENT
//Flipping sprite horizontally and determining direction
if(moveX > 0) {
	image_xscale = 1
}

else if(moveX < 0) {
	image_xscale = -1
}

//Death animation
if(hp <= 0) {
	sprite_index = spr_snake_death
	if(image_index == 18) {
		instance_destroy()
	}
}



//-------TRACKING AND AI
if(distance_to_object(obj_player) < 150) {
	tracking = true
	if(obj_player.x < x) {
		dir = -1
	}
	else {
		dir = 1
	}
}

else {
	tracking = false
}



//-------ADD MOVEMENT
y += moveY
x += moveX


