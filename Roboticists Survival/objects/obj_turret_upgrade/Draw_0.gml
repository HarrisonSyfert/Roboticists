draw_set_color(c_white);
draw_set_font(fnt_ui_bold_levelup);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
col = make_color_rgb(255, 104, 0);
alpha = 0.831;

var title = "TURRET EVOLUTION";
var title_col = col;

draw_set_color(title_col);
draw_text(x, y - 400, title);

draw_sprite_ext(spr_turret_upgrade_sentry,0,x,y+100,1,1,0,c_white,1);