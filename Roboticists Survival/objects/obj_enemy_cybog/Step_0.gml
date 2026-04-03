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
	sprite_index=spr_cyborg_death
	image_index=0;
	image_speed=1
	//Small innate xp gain
	obj_player.experience+=5;
	audio_play_sound(snd_cyborg_death,0,false);
	
	alarm[1]=90
	alarm[2]=150
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

// Player targeting
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

		// Attack
		if (distance_to_object(obj_player) <= melee_range && can_attack && !is_attacking)
		{
			can_attack = false;
			is_attacking = true;

			sprite_index = spr_cyborg_attack;
			image_index = 0;
			movement_speed=0;
			alarm[0] = attack_cooldown;
			alarm[3]=attack_delay;
		}
	}
}

// Return to idle ONLY if not attacking
if (!is_attacking)
{
	if (sprite_index != spr_enemy_cyborg)
	{
		sprite_index = spr_enemy_cyborg;
		image_index = 0;
	}
}

// End attack animation
if (is_attacking)
{
	if (sprite_index == spr_cyborg_attack && image_index >= image_number - 1)
	{
		is_attacking = false;

		sprite_index = spr_enemy_cyborg;
		image_index = 0;
		image_index=image_number-1;
	}
}



//Gravity Function
if(!instance_place(x,y+1,obj_block)){
	vspeed+=1.5;
}
else{
	vspeed=0;
}

y += vspeed;


