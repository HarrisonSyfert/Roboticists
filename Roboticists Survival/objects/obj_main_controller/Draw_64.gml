	var gui_w = display_get_gui_width();
	var gui_h = display_get_gui_height();

if(global.levelup_menu_active)
{
		//Victory Screen
		if (global.victory)
		{
		    draw_set_halign(fa_center);
		    draw_set_color(c_white);
			draw_text((gui_w/2), (gui_h/2)-50, "CONGRATS YOU HAVE WON!");
			draw_text((gui_w/2), (gui_h/2) , "PLEASE PRESS 'R' IF YOU WISH TO PLAY AGAIN!");

		}
	exit;
}

	draw_set_color(c_white);
	draw_set_font(fnt_ui_bold);

	var roboticist = instance_find(obj_player, 0);
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
	 
//Death Screen	 
if(instance_exists(roboticist)){
	if(roboticist.is_dead){
	draw_set_halign(fa_left)
	draw_set_color(c_white);
	draw_text((gui_w/2)-100, (gui_h/2)-50, "GAME OVER!");
	draw_text((gui_w/2)-200, (gui_h/2) , "PRESS R TO RESTART!");
	}
	
}


	 
//Turret Cooldown Display
if (instance_exists(roboticist))
{
    draw_set_halign(fa_left);
    draw_text(left_x, 115, "Turret Ready:");

    var turret_sprite;
    if (!global.turret_upgrade) {
        turret_sprite = spr_turret;
    } else {
        turret_sprite = spr_turret_upgrade_sentry;
    }

    var start_x = left_x + 305;
    var draw_y = 142;
    var spacing = 50;

    for (var i = 0; i < roboticist.turret_cap; i++)
    {
        var alpha = (i < roboticist.turret_ready) ? 1 : 0.5;

        draw_sprite_ext(
            turret_sprite,0,start_x + (spacing * i),draw_y,0.12,0.12,0,c_white,alpha);
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
	
	
	if(global.phoenix_down){
		draw_sprite_ext(spr_phoenix,0,hp_bar_x+400,hp_bar_y - 123,.2,.2,0,c_white,1);
	}
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
if (instance_exists(roboticist)) {
    if (roboticist.basic_handgun || roboticist.dual_wield) {
        if (roboticist.ammo_count > 15) {
            var ammo_cap = 15;
            for (var i = 0; i < ammo_cap; i++) {
                if (i < 14) {
                    draw_sprite_ext(spr_bullet, 0, 62 + (20 * i), 305, .5, .5, 90, c_white, 1);
                }
                else {
                    draw_sprite_ext(spr_plus, 0, 72 + (20 * i), 305, .5, .5, 90, c_white, 1);
                }
            }
        }
        else {
            for (var i = 0; i < roboticist.ammo_count; i++) {
                draw_sprite_ext(spr_bullet, 0, 62 + (20 * i), 305, .5, .5, 90, c_white, 1);
            }
        }
    }
    else if (roboticist.rifle) {
        if (roboticist.magazine_count > 10) {
            var mag_cap = 10;
            for (var i = 0; i < mag_cap; i++) {
                if (i < 9) {
                    draw_sprite_ext(spr_magazine, 0, 62 + (35 * i), 305, .5, .5, 0, c_white, 1);
                }
                else {
                    draw_sprite_ext(spr_plus, 0, 62 + (35 * i), 305, .5, .5, 0, c_white, 1);
                }
            }
        }
        else {
            for (var i = 0; i < roboticist.magazine_count; i++) {
                draw_sprite_ext(spr_magazine, 0, 62 + (35 * i), 305, .5, .5, 0, c_white, 1);
            }
        }

        // Current bullets in loaded magazine
        draw_text(62, 365, string(roboticist.magazine_ammo) + "/" + string(roboticist.magazine_size));
    }
}
if (instance_exists(roboticist))
{
    draw_set_halign(fa_left);
    draw_text(55,245,"Ammo Count:");
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
	//Boss HP Display
	if (instance_exists(obj_final_boss))
	{
	    var boss = instance_find(obj_final_boss, 0);

	    var bar_w = 800;
	    var bar_h = 40;

	    var bar_x = display_get_gui_width() / 2 - bar_w / 2;
	    var bar_y = 40;

	    var hp_percent = boss.enemy_hp / boss.enemy_hp_max;
	    hp_percent = clamp(hp_percent, 0, 1);

	    // background
	    draw_set_color(c_black);
	    draw_rectangle(bar_x - 4, bar_y - 4, bar_x + bar_w + 4, bar_y + bar_h + 4, false);

	    // missing health
	    draw_set_color(c_dkgray);
	    draw_rectangle(bar_x, bar_y, bar_x + bar_w, bar_y + bar_h, false);

	    // current health
	    draw_set_color(c_red);
	    draw_rectangle(bar_x, bar_y, bar_x + bar_w * hp_percent, bar_y + bar_h, false);

	    // text
	    draw_set_halign(fa_center);
	    draw_set_color(c_white);
	    draw_text(display_get_gui_width() / 2, bar_y + 50, "Ishtvalda: The Logic Plague");
	}