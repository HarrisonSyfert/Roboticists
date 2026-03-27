if(selected && !applied){
	 applied = true;

	if(common_roll){
		global.cannon_cooldown=global.cannon_cooldown*(1-.05);
		obj_drone_companion.laser_cooldown=obj_drone_companion.laser_cooldown*(1-.05);
	}
	else if(uncommon_roll){
		global.cannon_cooldown=global.cannon_cooldown*(1-.1);
		obj_drone_companion.laser_cooldown=obj_drone_companion.laser_cooldown*(1-.05);
	}
	else if(rare_roll){
		global.cannon_cooldown=global.cannon_cooldown*(1-.15);
		obj_drone_companion.laser_cooldown=obj_drone_companion.laser_cooldown*(1-.05);
	}
	else if(legendary_roll){
		global.cannon_cooldown=global.cannon_cooldown*(1-.25);
		obj_drone_companion.laser_cooldown=obj_drone_companion.laser_cooldown*(1-.05);
	}

	with (obj_levelup_selector) instance_destroy();
	destroy_upgrades()
	show_debug_message("Turret Fire rate: " + string(global.cannon_cooldown));
	show_debug_message("Drone Fire rate: " + string(obj_drone_companion.laser_cooldown));

    global.levelup_menu_active = false;

}