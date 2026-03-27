timer += 1;

// fade in
if (timer < 60)
{
	alpha = timer / 60;
}
// hold
else if (timer < 120)
{
	alpha = 1;
}
// fade out
else if (timer < 180)
{
	alpha = 1 - ((timer - 120) / 60);
}
else
{
	room_goto(title_room); 
}


//Moriko Sprite animation settings
mascot_frame += mascot_speed;

if (mascot_frame >= sprite_get_number(spr_moriko_mascot))
{
	mascot_frame = 0;
}