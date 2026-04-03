draw_set_color(c_white);
draw_set_font(fnt_ui_bold_levelup);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

var title = "+1 DRONE";
var title_col = c_yellow;

draw_set_color(title_col);
draw_text(x, y - 400, title);

draw_sprite_ext(spr_drone_companion,0,x,y,1.3,1.3,0,c_white,1);