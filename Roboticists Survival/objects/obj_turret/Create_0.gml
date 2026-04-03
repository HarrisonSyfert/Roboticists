alarm[0] = turret_duration;
facing=1;
cannon_ready=true
missile_ready=true;
is_attacking=false;
target = noone;
cannon_cooldown=global.cannon_cooldown;
if(global.turret_upgrade){
	sprite_index=spr_turret_upgrade_sentry;
}