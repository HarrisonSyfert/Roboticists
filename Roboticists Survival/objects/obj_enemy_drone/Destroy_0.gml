
//Ammo pack spawn check
ammo_spawn=irandom_range(1,7);
if(ammo_spawn<=5){
	var inst=instance_create_layer(x,y,"Instances",obj_ammo_pack)
	inst.hspeed = random_range(-20, 20);
	inst.vspeed = random_range(-50, -40);
}

//Xp orb Spawn
orb_spawn_amount=irandom_range(3,5)

for(i=0; i<orb_spawn_amount;i++){
	var inst=instance_create_layer(x,y,"Instances",obj_xp_orb)
	inst.hspeed = random_range(-20, 20);
	inst.vspeed = random_range(-50, -40);
}