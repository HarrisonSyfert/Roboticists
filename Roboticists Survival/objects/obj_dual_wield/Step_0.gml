if(selected && !applied){
	  applied = true;
	  obj_player.dual_wield=true;
	  obj_player.rifle=false;
	  obj_player.basic_handgun=false;
	  global.big_upgrades=remove_upgrade_from_array(global.big_upgrades,object_index);
	  global.upgrade_list[3] = global.big_upgrades;
	
	  
	with (obj_sword_slash) instance_destroy();
	with (obj_levelup_selector) instance_destroy();
    global.levelup_menu_active = false;

}