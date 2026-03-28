if(instance_exists(obj_player)){
	obj_player.current_hp-=custom_damage;
	instance_destroy();
}