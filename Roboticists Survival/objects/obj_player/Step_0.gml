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
	//Health logic
	if(current_hp<=0){
		instance_destroy();
		global.game_over=true;
	}		
	
	//Upgrade logic
if(experience>=max_experience){
	level+=1;
	experience=experience-max_experience;
	max_experience=floor(max_experience*1.1);
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
if(!is_throwing && !firing && !is_meleeing){
if keyboard_check(ord("A"))
{
	x += -move_speed;
	facing =1;
	//Running Animation Check
	if (sprite_index != spr_player_run)
	{
	sprite_index=spr_player_run;
	image_index = 0;
	}
	image_xscale=-1
}
if keyboard_check(ord("D")) 
{
	x += move_speed;
	facing =-1;
	//Running Animation Check
	if (sprite_index != spr_player_run) {
	sprite_index=spr_player_run;
	image_index=0;
	}
	image_xscale=1;
}

//Idle Reset Check
if (!keyboard_check(ord("A")) && !keyboard_check(ord("D")) && vspeed == 0 &&!is_throwing && !firing && !is_meleeing)
{
	if (sprite_index != spr_player_idle)
	{
		sprite_index = spr_player_idle;
		image_index = 0;
		image_xscale=facing;
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
if(!instance_place(x,y+1,obj_block)){
	vspeed+=1.5;
}
else{
	vspeed=0;
}
//Jump
if (keyboard_check_pressed(vk_space)) {

    // FIRST JUMP (on ground)
    if (place_meeting(x, y + 1, obj_block)) {
        vspeed = jump_height;
        can_double_jump = true;
    }
    
    // DOUBLE JUMP (in air)
    else if (can_double_jump) {
        show_debug_message("Double jumping...");
        vspeed = jump_height;
        can_double_jump = false;
    }
}



//Shooting logic
if (mouse_check_button_pressed(mb_left) && can_shoot && !firing &&ammo_count>0)
{
	var dir = point_direction(x, y, mouse_x, mouse_y);

		firing=true;
		sprite_index = spr_player_shoot;
		image_index = 0;
		image_xscale=1*facing;

	alarm[1]=firearm_cooldown;
	alarm[4]=fire_arm_sprite_cooldown;
	var bullet = instance_create_layer(x+20, y-130, "Instances", bullet_type);
	bullet.direction = dir;
	bullet.speed = 90;
	bullet.image_angle=dir;
	can_shoot=false
	ammo_count-=1;
	
}
//Melee Logic

if(keyboard_check_pressed(ord("V"))&&can_melee){
	var melee = instance_create_layer(x+(-1*facing*250),y-130,"Instances",melee_type);
	sprite_index = melee_sprite;
	image_index=0;
	image_speed=1;
	image_xscale=-1*facing;
	is_meleeing=true;
	alarm[2]=melee_cooldown;
	alarm[3]=melee_sprite_cooldown;
	can_melee=false;
}

//Turret throw logic
if (keyboard_check_pressed(ord("F")))
{
	if(turret_cooldown_ready && !is_throwing){
	is_throwing = true;
	sprite_index = spr_player_throw;
	image_index = 0;
	image_xscale=facing;
	
	var throw_x = x+(20*facing);
	var throw_y = y-30;
	
	var b = instance_create_layer(throw_x, throw_y - 20, "Instances", obj_turret_ball);
	b.hsp = 60 * -facing;
	b.vsp = -80;
	turret_cooldown_ready=false;
	alarm[0]=turret_cooldown;
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