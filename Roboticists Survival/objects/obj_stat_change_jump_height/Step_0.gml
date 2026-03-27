if(selected && !applied){
	  applied = true;

	if(common_roll){
		obj_player.jump_height=obj_player.jump_height*(1.02);
	}
	else if(uncommon_roll){
		obj_player.jump_height=obj_player.jump_height*(1.05);
	}
	else if(rare_roll){
		obj_player.jump_height=obj_player.jump_height*(1.08);
	}
	else if(legendary_roll){
		obj_player.jump_height=obj_player.jump_height*(1.15);
	}

	with (obj_levelup_selector) instance_destroy();
	destroy_upgrades()
	show_debug_message("Player Jump Height: " + string(obj_player.jump_height));
    global.levelup_menu_active = false;

}