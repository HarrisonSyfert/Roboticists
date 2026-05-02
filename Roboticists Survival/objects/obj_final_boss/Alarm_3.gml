if (!is_dead && instance_exists(obj_player))
{
    var p = instance_nearest(x, y, obj_player);

    var melee = instance_create_layer(
        p.x,
        p.y + 300, 
        "Instances",
        obj_enemy_melee
    );

    show_debug_message("MELEE CREATED: " + string(melee));

    melee.image_xscale = 4 * attack_direction;
    melee.image_yscale = 4;
}