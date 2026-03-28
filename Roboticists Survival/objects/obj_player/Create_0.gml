gravity_direction=270;
hp=100;
current_hp=100;
gravity_amount = .5;
facing =-1;
//Used to prevent double inputs from pause switching
active=true;

//Cooldown Statements
turret_cooldown_ready=true;
is_throwing=false;
can_double_jump=false;

//Firearm Variables
firing=false;
can_shoot=true;
firearm_cooldown=120;
fire_arm_sprite_cooldown=45;
ammo_count=10;
ammo_max=10;

//melee logic
is_meleeing= false;
melee_cooldown=240;
can_melee=true;
melee_sprite_cooldown=50;
melee_weapon_sprite=spr_player_melee_basic;


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
