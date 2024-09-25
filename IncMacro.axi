PROGRAM_NAME='IncMacro'

DEFINE_EVENT
button_event[dvTP_Macro,0]
{
    push:
    {
	switch(button.input.channel)
	{
	    case 1://start
	    {
		//do_push(dvTP_Display,27)
	    }
	    case 2://shutdown yes
	    {
		do_push(dvTP_Display,28)
	    }	
	    case 3://home 
	    {
		
	    }
	    case 4://switching
	    {
		do_push(dvTP_Display,27)
	    }
	    case 5://Audio Conference
	    {
	    
	    }
	    case 6://Lights
	    {
	    
	    }
	    case 7://Nav - shutdown 
	    {
	    
	    }
	}
    }
}