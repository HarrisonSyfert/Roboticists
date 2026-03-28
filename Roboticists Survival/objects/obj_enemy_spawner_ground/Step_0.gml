if(instance_exists(obj_player) && can_spawn){
	if(dis_from_player<=distance_to_object(obj_player)){
		if(room==main_room){
			instance_create_layer(x,y,"Instances",obj_enemy_cybog);
			can_spawn=false;
			alarm[0]=spawn_timer;
		}
	}
}