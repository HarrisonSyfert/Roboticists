ammo_pickup=irandom_range(2,4);
if(ammo_count+ammo_pickup>ammo_max){
	ammo_count=ammo_max;
}
else{
	ammo_count+=ammo_pickup;
}

instance_destroy(other);