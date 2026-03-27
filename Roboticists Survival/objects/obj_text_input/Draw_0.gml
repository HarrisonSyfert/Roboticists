draw_self();
draw_set_font(fnt_input_text)
if (visible_box) {
    var cx = room_width * 0.5;
    var cy = room_height * 0.5;

    var x1 = cx - 170;
    var y1 = cy - 40;
    var x2 = cx + 170;
    var y2 = cy + 40;

    // outer border
    draw_set_color(c_aqua);
    draw_rectangle(x1, y1, x2, y2, false);

    // inner fill
    draw_set_color(make_color_rgb(20, 20, 20));
    draw_rectangle(x1 + 2, y1 + 2, x2 - 2, y2 - 2, false);

    // title
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_font(fnt_ui);
    draw_set_color(c_aqua);
    draw_text(cx, y1 - 30, "Enter Your Name");

    // input text
    draw_set_font(fnt_input_text);
    draw_set_color(c_white);
    draw_text(cx, cy, keyboard_string + "|");
}