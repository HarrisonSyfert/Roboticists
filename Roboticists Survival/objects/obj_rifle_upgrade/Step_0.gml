if(selected && !applied){
	  applied = true;
	  global.capstone_counter+=1;
	  obj_player.rifle=true;
	  obj_player.dual_wield=false;
	  obj_player.basic_handgun=false;
	  global.capstone_upgrades=remove_upgrade_from_array(global.capstone_upgrades,object_index);
	  global.upgrade_list[4] = global.capstone_upgrades;
	  global.big_upgrades=remove_upgrade_from_array(global.big_upgrades,obj_dual_wield);
	  global.upgrade_list[3] = global.big_upgrades;
	
	  
	with (obj_rifle_upgrade) instance_destroy();
	with (obj_levelup_selector) instance_destroy();
    global.levelup_menu_active = false;

}