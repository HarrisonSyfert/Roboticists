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
	sprite_index=spr_final_death
	image_index=0;
	image_speed=.5
	audio_play_sound(snd_boss_death,0,false);
	
	alarm[1]=120
}



if(is_dead){
	exit;
}

if(!is_dead){
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

if (movement_speed != 0 && sprite_index == spr_final_movement &&!is_dead)
{
    if (!audio_is_playing(snd_boss_movement))
    {
        audio_play_sound(snd_boss_movement, 0, true);
    }
}
else
{
    audio_stop_sound(snd_boss_movement);
}

// Player targeting
if (instance_exists(obj_player))
{
    var player_inst = instance_nearest(x, y, obj_player);
    var dist = distance_to_object(obj_player);

    if (dist < attack_range)
    {
        move_direction = sign(player_inst.x - x);

        if (move_direction != 0)
        {
            image_xscale = move_direction;
        }

        // MELEE attack
        if (dist <= melee_range && can_melee && !is_meleeing)
        {
            can_melee = false;
            is_meleeing = true;

            attack_direction = image_xscale;

            sprite_index = spr_final_melee;
            image_index = 0;
            movement_speed = 0;

            alarm[0] = melee_cooldown;
            alarm[3] = melee_delay;
        }

        // RANGED laser attack
        else if (dist > melee_range && dist <= attack_range && can_attack && !is_attacking && !is_meleeing)
        {
            can_attack = false;
            is_attacking = true;

            attack_direction = image_xscale;

            sprite_index = spr_final_laser; 
            image_index = 0;
            movement_speed = 0;
			audio_play_sound(snd_boss_laser,0,false);
            alarm[4] = laser_cooldown;
            alarm[5] = laser_delay;
        }
    }
}

// End ranged attack animation
if (is_attacking)
{
	if (sprite_index == spr_final_laser && image_index >= image_number - 1)
	{
		is_attacking = false;

		sprite_index = spr_final_movement;
		image_index = 0;
		movement_speed = base_movement_speed;
	}
}

// End attack animation
if (is_meleeing)
{
	if (sprite_index == spr_final_melee && image_index >= image_number - 1)
	{
		is_meleeing = false;

		sprite_index = spr_final_movement;
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


}