event_inherited();
gravity_direction=270;
gravity_amount=5;
move_direction=1;
vspeed=0;
can_attack=true;
is_attacking=false;
enemy_hp+=(global.second_timer/20);
show_debug_message("Enemy HP:"+string(enemy_hp));