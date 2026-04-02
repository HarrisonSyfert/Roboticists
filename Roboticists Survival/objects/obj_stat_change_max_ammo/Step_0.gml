if(selected && !applied){
	  applied = true;


	if(uncommon_roll){
		obj_player.ammo_max+=1;
		obj_player.magazine_max+=1;
	}
	else if(rare_roll){
		obj_player.ammo_max+=2;
		obj_player.magazine_max+=2;
	}
	else if(legendary_roll){
		obj_player.ammo_max+=3;
		obj_player.magazine_max+=3;
	}

	with (obj_levelup_selector) instance_destroy();
	destroy_upgrades()
    global.levelup_menu_active = false;

}