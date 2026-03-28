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
if(global.game_over=true){
	game_restart();
}

global.second_timer -= 1;

if (global.second_timer <= 0)
{
    global.seconds += 1;          // +1 every second
	 global.second_timer = room_speed; // reset timer
}