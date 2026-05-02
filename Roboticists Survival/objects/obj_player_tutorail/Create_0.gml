gravity_direction=270;
hp=100;
current_hp=100;
gravity_amount = .5;
facing =-1;
//Used to prevent double inputs from pause switching
active=true;
poisoned=false;
base_move_speed = 12;
is_dead=false;

//Cooldown Statements
turret_ready = 1;
turret_cap = 1;
turret_cooldown=30;
turret_cooldown_eff =  room_speed * turret_cooldown;
is_throwing=false;
can_double_jump=false;
turret_cooldown_ready=true;

//Firearm Variables
firing=false;
can_shoot=true;
firearm_cooldown=120;
fire_arm_sprite_cooldown=45;
ammo_count=10;
ammo_max=10;
basic_handgun=true;
dual_wield=false;
rifle=false;

//Magazine System for the rifle
magazine_size = 10; 
magazine_ammo = 10;  
magazine_count = 10; 
magazine_max = 10; 
reloading=false;
reload_time=73;


//melee logic
is_meleeing= false;
melee_cooldown=240;
can_melee=true;
melee_sprite_cooldown=50;
melee_weapon_sprite=spr_player_melee_basic;
melee_slash=false;


//Experience and level varialbes
experience=0;
level=1
max_experience=200;
level_up_texttimer=0;

//Upgrade logic
bullet_type= obj_player_bullet_basic;
bullet_iterator=0;
melee_type=obj_player_melee_basic;
melee_iterator=0;
melee_sprite=spr_player_basic_melee;
melee_sprite_iterator=0;

//Shield Logic
shield_capacity = 100;
shield_full = true;
current_shield = 100;
shield_buffer = 0;
shield_recharge_delay = 180;
shield_recharge_rate = 1;
has_taken_damage =false;
shield_broken = false;
was_recharging = false;

//Heath Regen
regen_rate=0;
regen_buffer = 0;


