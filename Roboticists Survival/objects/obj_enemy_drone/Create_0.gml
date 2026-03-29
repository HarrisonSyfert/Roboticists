event_inherited();
gravity_direction=270;
vspeed = 0;
can_attack = true;
is_attacking = false;
can_spawn = false;

enemy_hp += (global.second_timer / 10); // only if you really want this once on spawn

show_debug_message("Enemy HP:" + string(enemy_hp));

bob_timer = 0;
bob_speed = 0.08;
bob_amount = 120;
player_reference = noone;
follow_xdistance = 48;
follow_ydistance = -24;
follow_speed = 0.08;
side = 1;
anchor_x = x;
anchor_y = y;
hover_radius=1800;