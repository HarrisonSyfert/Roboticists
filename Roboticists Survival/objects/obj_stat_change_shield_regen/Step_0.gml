if(selected && !applied){
	  applied = true;

	if(common_roll){
		obj_player.shield_recharge_rate+=1;
	}
	else if(uncommon_roll){
		obj_player.shield_recharge_rate+=2;
	}
	else if(rare_roll){
		obj_player.shield_recharge_rate+=3;
	}
	else if(legendary_roll){
		obj_player.shield_recharge_rate+=5;
	}

	with (obj_levelup_selector) instance_destroy();
	destroy_upgrades()
	show_debug_message("Player Move speed: " + string(obj_player.move_speed));
    global.levelup_menu_active = false;

}