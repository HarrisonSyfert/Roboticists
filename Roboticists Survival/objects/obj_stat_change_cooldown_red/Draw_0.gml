draw_set_color(c_white);
draw_set_font(fnt_ui_bold_levelup);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

var title = "COOLDOWN RED.";
var desc = "";
var title_col = c_gray;

// Pick text + color based on rarity
if (common_roll) {
    desc = "+6% Reduction";
    title_col = c_gray;
}
else if (uncommon_roll) {
    desc = "+15% Reduction";
    title_col = c_green;
}
else if (rare_roll) {
    desc = "+25% Reduction";
    title_col = make_color_rgb(160, 80, 255); // purple
}
else if (legendary_roll) {
    desc = "+40% Reduction";
    title_col = make_color_rgb(255, 140, 0); // orange
}
//Title
draw_set_color(title_col);
draw_text(x, y - 80, title);
//Description
draw_set_color(c_white);
draw_text(x, y + 10, desc);