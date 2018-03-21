var num = irandom_range(-1, 1)
if(num == -1) {
	wandering = "Left"
}
else if(num == 0) {
	wandering = ""
}
else {
	wandering = "Right"
}
alarm[2] = room_speed * irandom_range(0.5, 1.5)