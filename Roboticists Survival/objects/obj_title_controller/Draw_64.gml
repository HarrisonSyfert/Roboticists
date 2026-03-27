var gui_w = display_get_gui_width();
var gui_h = display_get_gui_height();

// Title
draw_set_alpha(title_alpha);
draw_sprite(spr_game_title, 0, gui_w / 2, gui_h / 3 - 150);
draw_set_alpha(1);