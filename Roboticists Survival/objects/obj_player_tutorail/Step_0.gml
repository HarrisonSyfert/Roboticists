
//Death
if (is_dead)
{
	if (sprite_index != spr_player_death)
	{
		audio_play_sound(snd_player_death, 0, false);
		sprite_index = spr_player_death;
		image_index = 0;
		image_speed = 1;
	}
	
	if (image_index >= image_number - 1)
	{
		image_index = image_number - 1;
		image_speed = 0;
	}
}


if(active && !is_dead){
if (reloading)
{
    sprite_index = spr_player_reload;
}
// Shield Logic
current_shield = clamp(current_shield, 0, shield_capacity);
shield_full = (current_shield >= shield_capacity);

// If shield is not full and player has NOT taken damage recently, recharge it
if (current_shield < shield_capacity && !has_taken_damage)
{
	shield_buffer += shield_recharge_rate / room_speed;
	
	if (shield_buffer >= 1)
	{
		var shield_gain = floor(shield_buffer);
		current_shield += shield_gain;
		shield_buffer -= shield_gain;
	}
	
	current_shield = min(current_shield, shield_capacity);
}
else if (current_shield >= shield_capacity)
{
	shield_buffer = 0;
}
//Shield Sound effect
if (current_shield == 0 && !shield_broken)
{
	shield_broken = true;
	audio_play_sound(snd_no_shield, 0, true);
}
else if (current_shield > 0)
{
	shield_broken = false;
	audio_pause_sound(snd_no_shield);
}
var is_recharging = (current_shield < shield_capacity && !has_taken_damage);

// Play sound ONLY when recharge starts
if (is_recharging && !was_recharging)
{
	audio_play_sound(snd_shield_regen, 0, false);
}

was_recharging = is_recharging;
//Poison Logic
if (poisoned) {
    move_speed = base_move_speed / 2;
} else {
    move_speed = base_move_speed;
}
	
		


// Health regen 
if (current_hp < hp)
{
	regen_buffer += regen_rate / room_speed;
	
	if (regen_buffer >= 1)
	{
		current_hp += floor(regen_buffer);
		regen_buffer -= floor(regen_buffer);
	}
	
	if (current_hp > hp)
	{
		current_hp = hp;
		regen_buffer = 0;
	}
}
else
{
	regen_buffer = 0;
}

	
//Upgrade logic
if(experience>=max_experience){
	level+=1;
	experience=experience-max_experience;
	max_experience=floor(max_experience*1.07);
	level_up_texttimer = 180;
	
}



//Movement Logic
if(!is_throwing && !firing && !is_meleeing && !reloading){
var move_x = 0;
var buffer = 40;

// Input
if (keyboard_check(ord("A")))
{
	move_x -= move_speed;
	facing = -1;
	image_xscale = -1;

	if (sprite_index != spr_player_run)
	{
		sprite_index = spr_player_run;
		image_index = 0;
	}
}

if (keyboard_check(ord("D")))
{
	move_x += move_speed;
	facing = 1;
	image_xscale = 1;


	if (sprite_index != spr_player_run)
	{
		sprite_index = spr_player_run;
		image_index = 0;
	}
}
// sound logic
if (move_x != 0 && vspeed==0)
{
	if (!audio_is_playing(snd_player_movement))
	{
		audio_play_sound(snd_player_movement, 0, true);
	}
}
else
{
	audio_stop_sound(snd_player_movement);
}

// Horizontal collision with wall and tank
if (move_x != 0)
{
    var wall_check_dist = move_speed + 40;

    var hit_wall = place_meeting(
        x + sign(move_x) * wall_check_dist,
        y,
        obj_wall
    );

    var hit_tank = place_meeting(
        x + move_x + sign(move_x) * buffer,
        y,
        obj_tank_enemy
    );

    if (hit_wall || hit_tank)
    {
        move_x = 0;
    }
}

// Apply movement
x += move_x;

//Idle Reset Check
if (!keyboard_check(ord("A")) && !keyboard_check(ord("D")) && vspeed == 0 &&!is_throwing && !firing && !is_meleeing && !reloading)
{
	if (sprite_index != spr_player_idle)
	{
		sprite_index = spr_player_idle;
		image_index = 0;
		image_xscale=-1*facing;
	}
}

if(vspeed!=0){
	if (sprite_index != spr_player_air)
	{
		sprite_index = spr_player_air;
		image_index = 0;
	}
}

}

//Gravity Cap
if(vspeed>25){
	vspeed=25;
}

//Gravity Function
if (!place_meeting(x, y + 1, obj_block) && !place_meeting(x, y + 40, obj_tank_enemy))
{
	vspeed += 1.5;
}
else
{
	vspeed = 0;
}
//Jump
if (keyboard_check_pressed(vk_space)) {

    // FIRST JUMP (on ground)
    if (place_meeting(x, y + 1, obj_block) || place_meeting(x, y + 80, obj_tank_enemy)) {
        vspeed = jump_height;
        can_double_jump = true;
		audio_play_sound(snd_jump,0,false)
    }
    
    // DOUBLE JUMP (in air)
    else if (can_double_jump) {
        show_debug_message("Double jumping...");
        vspeed = jump_height;
        can_double_jump = false;
		audio_play_sound(snd_jump,0,false)
    }
}



//Shooting logic
//Starter Handgun
if (mouse_check_button_pressed(mb_left) && can_shoot && !firing &&ammo_count>0 && basic_handgun)
{
	var dir = point_direction(x, y, mouse_x, mouse_y);

		firing=true;
		sprite_index = spr_player_shoot;
		image_index = 0;
		image_xscale=-1*facing;

	alarm[1]=firearm_cooldown;
	alarm[4]=fire_arm_sprite_cooldown;
	var bullet = instance_create_layer(x+20, y-130, "Instances", bullet_type);
	bullet.direction = dir;
	bullet.speed = 90;
	bullet.image_angle=dir;
	audio_play_sound(snd_basic_pistol,0,false);
	can_shoot=false
	ammo_count-=1;
	
}
//Dual Pistols
if (mouse_check_button_pressed(mb_left) && can_shoot && !firing &&ammo_count>0 && dual_wield)
{
	var dir = point_direction(x, y, mouse_x, mouse_y);

		firing=true;
		sprite_index = spr_player_dualies;
		image_index = 0;
		image_xscale=-1*facing;

	alarm[1]=firearm_cooldown;
	alarm[4]=fire_arm_sprite_cooldown;
	var bullet1 = instance_create_layer(x+20, y-130, "Instances", bullet_type);
	bullet1.direction = dir;
	bullet1.speed = 90;
	bullet1.image_angle=dir;
	var bullet2 = instance_create_layer(x+20, y-130, "Instances", bullet_type);
	bullet2.direction = dir;
	bullet2.speed = 70;
	bullet2.image_angle=dir;
	audio_play_sound(snd_Dual_pistols,0,false);

	can_shoot=false
	ammo_count-=1;
	
}
//Rifle Upgrade
// Rifle shooting
if (rifle && mouse_check_button(mb_left) && can_shoot && !firing && !reloading && magazine_ammo > 0)
{
    var dir = point_direction(x, y, mouse_x, mouse_y);

    firing = true;
    sprite_index = spr_player_rifle;
    image_index = 0;
    image_xscale = -1 * facing;

    alarm[1] = firearm_cooldown/20;
    alarm[4] = fire_arm_sprite_cooldown/2;
	audio_play_sound(snd_rifle,0,false);

    var bullet = instance_create_layer(x + 20, y - 130, "Instances", bullet_type);
    bullet.direction = dir;
    bullet.speed = 90;
    bullet.image_angle = dir;

    can_shoot = false;
    magazine_ammo -= 1;
}
//Auto Reload (Rifle)
if (rifle && magazine_ammo <= 0 && magazine_count > 0 && !reloading)
{
    reloading = true;
    can_shoot = false;
	sprite_index = spr_player_reload;
    image_index = 0;
    image_speed = .9;
	image_xscale=-1*facing;
	audio_play_sound(snd_reload,0,false)
    alarm[8] = reload_time;
}

//Manual Reload (rifle)
if (rifle && keyboard_check_pressed(ord("R")) && !reloading)
{
    if (magazine_ammo < magazine_size && magazine_count > 0)
    {
        reloading = true;
        can_shoot = false;
		sprite_index = spr_player_reload;
	    image_index = 0;
	    image_speed = .9;
		image_xscale=-1*facing;
		audio_play_sound(snd_reload,0,false);
        alarm[8] = reload_time;
    }
}
//Melee Logic

if(keyboard_check_pressed(ord("V"))&&can_melee){
	
	
	var melee = instance_create_layer(x+(1*facing*250),y-130,"Instances",melee_type);
	//Used to upscale the hit box radius
	melee.image_xscale = 2.5; // width scale
	melee.image_yscale = 2.5; // height scale
	sprite_index = melee_sprite;
	image_index=0;
	image_speed=1;
	image_xscale=facing;
	is_meleeing=true;
	alarm[2]=melee_cooldown;
	alarm[3]=melee_sprite_cooldown;
	if(melee_slash){
		
	var dir = point_direction(x, y, mouse_x, mouse_y);
	var slash = instance_create_layer(x + 20, y - 130, "Instances", obj_air_slash);
    slash.direction = dir;
    slash.speed = 50;
    slash.image_angle = dir;
			
	}
	can_melee=false;
}
}


