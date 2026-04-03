audio_pause_sound(title_theme);
audio_play_sound(main_theme,-1,true);
global.levelup_menu_active=false;

global.bullet_upgrade_list=[obj_advaned_bullet,obj_hightech_bullet,obj_experimental_bullet];
global.melee_weapon_list=[obj_sword_upgrade,obj_rapier_upgrade,obj_axe_upgrade];
global.melee_weapon_animations=[spr_player_sword,spr_player_rapier,spr_player_axe];
global.melee_weapon_sprite_list=[spr_player_melee_sword,spr_player_melee_rapier,spr_player_melee_axe];
global.stat_upgrade_list=[obj_stat_change_shield_regen,obj_stat_change_cooldown_red,obj_stat_change_experience_gain,obj_stat_change_fire_rate,obj_stat_change_gadget_fire_rate,obj_stat_change_health_regen,obj_stat_change_health,obj_stat_change_jump_height,obj_stat_change_max_ammo,obj_stat_change_movement_speed];
global.big_upgrades=[obj_sword_slash,obj_dual_wield,obj_turret_charge,obj_turret_charge];
global.capstone_upgrades=[obj_turret_upgrade,obj_rifle_upgrade,obj_drone_upgrade];


//Stores all the list to randomly pull
global.upgrade_list=[global.bullet_upgrade_list,global.melee_weapon_list,global.stat_upgrade_list,global.big_upgrades,global.capstone_upgrades];


global.bullet_upgrade_list_len=array_length(global.bullet_upgrade_list);
global.melee_weapon_list_len =array_length(global.melee_weapon_list);
global.melee_weapon_animations_len=array_length(global.melee_weapon_animations);
global.stat_upgrade_list_len=array_length(global.stat_upgrade_list);
global.upgrade_list_len=array_length(global.upgrade_list);
global.big_upgrade_len=array_length(global.big_upgrades);
global.big_capstone_upgrades_len=array_length(global.capstone_upgrades);



//Storing for future usage
global.cannon_cooldown=60;
global.experience_multi=1;
global.turret_upgrade=false;

global.obj_melee_itterator = 0;
global.obj_bullet_itterator = 0;
global.drone_upgrade=false;
global.capstone_counter=0;

//Timer
global.second_timer = room_speed; 
timer=0;
global.stage=1;
