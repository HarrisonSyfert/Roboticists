if(global.levelup_menu_active)
{
	image_alpha=0;
	exit;
}
else{
	image_alpha=1;
}
if(!instance_exists(player_reference)){
	player_reference=instance_nearest(x,y,obj_player);	
}

if(instance_exists(player_reference)){
	var side=1;
	if(player_reference.image_xscale<0){
		side =-1;
	}
	bob_timer+=bob_speed;
	
	var target_x = player_reference.x + (follow_xdistance *side);
	var target_y = player_reference.y + follow_ydistance + sin(bob_timer) * bob_amount;
	
	x = lerp(x, target_x, follow_speed);
    y = lerp(y, target_y, follow_speed);
	image_xscale = player_reference.image_xscale;
}

//Enemy targetting function
if (target == noone || target.is_dead){
	
	var closest_dist = attack_range;
	target = noone;
	
	
	with (obj_enemy_parent)
	{
		if (!is_dead)
		{
			var dist = point_distance(other.x, other.y, x, y);

			if (dist < closest_dist)
			{
				closest_dist = dist;
				other.target = id;
			}
		}
	}
}
if (target != noone && !target.is_dead && point_distance(x, y, target.x, target.y) <= attack_range)
{
	show_debug_message("Target found and in range");
	// Face target
	var move_direction = sign(target.x - x);

	if (move_direction != 0)
	{
		image_xscale = move_direction;
	}

	// Attack if ready
	if (laser_ready)
	{
		is_attacking=true;
		sprite_index = spr_drone_attack;
		image_index = 0;
		image_speed=2;
		
		var laser = instance_create_layer(x,y,"Instances",obj_laser);
		laser.direction = point_direction(x, y, target.x, target.y);
		laser.speed = 100;
		laser.image_angle = laser.direction;

		laser_ready = false;
		alarm[0] = laser_cooldown;
	}
}
else
	if (!is_attacking)
	{
		if (sprite_index != spr_drone_companion)
		{
			sprite_index = spr_drone_companion;
			image_index = 0;
		}
	}

// End attack animation
if (is_attacking)
{
	if (sprite_index == spr_drone_attack && image_index >= image_number - 1)
	{
		is_attacking = false;
		sprite_index = spr_drone_companion;
		image_index = 0;
	}
}