draw_set_color(c_white);
draw_set_font(fnt_ui_bold_levelup);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

var title = "MELEE WEAPON";
var title_col = c_red;

draw_set_color(title_col);
draw_text(x, y - 400, title);

draw_sprite_ext(spr_player_melee_sword,0,x,y,2.5,2.5,50,c_white,1);