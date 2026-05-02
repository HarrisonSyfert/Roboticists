ammo_pickup=irandom_range(2,4);
if(ammo_count+ammo_pickup>ammo_max){
	ammo_count=ammo_max;
}
else{
	ammo_count+=ammo_pickup;
}

instance_destroy(other);

magazine_pickup=irandom_range(1,2);
if(magazine_count+magazine_pickup>magazine_max){
	magazine_count=magazine_max;
}
else{
	magazine_count+=magazine_pickup;
}

instance_destroy(other);