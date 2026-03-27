draw_set_color(c_white);
draw_set_font(fnt_ui_bold_levelup);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

var title = "Bullet Upgrade";
var title_col = c_red;

draw_set_color(title_col);
draw_text(x, y - 400, title);

draw_sprite_ext(spr_player_bullet_upgrade2,0,x,y,3,3,0,c_white,1);


draw_set_color(c_white);
draw_text(x, y +200, "Bullets Deal +" + string(75) +" Damage");