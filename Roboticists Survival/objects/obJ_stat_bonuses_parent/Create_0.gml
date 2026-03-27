//Creating instanced rolls for stat bonuses
common_=common;
uncommon_=uncommon;
rare_=rare;
legendary_=legendary;
selected=false;
roll_sum=common+uncommon+rare+legendary;
roll = irandom_range(1,roll_sum);
applied=false;

common_roll=false;
uncommon_roll=false;
rare_roll=false;
legendary_roll=false;

if (roll <= common_) {
    common_roll = true;
}
else if (roll <= common_ + uncommon_) {
    uncommon_roll = true;
}
else if (roll <= common_ + uncommon_ + rare_) {
    rare_roll = true;
}
else {
    legendary_roll = true;
}

show_debug_message("common: " + string(common_));
show_debug_message("uncommon: " + string(uncommon_));
show_debug_message("rare: " + string(rare_));
show_debug_message("legendary: " + string(legendary_));
show_debug_message("roll: " + string(roll));