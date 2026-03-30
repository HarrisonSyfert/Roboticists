if (instance_exists(obj_player) && can_spawn && global.stage >= 2)
{
	if (distance_to_object(obj_player) <= dis_from_player && room == main_room)
	{
		var roll = irandom_range(1, 50);

		if (roll <= 25)
		{
			can_spawn = false;
			alarm[0] = re_roll;
		}
		else
		{
			instance_create_layer(x, y, "Instances", obj_enemy_drone);
			can_spawn = false;
			alarm[0] = spawn_timer;
		}
	}
}