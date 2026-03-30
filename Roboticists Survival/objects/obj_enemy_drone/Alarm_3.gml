if(!is_dead & instance_exists(obj_player)){
		var target = instance_nearest(x, y, obj_player);
		var laser = instance_create_layer(x,y+255,"Instances",obj_enemy_laser_green);
		laser.direction = point_direction(x, y, target.x, target.y);
		laser.speed = 20;
		laser.image_angle = laser.direction;
}