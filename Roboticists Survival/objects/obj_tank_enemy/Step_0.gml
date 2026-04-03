if(global.levelup_menu_active)
{
	image_alpha=0;
	exit;
}
else{
	image_alpha=1;
}
if(enemy_hp<=0 && !is_dead){
	is_dead=true
	sprite_index=spr_enemy_tank_death
	image_index=0;
	image_speed=1
	//Small innate xp gain
	obj_player.experience+=250;
	audio_play_sound(snd_tank_death,0,false);
	alarm[1]=60
	alarm[2]=90
}



if(is_dead){
	exit;
}


//Check for valid ledge to keep moving
var check_x;
if (move_direction == 1)
{
	check_x = bbox_right + 2;
}
else
{
	check_x = bbox_left - 2;
}

var check_y = bbox_bottom + 2;

if (!instance_place(check_x, check_y, obj_block))
{
	move_direction = -1*move_direction;
	image_xscale=image_xscale *-1;
}

x += move_direction * movement_speed;

if (instance_exists(obj_player))
{
	var player_inst = instance_nearest(x, y, obj_player);
	
	if (distance_to_object(obj_player) < attack_range)
	{
		move_direction = sign(player_inst.x - x);

		if (move_direction != 0)
		{
			image_xscale = -1* move_direction;
		}

		if (distance_to_object(obj_player) <= fire_range && can_attack && !is_attacking)
		{
			audio_play_sound(snd_tank_fire,0,false);
			can_attack = false;
			is_attacking = true;
			sprite_index = spr_tank_attack;
			image_index = 0;
			movement_speed = 0;
			alarm[0] = attack_cooldown;
			alarm[3] = attack_delay;
		}
	}
}

if (!is_attacking && movement_speed>0)
{
	if (sprite_index != spr_tank_moving)
	{
		sprite_index = spr_tank_moving;
		image_index = 0;
	}
}
else if(!is_attacking && movement_speed==0){
	sprite_index=spr_tank_idle
	image_index=0;
}

// End attack animation
if (is_attacking)
{
	if (sprite_index == spr_tank_attack && image_index >= image_number - 1)
	{
		is_attacking = false;
		sprite_index = spr_tank_moving;
		image_index = 0;
	}
}


// Apply gravity
vspeed += 1.5;
if (vspeed > 12) vspeed = 12;

if (place_meeting(x, y + vspeed, obj_block))
{
    while (!place_meeting(x, y + sign(vspeed), obj_block))
    {
        y += sign(vspeed);
    }
    
    vspeed = 0;
}
else
{
    y += vspeed;
}