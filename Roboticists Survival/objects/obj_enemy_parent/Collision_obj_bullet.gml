enemy_hp -= other.damage;

if(enemy_hp>0 || !is_dead){
	instance_destroy(other);
}
show_debug_message("Enemy hit: " + string(id));