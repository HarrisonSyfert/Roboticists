display_set_gui_size(1920, 1080);
randomize();
//Budget Borderless window setting
window_set_fullscreen(false);

var w = display_get_width();
var h = display_get_height();

window_set_size(w, h);
window_set_position(0, 0);


global.player_name= "";
global.menu_active = false;

add_ammo=5;
global.victory=false;