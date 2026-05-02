function destroy_upgrades(){
	with (obj_stat_change_movement_speed) instance_destroy();
	with (obj_stat_change_max_ammo) instance_destroy();
	with (obj_stat_change_jump_height) instance_destroy();
	with (obj_stat_change_health) instance_destroy();
	with (obj_stat_change_gadget_fire_rate) instance_destroy();
	with (obj_stat_change_fire_rate) instance_destroy();
	with (obj_stat_change_experience_gain) instance_destroy();
	with (obj_axe_upgrade) instance_destroy();
	with (obj_advaned_bullet) instance_destroy();
	with (obj_experimental_bullet) instance_destroy();
	with (obj_hightech_bullet) instance_destroy();
	with (obj_rapier_upgrade) instance_destroy();
	with (obj_sword_upgrade) instance_destroy();
	with (obj_stat_change_cooldown_red) instance_destroy();
	with (obj_stat_change_health_regen) instance_destroy();
	with (obj_stat_change_shield_regen) instance_destroy();
	with (obj_sword_slash) instance_destroy();
	with (obj_dual_wield) instance_destroy();
	with (obj_turret_charge) instance_destroy();
	with (obj_turret_upgrade) instance_destroy();
	with (obj_rifle_upgrade) instance_destroy();
	with (obj_drone_upgrade) instance_destroy();
	with (obj_stat_change_shield_cap) instance_destroy();
	with (obj_increase_drone_amount_left) instance_destroy();
	with (obj_increase_drone_amount_right) instance_destroy();
	with (obj_phoenix_down) instance_destroy();
}