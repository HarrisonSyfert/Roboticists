
//Logic for fading in the title and buttons, rather than displaying them straight up on room loading.

// Fade in title first
if (title_alpha < 1)
{
	title_alpha += title_fade_speed;
	if (title_alpha > 1) title_alpha = 1;
}
else
{
	show_buttons = true;
}

// Spawn buttons once, after title is ready
if (show_buttons && !buttons_spawned){

	instance_create_layer(690, 340, "Instances", obj_start_game);
	instance_create_layer(690 , 480, "Instances", obj_controls);
	instance_create_layer(690, 620, "Instances", obj_quit_game);

	buttons_spawned = true;
}

// Then fade in buttons
if (buttons_spawned && buttons_alpha < 1)
{
	buttons_alpha += buttons_fade_speed;
	
	if (buttons_alpha > 1) buttons_alpha = 1;
}


