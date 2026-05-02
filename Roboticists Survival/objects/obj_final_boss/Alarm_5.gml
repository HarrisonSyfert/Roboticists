if (!is_dead && instance_exists(obj_player))
{
    var p = instance_nearest(x, y, obj_player);
	var offset_x = 900; 
	var offset_y = -100;
    var laser = instance_create_layer(
        x + (offset_x * attack_direction),
        y+offset_y,
        "Instances",
        obj_boss_laser
    );

    laser.direction = point_direction(laser.x, laser.y, p.x, p.y);
    laser.speed = 30;
    laser.image_angle = laser.direction +180;

    show_debug_message("LASER CREATED: " + string(laser));
}