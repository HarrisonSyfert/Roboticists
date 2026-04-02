if (instance_exists(obj_player))
{
    var dmg = round(custom_damage*(1+(global.second_timer/50)));

    // reset shield recharge
    obj_player.has_taken_damage = true;
    obj_player.recharging_shield = false;
    obj_player.alarm[6] = obj_player.shield_recharge_delay;
    obj_player.alarm[7] = -1;

    // shield absorbs damage first
    if (obj_player.current_shield > 0)
    {
        if (obj_player.current_shield >= dmg)
        {
            obj_player.current_shield -= dmg;
            dmg = 0;
        }
        else
        {
            dmg -= obj_player.current_shield;
            obj_player.current_shield = 0;
        }
    }

    // leftover damage goes to health
    if (dmg > 0)
    {
        obj_player.current_hp -= dmg;
    }
    obj_player.poisoned = true;
    obj_player.alarm[7] = 120;

    instance_destroy();
}