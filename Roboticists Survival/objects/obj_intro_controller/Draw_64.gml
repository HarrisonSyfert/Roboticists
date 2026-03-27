draw_set_color(c_black);
draw_set_font (fnt_studio_name) 
draw_rectangle(0, 0, room_width, room_height, false);

draw_set_alpha(alpha);
draw_set_color(c_white);

// logo sprite
draw_sprite(spr_moriko_mascot, floor(mascot_frame), room_width / 2 + 280, room_height / 2 +50);

// studio name
draw_set_halign(fa_center);
draw_text(room_width / 2+280, room_height / 2 + 300, "A Team Moriko Production");

draw_set_alpha(1);