PROGRAM_NAME='AMX-PR-WP-412'



DEFINE_DEVICE
//dvWP_1	 =0:3:0
//dvTP_WP_1	=10001:3:0

DEFINE_MUTUALLY_EXCLUSIVE
([dvTP_WP_1,1]..[dvTP_WP_1,14])

DEFINE_VARIABLE
char sWP_1_Mode_Selection_Cmd[][30]=
{
    'set video mode:matrix',
    'set video mode:pip',
    'set video mode:3stack',
    'set video mode:quad',
    'load preset:1',//single Display
    'load preset:2',//Side by side
    'load preset:3',//
    'load preset:4',//
    'load preset:5',//
    'load preset:6',//
    'load preset:7',//
    'load preset:8',//
    'load preset:9',//
    'load preset:10'//
}
char sWP_Input_Name[][25]=
{
    'Cable Cubby 1',
    'Cable Cubby 2',  
    'Camera',  
    'Input 4'	
}
integer nWP_1_Input_No,nWP_1_Window_No
integer nMode_Status
integer nInputWindow,nOutputWindow
DEFINE_CONSTANT
WP_1_PORT	= 23		//PHYSICAL DEVICE IP PORT
WP_1_ADDRESS	='192.168.0.18'	//PHYSICAL DEVICE IP ADDRESS


DEFINE_CALL 'OPEN_CLIENT_CONNECTION_FOR_WP_1'()
{
    //SLONG IP_CLIENT_OPEN(INTEGER LocalPort,CHAR ServerAddress[ ],LONG ServerPort,INTEGER Protocol)
    IP_CLIENT_OPEN(dvWP_1.port,WP_1_ADDRESS,WP_1_PORT,IP_TCP)
}

DEFINE_START
CALL 'OPEN_CLIENT_CONNECTION_FOR_WP_1'()

DEFINE_EVENT
data_event[dvWP_1]
{
    online:
    {
	CALL 'OPEN_CLIENT_CONNECTION_FOR_WP_1'()
    }
    offline:
    {
	CALL 'OPEN_CLIENT_CONNECTION_FOR_WP_1'()
    } 
    STRING:
    {
//	if(find_string(data.text,'login:',1))
//	{
//	    SEND_STRING dvWP_1,"'admin\n'"  	//username
//	    AMX_LOG(AMX_WARNING,"'login'")
//	}
//	else if(find_string(data.text,'password',1))
//	{
//	    SEND_STRING dvWP_1,"'admin\n'"    //password 
//	   AMX_LOG(AMX_WARNING,"'password'")    
//	}
    }
    onerror:
    {
	switch(data.number)
	{	
	    case 7: //Connection timed out
	    case 9: //Already closed
	    case 17:// Local Port Not Open
	    {
		CALL 'OPEN_CLIENT_CONNECTION_FOR_WP_1'()
	    }
	    case 2: //General failure (out of memory)
	    case 4: //Unknown host
	    case 6: //Connection refused
	    case 8:// Unknown connection error
	    case 14://Local port already used
	    case 16:// Too many open sockets
	    {}
	}
    }
}
BUTTON_EVENT[dvTP_WP_1,0]
{
    push:
    {
	switch(button.input.channel)
	{
	    case 1:
	    case 2:
	    case 3:
	    case 4:
	    case 5:
	    case 6:
	    {
		send_string dvWP_1,"sWP_1_Mode_Selection_Cmd[button.input.channel],$0D,$0A"
		nMode_Status=button.input.channel
		on[dvTP_WP_1,nMode_Status]
		
	    }
	}
    }
}

BUTTON_EVENT[dvTP_LayOut,0]
{
    PUSH:
    {
	switch(button.input.channel)
	{
	    CASE 1:
	    CASE 2:
	    CASE 3:
	    CASE 4:
	    {
		nInputWindow=button.input.channel;
	    }
	    CASE 5:
	    case 6:
	    case 7:
	    case 8:
	    {
		
		nOutputWindow=button.input.channel-4;
		if(nMode_Status==1)
		{
		  SEND_STRING dvWP_1,"'CI',itoa(nInputWindow),'O',itoa(nOutputWindow),$0D,$0A";  
		}
		else
		{
		    
		    SEND_STRING dvWP_1,"'set win select:',itoa(nOutputWindow),',',itoa(nInputWindow),$0D,$0A";
		}
		//WRITE THE TEX
		//SEND_COMMAND dvTP_LayOut,"'^TXT-1,0,' ,'INPUT ',ITOA(nInputWindow)"
	        //SEND_COMMAND dvTP_LayOut,"'^TXT-2,0,' ,'Output ',ITOA(nOutputWindow)"
		//set win select:1,2
		//set switch CI1O1
	    }
	}
    }
}



//set win select:1,2 //set video input 2 to be used for window 1
