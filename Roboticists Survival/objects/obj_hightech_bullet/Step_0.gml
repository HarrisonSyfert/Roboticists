if(selected && !applied){
	applied = true;
	obj_player.bullet_type=obj_player_bullet_hightech;
	global.obj_bullet_itterator += 1;
	with (obj_hightech_bullet) instance_destroy();
	with (obj_levelup_selector) instance_destroy();
    global.levelup_menu_active = false;

}