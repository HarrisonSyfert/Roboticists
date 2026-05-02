if(selected && !applied){
	  applied = true;
	  global.capstone_counter+=1;
	  global.phoenix_down=true;
	  global.capstone_upgrades=remove_upgrade_from_array(global.capstone_upgrades,object_index);
	  global.upgrade_list[4] = global.capstone_upgrades;
	
	  
	with (obj_phoenix_down) instance_destroy();
	with (obj_levelup_selector) instance_destroy();
    global.levelup_menu_active = false;

}