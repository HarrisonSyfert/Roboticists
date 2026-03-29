if(global.levelup_menu_active)
{
	exit;
}

	draw_set_color(c_white);
	draw_set_font(fnt_ui_bold);

	var roboticist = instance_find(obj_player, 0);
	var gui_w = display_get_gui_width();
	var gui_h = display_get_gui_height();

	var left_x = 55;



	 var bar_x = 55;
	 var bar_y = gui_h - 140;
	 var bar_width = 250;
	 var bar_height = 65;
	 var display_hp=0;
	 var display_shield=0;
	 
	 if(instance_exists(roboticist)){
	 display_hp = roboticist.current_hp;
		 display_hp = lerp(display_hp, roboticist.current_hp, 0.1);
	 }
	 if(instance_exists(roboticist)){
	 display_shield = roboticist.current_shield;
		 display_shield = lerp(display_shield, roboticist.current_shield, 0.1);
	 }
	 
//Turret Cooldown Display
if(instance_exists(roboticist)){
	
    draw_set_halign(fa_left);
    draw_text(left_x, 115, "Turret Ready: ");
	if(roboticist.turret_cooldown_ready){
		draw_sprite_ext(spr_turret,0,left_x+279,142,.15,.15,0,c_white,1);
	}
	else{
		draw_sprite_ext(spr_turret,0,left_x+279,142,.15,.15,0,c_white,.5);
	}
	
}
// Health and Shield Bar
if (instance_exists(roboticist))
{
    var hp_bar_x = 55;
    var hp_bar_y = gui_h - 140;
    var hp_bar_width = 500;
    var hp_bar_height = 50;
	
	var shield_bar_x = 55
	var shield_bar_y = gui_h - 200; 
	var shield_bar_width = 500
	var shield_bar_height = 50

    var health_ratio = display_hp/ roboticist.hp;
    health_ratio = clamp(health_ratio, 0, 1);
	
	var shield_ratio = display_shield/roboticist.shield_capacity;
	shield_ratio= clamp(shield_ratio,0,1);

	//Health bar setup
    draw_set_color(c_gray);
    draw_rectangle(hp_bar_x, hp_bar_y, hp_bar_x + hp_bar_width, hp_bar_y + hp_bar_height, false);

	if (health_ratio < 0.3)
    {
        draw_set_color(c_red);
    }
    else
    {
        draw_set_color(c_green);
    }
	draw_rectangle(hp_bar_x, hp_bar_y, hp_bar_x + (hp_bar_width * health_ratio), hp_bar_y + hp_bar_height, false);

    draw_set_color(c_white);
    draw_text(hp_bar_x, hp_bar_y - 123, "HP: " + string(roboticist.current_hp) + " / " + string(roboticist.hp));
	
	
	//Shield bar Set up
	draw_set_color(c_gray);
	draw_rectangle(shield_bar_x, shield_bar_y, shield_bar_x + shield_bar_width, shield_bar_y + shield_bar_height, false);

	draw_set_color(c_blue);
	draw_rectangle(shield_bar_x, shield_bar_y, shield_bar_x + (shield_bar_width * shield_ratio), shield_bar_y + shield_bar_height, false);

	draw_set_color(c_white);
	draw_text(shield_bar_x, shield_bar_y - 30, "Shield: " + string(roboticist.current_shield) + " / " + string(roboticist.shield_capacity));
}
else
{
    draw_text(left_x, 55, "No Player");
}

// Player Name
if (instance_exists(roboticist))
{
    draw_set_halign(fa_left);
    draw_text(left_x, 55, "Name: " + global.player_name);
}

// Level indicator near bottom-left
if (instance_exists(roboticist))
{
    draw_set_halign(fa_left);
    draw_text(left_x+519, gui_h - 253, "Level: " + string(roboticist.level));
}
//Ammo Counter
if(instance_exists(roboticist)){
	if(roboticist.ammo_count>15){
	var ammo_cap=15;
	for(i=0; i<ammo_cap; i++){
		if(i<14){
			draw_sprite_ext(spr_bullet,0,62+(20*i),305,.5,.5,90,c_white,1);
		}
		else{
			draw_sprite_ext(spr_plus,0,72+(20*i),305,.5,.5,90,c_white,1);
		}
	}
}
	else{
	for(i=0; i<roboticist.ammo_count; i++){
	
		draw_sprite_ext(spr_bullet,0,62+(20*i),305,.5,.5,90,c_white,1);
	}
	}
if (instance_exists(roboticist))
{
    draw_set_halign(fa_left);
    draw_text(55,245,"Ammo Count:");
}
}
//Melee Cooldown
if (instance_exists(roboticist))
{
    draw_set_halign(fa_left);
    draw_text(55, 180, "Melee: ");
	if(roboticist.can_melee){
		if(roboticist.level<=1){
			draw_sprite_ext(spr_player_melee_basic,0,250,180,.35,.35,0,c_white,1);
		}else{
			draw_sprite_ext(roboticist.melee_weapon_sprite,0,250,180,.35,.35,0,c_white,1);
		}
	} 
	else{
		if(roboticist.level<=1){
			draw_sprite_ext(spr_player_melee_basic,0,250,180,.35,.35,0,c_white,.2);
		}else{
			draw_sprite_ext(roboticist.melee_weapon_sprite,0,250,180,.35,.35,0,c_white,.2);
		}
	}
}

// XP Bar Display
if (instance_exists(roboticist))
{
    var xp_bar_x = 575;
    var xp_bar_y = gui_h - 200;
    var xp_bar_width = 500;
    var xp_bar_height = 50;

    var xp_percentage = roboticist.experience / roboticist.max_experience;
    xp_percentage = clamp(xp_percentage, 0, 1);

    draw_set_color(c_black);
    draw_rectangle(xp_bar_x, xp_bar_y, xp_bar_x + xp_bar_width, xp_bar_y + xp_bar_height, false);

    draw_set_color(c_aqua);
    draw_rectangle(xp_bar_x, xp_bar_y, xp_bar_x + (xp_bar_width * xp_percentage), xp_bar_y + xp_bar_height, false);

    draw_set_color(c_white);
    draw_text(xp_bar_x, xp_bar_y - 20, "XP: " + string(roboticist.experience) + " / " + string(roboticist.max_experience));
}
