if(selected && !applied){
	  applied = true;
	  instance_create_layer(x, y, "Instances", obj_drone_companion_right);
	  global.big_upgrades=remove_upgrade_from_array(global.big_upgrades,object_index);
	  global.upgrade_list[3] = global.big_upgrades;
	
	  
	with (obj_increase_drone_amount_right) instance_destroy();
	with (obj_levelup_selector) instance_destroy();
    global.levelup_menu_active = false;

}