 /// @description Insert description here
// You can write your code in this editor

if (control)
{
	player_movement(); 

	#region динамика спрайтов ходьбы
	if (hMove = 1)
	{
		sprite_index = sPlayerMoveRight;
		direction = 0;
	}
	else if (hMove = -1)
	{
		sprite_index = sPlayerMoveLeft;
		direction = 180;	
	}



	if (vMove = 1)
	{
		sprite_index = sPlayerMoveDown;
		direction = 270;
	}
	else if (vMove = -1)
	{
		sprite_index = sPlayerMoveUp;
		direction = 90;
	}


	if (hMove = 0 && vMove = 0)
	{
		sprite_index = sPlayerStand;
		image_speed = 0;
		image_index = direction / 90;
	}
	else image_speed = 1;
	#endregion

 	#region стрельба пулями
	if (mouse_check_button_pressed(mb_left))
	{
		var bullet = instance_create_layer(x, y, "Bullets", oBullet);
		bullet.speed = 15;
		bullet.direction = direction;
	}
if (mouse_check_button_pressed(mb_left))
{	var hpos = 0; vpos = 0;
			switch (direction)
			{
				case 0: hpos = 32; break; 
				case 90: vpos = -32; break;
				case 180: hpos = -32; break;
				case 270: vpos = 32; break;
			}
}	


	#endregion 

  	#region стрельба ракетами
	if (mouse_check_button_pressed(mb_right))
	{
		var hpos = 0; vpos = 0;
		switch (direction)
		{
			case 0: hpos = 32; break;
			case 90: vpos = -32; break;
			case 180: hpos = -32; break;
			case 270: vpos = 32; break;
		}
	
		instance_create_layer(x + hpos, y + vpos, "Bullets", oFist);
		control = false; 
	    hsp = 0;
		vsp = 0;
		sprite_index = sPlayerStand;
		image_speed = 0;
	}
	#endregion

	#region непроходимость сквозь стены
if (place_meeting(x + hsp, y, oWall))
{
	while(!place_meeting(x + sign(hsp), y, oWall))
	{
		x += sign(hsp);
	}
	hsp = 0;
}

if (place_meeting(x, y + vsp, oWall))
{
	while(!place_meeting(x, y + sign(vsp), oWall))
	{
		y += sign(vsp);
	}
     
}
}

	x += hsp;
	y += vsp;
	#endregion