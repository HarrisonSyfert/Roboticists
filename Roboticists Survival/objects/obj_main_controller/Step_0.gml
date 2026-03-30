//Check if the player levels up, then randomly select from 3 random prompts for the level up
//Should pull from a set of outcomes per level up that increases player power.
if(global.levelup_menu_active)
{
	exit;
}

if (!global.levelup_menu_active)
{
    destroy_upgrades();
}
if(obj_player.hp<=0){
	global.game_over=true;
}
if(global.game_over){
	game_restart();
}

//Stage 2
timer += 1;
if (timer >= room_speed * 180 && global.stage<2) 
{
	timer = 0;
	global.stage += 1;
}