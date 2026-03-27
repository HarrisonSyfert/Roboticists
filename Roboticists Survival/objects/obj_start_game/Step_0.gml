if (global.menu_active) exit;
var controller = instance_find(obj_title_controller, 0);

if (instance_exists(controller))
{
	image_alpha = controller.buttons_alpha;
}

