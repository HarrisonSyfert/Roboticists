if (instance_exists(obj_player) && can_spawn && global.stage >= 5)
{
	if (room == main_room)
	{
		var roll = irandom_range(1, 50);

		if (roll <= 40)
		{
			can_spawn = false;
			alarm[0] = re_roll;
		}
		else
		{
			instance_create_layer(x, y, "Instances", obj_final_boss);
			can_spawn = false;
		}
	}
}