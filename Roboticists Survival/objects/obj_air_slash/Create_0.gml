parent_weapon=obj_player.melee_type;
damage=0;
switch(parent_weapon){
	case obj_player_melee_basic:
	damage=20;
	break;
	
	case obj_player_sword:
	damage=50;
	break;
	
	
	case obj_player_rapier:
	damage=90;
	break;
	
	
	case obj_player_axe:
	damage=145;
	break;
}