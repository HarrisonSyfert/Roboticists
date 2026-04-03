if(selected && !applied){
	  applied = true;

	if(common_roll){
		obj_player.current_shield+=15;
		obj_player.shield_capacity+=15;
	}
	else if(uncommon_roll){
		obj_player.current_shield+=30;
		obj_player.shield_capacity+=30;
	}
	else if(rare_roll){
		obj_player.current_shield+=50;
		obj_player.shield_capacity+=50;
	}
	else if(legendary_roll){
		obj_player.current_shield+=100;
		obj_player.shield_capacity+=100;
	}

	with (obj_levelup_selector) instance_destroy();
	destroy_upgrades()

    global.levelup_menu_active = false;

}