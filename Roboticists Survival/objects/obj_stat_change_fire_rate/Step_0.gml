if(selected && !applied){
	 applied = true;

	if(common_roll){
		obj_player.firearm_cooldown=obj_player.firearm_cooldown*(1-.05);
	}
	else if(uncommon_roll){
		obj_player.firearm_cooldown=obj_player.firearm_cooldown*(1-.1);
	}
	else if(rare_roll){
		obj_player.firearm_cooldown=obj_player.firearm_cooldown*(1-.15);
	}
	else if(legendary_roll){
		obj_player.firearm_cooldown=obj_player.firearm_cooldown*(1-.25);
	}

	with (obj_levelup_selector) instance_destroy();
	destroy_upgrades()
	show_debug_message("Player Fire rate: " + string(obj_player.firearm_cooldown));

    global.levelup_menu_active = false;

}