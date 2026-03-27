contains_object = false;
selected = false;
child_upgrade = noone;
displayed = noone;


//List Selection Weights
melee_roll_odds = 50;
bullet_roll_odds = 50;
other_roll_odds = 350;

if (global.obj_bullet_itterator >= array_length(global.bullet_upgrade_list))
{
    bullet_roll_odds = 0;
}

if (global.obj_melee_itterator >= array_length(global.melee_weapon_list)-1)
{
    melee_roll_odds = 0;
}

var total_weight = bullet_roll_odds + melee_roll_odds + other_roll_odds;
var roll = irandom_range(1, total_weight);

if (roll <= bullet_roll_odds)
{
    selector = 0;
}
else if (roll <= bullet_roll_odds + melee_roll_odds)
{
    selector = 1;
}
else
{
    selector = 2;
}

choosen = global.upgrade_list[selector];

if (selector == 0)
{
    displayed = global.bullet_upgrade_list[global.obj_bullet_itterator];
}
else if (selector == 1)
{
    displayed = global.melee_weapon_list[global.obj_melee_itterator];
}
else
{
    var choosen_len = array_length(choosen);
    var selector_2 = irandom_range(0, choosen_len - 1);
    displayed = choosen[selector_2];
}