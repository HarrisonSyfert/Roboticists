	var gui_w = display_get_gui_width();
	var gui_h = display_get_gui_height();
var roboticist = instance_find(obj_player_tutorail, 0);

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