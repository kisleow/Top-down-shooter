 /// @description Insert description here
// You can write your code in this editor
if (mouse_check_button(mb_right) && !flying)
{
	direction = point_direction(x, y, mouse_x, mouse_y);
	image_angle = direction;
}	
if (mouse_check_button_released(mb_right))
{
	speed = 10;
	flying = true;
	oPlayer.control = true;
}	  