if(selected && !applied){
	  applied = true;

	if(common_roll){
		obj_player.turret_cooldown=obj_player.turret_cooldown*(1-.06);
		obj_player.melee_cooldown=obj_player.melee_cooldown*(1-.06);
	}
	else if(uncommon_roll){
			obj_player.turret_cooldown=obj_player.turret_cooldown*(1-.15);
			obj_player.melee_cooldown=obj_player.melee_cooldown*(1-.15);
	}
	else if(rare_roll){
			obj_player.turret_cooldown=obj_player.turret_cooldown*(1-.25);
			obj_player.melee_cooldown=obj_player.melee_cooldown*(1-.25);
	}
	else if(legendary_roll){
		obj_player.turret_cooldown=obj_player.turret_cooldown*(1-.4);
		obj_player.melee_cooldown=obj_player.melee_cooldown*(1-.4);
	}

	with (obj_levelup_selector) instance_destroy();
	destroy_upgrades()
	show_debug_message("Experience gain: " + string(global.experience_multi));
    global.levelup_menu_active = false;

}