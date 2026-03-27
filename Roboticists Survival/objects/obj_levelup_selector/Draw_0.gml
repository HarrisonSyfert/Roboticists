draw_self();
draw_set_color(c_white);
draw_set_font(fnt_ui_bold_levelup);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

var title = "SELECT";
var title_col = c_white;


//Title
draw_set_color(title_col);
draw_text(x, y + 500, title);
