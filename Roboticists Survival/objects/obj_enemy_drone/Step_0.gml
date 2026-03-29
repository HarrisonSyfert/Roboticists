if (global.levelup_menu_active)
{
	image_alpha = 0;
	exit;
}

image_alpha = 1;

// Death Check
if (enemy_hp <= 0 && !is_dead)
{
	is_dead = true;
	sprite_index = spr_drone_enemy_death;
	image_index = 0;
	image_speed = 1;
	obj_player.experience += 25;
	
	alarm[1] = 90;
	alarm[2] = 150;
}
//Falling when dead
if (is_dead)
{
	// Apply gravity
	if (!instance_place(x, y + 1, obj_block))
	{
		vspeed += .5;
	}
	else
	{
		vspeed = 0;
	}

	y += vspeed;
}


if(!is_dead){
bob_timer += bob_speed;

if (instance_exists(obj_player))
{
	player_reference = instance_nearest(x, y, obj_player);

	var dx = x - player_reference.x;
	var dy = y - player_reference.y;
	var dist = point_distance(x, y, player_reference.x, player_reference.y);

	// If too close or exactly on player, pick a default direction
	if (dist < 1)
	{
		dx = 1;
		dy = 0;
		dist = 1;
	}

	// Normalize direction away from player
	var dir_x = dx / dist;
	var dir_y = dy / dist;

	// Target point on edge of hover radius
	var base_x = player_reference.x + dir_x * hover_radius;
	var base_y = player_reference.y + dir_y * hover_radius;

	anchor_x = lerp(anchor_x, base_x, follow_speed);
	anchor_y = lerp(anchor_y, base_y, follow_speed);

	x = anchor_x;
	y = anchor_y + sin(bob_timer) * bob_amount;

	image_xscale = sign(player_reference.x - x);
	if (image_xscale == 0) image_xscale = 1;
}

// Targeting
if (instance_exists(obj_player))
{
	var player_inst = instance_nearest(x, y, obj_player);
	
	if (distance_to_object(obj_player) < attack_range)
	{
		move_direction = sign(player_inst.x - x);

		if (move_direction != 0)
		{
			image_xscale = move_direction;
		}

		if (distance_to_object(obj_player) <= fire_range && can_attack && !is_attacking)
		{
			can_attack = false;
			is_attacking = true;
			sprite_index = spr_drone_enemy_attack;
			image_index = 0;
			movement_speed = 0;
			alarm[0] = attack_cooldown;
			alarm[3] = attack_delay;
		}
	}
}

if (!is_attacking)
{
	if (sprite_index != spr_drone_enemy)
	{
		sprite_index = spr_drone_enemy;
		image_index = 0;
	}
}

// End attack animation
if (is_attacking)
{
	if (sprite_index == spr_drone_enemy_attack && image_index >= image_number - 1)
	{
		is_attacking = false;
		sprite_index = spr_drone_enemy;
		image_index = 0;
	}
}
}