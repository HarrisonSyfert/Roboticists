draw_set_color(c_white);
draw_set_font(fnt_ui_bold_levelup);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

var title = "SHIELD REGEN";
var desc = "";
var title_col = c_gray;

// Pick text + color based on rarity
if (common_roll) {
    desc = "+1 SHIELD/S";
    title_col = c_gray;
}
else if (uncommon_roll) {
    desc = "+2 SHIELD/S";
    title_col = c_green;
}
else if (rare_roll) {
    desc = "+3 SHIELD/S";
    title_col = make_color_rgb(160, 80, 255); // purple
}
else if (legendary_roll) {
    desc = "+5 SHIELD/S";
    title_col = make_color_rgb(255, 140, 0); // orange
}
//Title
draw_set_color(title_col);
draw_text(x, y - 80, title);
//Description
draw_set_color(c_white);
draw_text(x, y + 10, desc);