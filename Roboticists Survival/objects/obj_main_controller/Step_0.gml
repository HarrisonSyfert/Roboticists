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

timer += 1;

// Stage 2
if (timer >= room_speed * 180 && global.stage < 2)
{
	global.stage = 2;
}

// Stage 3
if (timer >= room_speed * 360 && global.stage < 3)
{
	global.stage = 3;
}

// Stage 4
if (timer >= room_speed * 540 && global.stage < 4)
{
	global.stage = 4;
}