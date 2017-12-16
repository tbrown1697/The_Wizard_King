//-------RESET MOVE VARIABLES
moveX = 0
moveY = obj_controller.force_gravity



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
	}
}



//-------SPRITE MANAGEMENT
//Flipping sprite horizontally
image_xscale = dir



//-------ADD MOVEMENT
y += moveY
x += moveX

