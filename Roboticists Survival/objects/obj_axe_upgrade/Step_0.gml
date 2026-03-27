if(selected && !applied){
	  applied = true;
	  obj_player.melee_type=obj_player_axe;
	  obj_player.melee_sprite=spr_player_axe;
	  obj_player.melee_weapon_sprite=spr_player_melee_axe;
	  	global.obj_melee_itterator += 1;
	with (obj_axe_upgrade) instance_destroy();
	with (obj_levelup_selector) instance_destroy();
    global.levelup_menu_active = false;

}