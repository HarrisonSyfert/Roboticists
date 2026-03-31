if(!is_dead & instance_exists(obj_player)){
		var target = instance_nearest(x, y, obj_player);
		var shell = instance_create_layer(x-600*(-1*move_direction),y-170,"Instances",obj_tank_shell);
		shell.direction = point_direction(x, y, target.x, target.y);
		shell.speed = 30;
		shell.image_angle = shell.direction;
}