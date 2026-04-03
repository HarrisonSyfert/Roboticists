//Enemy targetting function
if(global.levelup_menu_active)
{
	image_alpha=0;
	exit;
}
else{
	image_alpha=1;
}

//Level 1
if(!global.turret_upgrade){
if (!instance_exists(target) || target.is_dead){
	
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
		audio_play_sound(snd_turret_fire,0,false);
		var fire_dir = point_direction(x, y, target.x, target.y);
		var muzzle_x = x + lengthdir_x(100, fire_dir);
		var muzzle_y = y - 230;
		var bullet = instance_create_layer(muzzle_x,muzzle_y,"Instances",obj_bullet);
		bullet.direction=fire_dir;
		bullet.speed=100;
		bullet.image_angle=fire_dir;


		cannon_ready = false;
		alarm[1] = cannon_cooldown-25;
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
}

//Level 2
if(global.turret_upgrade){
	if (!instance_exists(target) || target.is_dead){
	
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
	// Face target
	var move_direction = sign(target.x - x);

	if (move_direction != 0)
	{
		image_xscale =-1* move_direction;
	}

	// Attack if ready
	if (cannon_ready)
	{
		cannon_ready=false;
		sprite_index = spr_turret_upgrade_fire;
		image_index = 0;
		image_speed=.5
		var fire_dir = point_direction(x, y, target.x, target.y);
		var muzzle_x = x + lengthdir_x(100, fire_dir);
		var muzzle_y = y - 230;
		var bullet = instance_create_layer(muzzle_x,muzzle_y,"Instances",obj_turret_up_bullet);
		bullet.direction=fire_dir;
		bullet.speed=100;
		bullet.image_angle=fire_dir;
		audio_pause_sound(snd_upgrade_turret);
		audio_play_sound(snd_upgrade_turret,0,false);
		cannon_ready = false;
		alarm[1] = cannon_cooldown/1.5;
	}
}
else
	if (!is_attacking)
	{
		if (sprite_index != spr_turret_upgrade_sentry)
		{
			sprite_index = spr_turret_upgrade_sentry;
			image_index = 0;
		}
	}

// End attack animation
if (is_attacking)
{
	if (sprite_index == spr_turret_upgrade_fire && image_index >= image_number - 1)
	{
		is_attacking = false;
		sprite_index = spr_turret_upgrade_sentry;
		image_index = 0;
	}
}
	
}
