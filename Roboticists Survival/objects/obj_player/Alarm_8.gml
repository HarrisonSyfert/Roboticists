if (reloading)
{
    magazine_count -= 1;
    magazine_ammo = magazine_size;

    reloading = false;
    can_shoot = true;
}