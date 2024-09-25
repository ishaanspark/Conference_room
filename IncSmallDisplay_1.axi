PROGRAM_NAME='IncSmallDisplay_1'

DEFINE_MUTUALLY_EXCLUSIVE
([dvTP_Display,27],[dvTP_Display,28])

DEFINE_VARIABLE
char cSmallDisplayAddress[15] = '192.168.1.20' // IP Address of the ZonePro
LONG lSmallDisplayServerPort = 1515 // port of the Box
DEFINE_START
WAIT 350
IP_CLIENT_OPEN (dvDisplay.port,cSmallDisplayAddress,lSmallDisplayServerPort,IP_TCP)

DEFINE_EVENT
data_event [dvDisplay]
{

    online:
    {
	wait 400
	IP_CLIENT_OPEN (dvDisplay.port,cSmallDisplayAddress,lSmallDisplayServerPort,IP_TCP)
    }
    // Offline handler runs when connection is dropped/closed.
    OFFLINE:
    {
	    WAIT 300
	    IP_CLIENT_OPEN (dvDisplay.port,cSmallDisplayAddress,lSmallDisplayServerPort,IP_TCP)
    }

   
    ONERROR:
    {
	//  Onerror runs when attempt to connect fails.
	send_string 0,"'Error No:',data.number"
	SWITCH (DATA.NUMBER)
	{
	    // No need to reopen socket in response to following two errors. 
	    CASE 9: // Socket closed in response to IP_CLIENT_CLOSE. 
	    CASE 17: // String was sent to a closed socket. 
	    {
	    }
	    DEFAULT: // All other errors. May want to retry connection. 
	    {
		   WAIT 20
		   IP_CLIENT_OPEN (dvDisplay.port,cSmallDisplayAddress,lSmallDisplayServerPort,1)
	    }
	}
    }
}
button_event[dvTP_Display,0]
{
    push:
    {
	switch(button.input.channel)
	{
	    case 27:
	    {// for ID  03 - AA 11 03 01 01 16
		send_string dvDisplay,"$AA,$11,$FE,$01,$01,$11"//power on AA 11 FE 01 01 11
		wait 5
		send_string dvDisplay,"$AA,$11,$FE,$01,$01,$11,$0D"//power on AA 11 FE 01 01 11
		wait 10
		send_string dvDisplay,"$AA,$11,$FE,$01,$01,$11,$0D,$0A"//power on AA 11 FE 01 01 11
		on[dvTP_Display,button.input.channel]
	    }
	    case 28://AA 11 03 01 00 15
	    {
		send_string dvDisplay,"$AA,$11,$FE,$01,$00,$10"//power off
		wait 5
		send_string dvDisplay,"$AA,$11,$FE,$01,$00,$10,$0D"//power off
		wait 10
		send_string dvDisplay,"$AA,$11,$FE,$01,$00,$10,$0D,$0A"//power off
		on[dvTP_Display,button.input.channel]
	    }
	    case 31:
	    {
		IP_CLIENT_OPEN (dvDisplay.port,cSmallDisplayAddress,lSmallDisplayServerPort,1)
	    }
	    case 32:
	    {
		IP_CLIENT_CLOSE (dvDisplay.port)
	    }

	
	}
    }
}