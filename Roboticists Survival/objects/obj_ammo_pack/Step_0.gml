if(!instance_place(x,y+1,obj_block)){
	vspeed+=1.5;
	
}
else{
	vspeed=0;
}

y += vspeed;

if(place_meeting(x, y, obj_block)) 
{
        y -= 10;
}
