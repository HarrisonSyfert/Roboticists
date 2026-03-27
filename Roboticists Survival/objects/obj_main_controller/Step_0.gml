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