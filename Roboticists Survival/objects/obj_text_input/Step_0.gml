if (visible_box && active) {
    // limit text length
    if (string_length(keyboard_string) > max_length) {
        keyboard_string = string_copy(keyboard_string, 1, max_length);
    }

    // Enter = confirm
    if (keyboard_check_pressed(vk_enter)) {
        var final_name = string_trim(keyboard_string);
        if (final_name != "") {
            global.player_name = final_name;
            keyboard_string = "";
            room_goto_next();
        }
    }
}