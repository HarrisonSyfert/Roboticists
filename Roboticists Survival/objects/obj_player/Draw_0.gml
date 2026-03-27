if(global.levelup_menu_active)
{
	exit;
}

draw_set_color(c_white);
draw_set_font(fnt_ui);

draw_self();

if (level_up_texttimer > 0) {
    draw_set_halign(fa_center);
	var max_time=60;
	var progress=1-(level_up_texttimer/max_time);
	var float_y = progress *30;
	var alpha = level_up_texttimer/max_time;
	
	draw_set_alpha(alpha);
	draw_text_transformed(x+50, y - 450, "LEVEL UP!", 2, 2, 0);
	draw_set_alpha(1)
}