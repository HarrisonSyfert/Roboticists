if(!is_dead){
	var inst = instance_create_layer(x + (300 * move_direction), y, "Instances", obj_spider_melee);

	inst.image_xscale = 2;
	inst.image_yscale = 2;
}