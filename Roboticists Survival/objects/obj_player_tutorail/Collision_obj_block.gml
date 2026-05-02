var hsp = 0;

if (keyboard_check(ord("D"))) hsp += move_speed;
if (keyboard_check(ord("A"))) hsp -= move_speed;

// X collision with obj_block
if (place_meeting(x + hsp, y, obj_block)) {
    while (!place_meeting(x + sign(hsp), y, obj_block)) {
        x += sign(hsp);
    }
    hsp = 0;
}

x += hsp;