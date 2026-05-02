if(instance_exists(obj_player)){
	if(obj_player.is_dead){
		global.game_over=true;
	}
}
if (global.victory)
{
	game_restart();
}