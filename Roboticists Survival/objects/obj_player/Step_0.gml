//Level up logic
if(global.levelup_menu_active)
{
	image_alpha=0;
	//Stops falling while selecting level ups:
	vspeed=0;
	active=false;
	exit;
}
else{
	image_alpha=1;
	if(alarm[5]<0)
	{
		alarm[5]=pause_delay;
	}
}
if(active){
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
	
		


//Health logic
if(current_hp<=0){
	instance_destroy();
	global.game_over=true;
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
	//Dimensions of the screen
	var cam = view_camera[0];
	var cx = camera_get_view_x(cam) + camera_get_view_width(cam) * 0.5;
	var cy = camera_get_view_y(cam) + camera_get_view_height(cam) * 0.5;
	instance_create_layer(cx-1750,cy,"Level_up_layer",obj_levelup_selector);
	instance_create_layer(cx,cy,"Level_up_layer",obj_levelup_selector);
	instance_create_layer(cx+1750,cy,"Level_up_layer",obj_levelup_selector);

	global.levelup_menu_active=true;
	
}
if (level_up_texttimer > 0) {
    level_up_texttimer--;
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

// Horizontal collision with tank
if (move_x != 0)
{
	if (place_meeting(x + move_x + sign(move_x) * buffer, y*buffer, obj_tank_enemy))
	{
		while (!place_meeting(x + sign(move_x), y, obj_tank_enemy))
		{
			x += sign(move_x);
		}
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

//Turret throw logic
if (keyboard_check_pressed(ord("F")) && turret_ready > 0 && !is_throwing)
{
    is_throwing = true;
    sprite_index = spr_player_throw;
    image_index = 0;
    image_xscale = -1 * facing;

    var throw_x = x + (20 * facing);
    var throw_y = y - 30;

    var b = instance_create_layer(throw_x, throw_y - 20, "Instances", obj_turret_ball);
    b.hsp = 60 * facing;
    b.vsp = -80;

    turret_ready -= 1;

    if (turret_ready < turret_cap && alarm[0] < 0)
    {
        alarm[0] = turret_cooldown_eff;
    }
}
if (is_throwing)
{
	if (image_index >= image_number - 1)
	{
		is_throwing = false;
	}
}
}
if(turret_ready<=0){
	turret_cooldown_ready=false;
}
else{
	turret_cooldown_ready=true;
}