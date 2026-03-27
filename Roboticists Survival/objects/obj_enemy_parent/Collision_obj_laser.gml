enemy_hp -= other.damage;

with (other)
{
    instance_destroy();
}
show_debug_message("Enemy hit: " + string(id));