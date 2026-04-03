if(selected && !applied){
	  applied = true;
	  obj_player.turret_cap+=1;
	  obj_player.turret_ready+=1;
	  global.big_upgrades=remove_upgrade_from_array(global.big_upgrades,object_index);
	  global.upgrade_list[3] = global.big_upgrades;
	
	  
	with (obj_turret_charge) instance_destroy();
	with (obj_levelup_selector) instance_destroy();
    global.levelup_menu_active = false;

}