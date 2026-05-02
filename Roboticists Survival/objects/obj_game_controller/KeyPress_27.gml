if (instance_exists(obj_main_controller))
{
	if (!global.levelup_menu_active)
	{
		global.levelup_menu_active = true;

		var cam = view_camera[0];
		var cx = camera_get_view_x(cam) + camera_get_view_width(cam) / 2;
		var cy = camera_get_view_y(cam) + camera_get_view_height(cam) / 2;
		var btn1 = instance_create_layer(cx, cy-400, "Level_up_text_layer", obj_controls_pause);
		btn1.image_xscale = 6;
		btn1.image_yscale = 6;

		var btn2 = instance_create_layer(cx, cy + 600, "Level_up_text_layer", obj_quit_game_pause);
		btn2.image_xscale = 6;
		btn2.image_yscale = 6;
	}
	else
	{
		global.levelup_menu_active = false;

		with (obj_controls_pause) instance_destroy();
		with (obj_quit_game_pause) instance_destroy();
	}
}