if(selected && !applied){
	  applied = true;

	if(common_roll){
		global.experience_multi+=.1;;
	}
	else if(uncommon_roll){
		global.experience_multi+=.15;	
	}
	else if(rare_roll){
		global.experience_multi+=.25;
	}
	else if(legendary_roll){
		global.experience_multi+=.43;
	}

	with (obj_levelup_selector) instance_destroy();
	destroy_upgrades()
	show_debug_message("Experience gain: " + string(global.experience_multi));
    global.levelup_menu_active = false;

}