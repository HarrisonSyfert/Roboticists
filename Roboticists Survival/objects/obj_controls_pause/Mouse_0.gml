if (!instance_exists(obj_control_popup))
{
    var inst = instance_create_layer(x, y, "button_layer", obj_control_popup);

    inst.image_xscale = 8; 
    inst.image_yscale = 8;
}