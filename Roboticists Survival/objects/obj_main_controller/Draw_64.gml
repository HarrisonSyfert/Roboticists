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

// Health
if (instance_exists(roboticist))
{
    draw_set_halign(fa_left);
    draw_text(left_x, 115, "Heath " + string(roboticist.current_hp));
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
    draw_text(left_x, gui_h - 250, "Level: " + string(roboticist.level));
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

// XP Bar Display near bottom-left
var bar_x = 55;
var bar_y = gui_h - 140;
var bar_width = 600;
var bar_height = 50;

if (instance_exists(roboticist))
{
    var xp_percentage = round(roboticist.experience) / round(roboticist.max_experience);

    draw_set_color(c_black);
    draw_rectangle(bar_x, bar_y, bar_x + bar_width, bar_y + bar_height, false);

    draw_set_color(c_aqua);
    draw_rectangle(bar_x, bar_y, bar_x + (bar_width * xp_percentage), bar_y + bar_height, false);

    draw_set_color(c_white);
    draw_text(bar_x, bar_y - 60, "XP: " + string(roboticist.experience) + " / " + string(roboticist.max_experience));
}