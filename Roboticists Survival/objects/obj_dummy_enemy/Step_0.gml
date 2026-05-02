// Inherit the parent event
event_inherited();


if(enemy_hp<=0 && !is_dead){
	is_dead=true
	sprite_index=spr_cyborg_death
	image_index=0;
	image_speed=1
	obj_player_tutorail.experience+=5;
	audio_play_sound(snd_cyborg_death,0,false);
	
	alarm[1]=90
	alarm[2]=150
}