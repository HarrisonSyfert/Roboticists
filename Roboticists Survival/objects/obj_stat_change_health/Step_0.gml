if(selected && !applied){
	  applied = true;

	if(common_roll){
		obj_player.hp+=15;
		obj_player.current_hp+=15;
	}
	else if(uncommon_roll){
		obj_player.hp+=30;
		obj_player.current_hp+=30;
	}
	else if(rare_roll){
		obj_player.hp+=50;
		obj_player.current_hp+=50;
	}
	else if(legendary_roll){
		obj_player.hp+=100;
				obj_player.current_hp+=100;
	}

	with (obj_levelup_selector) instance_destroy();
	destroy_upgrades()

    global.levelup_menu_active = false;

}