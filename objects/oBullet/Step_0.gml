 /// @description Insert description here
// You can write your code in this editor
if (mouse_check_button(mb_left) && !flying)
{
	direction = point_direction(x, y, mouse_x, mouse_y);
	image_angle = direction;
}
if (mouse_check_button_released(mb_left))
{
	speed = 15;
	flying = true;
}	 