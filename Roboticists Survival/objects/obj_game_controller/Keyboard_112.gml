if(instance_exists(obj_player)){
	if(obj_player.ammo_count+add_ammo>obj_player.ammo_max){
		obj_player.ammo_count=obj_player.ammo_max;
	}
	else{
		obj_player.ammo_count+=add_ammo;
	}
}