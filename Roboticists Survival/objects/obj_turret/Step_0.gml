//Enemy targetting function
if(global.levelup_menu_active)
{
	image_alpha=0;
	exit;
}
else{
	image_alpha=1;
}

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
	if (cannon_ready)
	{
		cannon_ready=false;
		sprite_index = turret_cannonfire_sprite;
		image_index = 0;
		
		var fire_dir = point_direction(x, y, target.x, target.y);
		var muzzle_x = x + lengthdir_x(100, fire_dir);
		var muzzle_y = y - 230;
		var bullet = instance_create_layer(muzzle_x,muzzle_y,"Instances",obj_bullet);
		bullet.direction=fire_dir;
		bullet.speed=100;
		bullet.image_angle=fire_dir;


		cannon_ready = false;
		alarm[1] = cannon_cooldown;
	}
}
else
	if (!is_attacking)
	{
		if (sprite_index != spr_turret)
		{
			sprite_index = spr_turret;
			image_index = 0;
		}
	}

// End attack animation
if (is_attacking)
{
	if (sprite_index == turret_cannonfire_sprite && image_index >= image_number - 1)
	{
		is_attacking = false;
		sprite_index = spr_turret;
		image_index = 0;
	}
}