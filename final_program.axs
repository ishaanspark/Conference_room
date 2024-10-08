PROGRAM_NAME='final_program'
(***********************************************************)
(***********************************************************)
(*  FILE_LAST_MODIFIED_ON: 04/05/2006  AT: 09:00:25        *)
(***********************************************************)
(* System Type : NetLinx                                   *)
(***********************************************************)
(* REV HISTORY:                                            *)
(***********************************************************)
(*
    $History: $
*)
(***********************************************************)
(*          DEVICE NUMBER DEFINITIONS GO BELOW             *)
(***********************************************************)
DEFINE_DEVICE
//Touch panel
dvTP 		= 10001:1:0;
dvTP_WP_1	= 10001:2:0;
dvTPVolume	= 10001:3:1;
//Controller
dvNX2200	= 0:1:0;

//Switcher
dvWP_1		= 0:3:0;

(***********************************************************)
(*               CONSTANT DEFINITIONS GO BELOW             *)
(***********************************************************)
DEFINE_CONSTANT

(***********************************************************)
(*              DATA TYPE DEFINITIONS GO BELOW             *)
(***********************************************************)
DEFINE_TYPE

(***********************************************************)
(*               VARIABLE DEFINITIONS GO BELOW             *)
(***********************************************************)
DEFINE_VARIABLE
integer nInput ;
integer nOutput = 1;
integer npress ;
integer nVolumeLevel = 50;  
integer VOLUME_INCREMENT = 5;
integer nButtonPress = 0;
(***********************************************************)
(*               LATCHING DEFINITIONS GO BELOW             *)
(***********************************************************)
DEFINE_LATCHING

(***********************************************************)
(*       MUTUALLY EXCLUSIVE DEFINITIONS GO BELOW           *)
(***********************************************************)
DEFINE_MUTUALLY_EXCLUSIVE
([dvTP_WP_1,1]..[dvTP_WP_1,4])


([dvTPVolume,15]..[dvTPVolume,18])
(***********************************************************)
(*        SUBROUTINE/FUNCTION DEFINITIONS GO BELOW         *)
(***********************************************************)
(* EXAMPLE: DEFINE_FUNCTION <RETURN_TYPE> <NAME> (<PARAMETERS>) *)
(* EXAMPLE: DEFINE_CALL '<NAME>' (<PARAMETERS>) *)

(***********************************************************)
(*                STARTUP CODE GOES BELOW                  *)
(***********************************************************)
DEFINE_START

(***********************************************************)
(*                THE EVENTS GO BELOW                      *)
(***********************************************************)
DEFINE_EVENT
data_event[dvWP_1]
{
    online:
    {
	wait 300
	ip_client_open(dvWP_1.port,'192.168.0.18',23,IP_TCP)
    }
    offline:
    {
	wait 5
	ip_client_open(dvWP_1.port,'192.168.0.18',23,IP_TCP)
    }
    onerror:
    {
	switch(data.number)
	{
	    case 7:
	    case 9:
	    case 17:
	    {
		ip_client_open(dvWP_1.port,'192.168.0.18',23,IP_TCP)
	    }
	
	}
    
    }


}
button_event[dvTP_WP_1,0]
{
    PUSH:
    {	
    on[button.input]
    {
	switch(button.input.channel)
	{
	    CASE 1:
	    CASE 2:
	    CASE 3:
	    CASE 4:
	    {
		nInput	= button.input.channel;
		// set switch CI1OALL
		SEND_STRING dvWP_1,"'set switch CI',itoa(nInput),'O',itoa(nOutput),$0D,$0A"; 
		
	    }
	}
    }	
    }
}
button_event[dvTPVolume, 0] 
{
// SEND_COMMAND <DEV>, "'AUDOUT_VOLUME-<VALUE>'"
    push:
    {
    ON[button.input]
	{
	switch(button.input.channel)
	{
	
	    //vol +
	    case 24:
	    if (nVolumeLevel < 100 ) 
	    {
		nVolumeLevel = nVolumeLevel + VOLUME_INCREMENT;
		//SEND_COMMAND dvAudio_GP1,"'AUDOUT_VOLUME-',itoa(nVolumeLevel)";
		send_level dvTPVolume,1,nVolumeLevel;
	    }
	    //vol -
	    case 25:
	    if (nVolumeLevel > 0)
	    {
		nVolumeLevel = nVolumeLevel - VOLUME_INCREMENT;
		//SEND_COMMAND dvAudio_GP1,"'AUDOUT_VOLUME-',itoa(nVolumeLevel)";
		send_level dvTPVolume,1,nVolumeLevel;
	    }
	    case 26:
	    
		nButtonPress = nButtonPress + 1;
		nVolumeLevel = 0;
		//SEND_COMMAND dvAudio,"'AUDOUT_VOLUME-0'";
		send_level dvTPVolume,1,nVolumeLevel; 
	    //  SEND_COMMAND dvAudio,"'AUDOUT_VOLUME-0'";
	 
	    
	}
		
	}
    }
}
push:
    {
    OFF[button.input]
	{
	switch(button.input.channel)
	{
	
	    //vol +
	    case 24:
	    if (nVolumeLevel < 100 ) 
	    {
		nVolumeLevel = nVolumeLevel + VOLUME_INCREMENT;
		//SEND_COMMAND dvAudio_GP1,"'AUDOUT_VOLUME-',itoa(nVolumeLevel)";
		send_level dvTPVolume,1,nVolumeLevel;
	    }
	    //vol -
	    case 25:
	    if (nVolumeLevel > 0)
	    {
		nVolumeLevel = nVolumeLevel - VOLUME_INCREMENT;
		//SEND_COMMAND dvAudio_GP1,"'AUDOUT_VOLUME-',itoa(nVolumeLevel)";
		send_level dvTPVolume,1,nVolumeLevel;
	    }
	    case 26:
	    
		nButtonPress = nButtonPress + 1;
		nVolumeLevel = 0;
		//SEND_COMMAND dvAudio,"'AUDOUT_VOLUME-0'";
		send_level dvTPVolume,1,nVolumeLevel; 
	    //  SEND_COMMAND dvAudio,"'AUDOUT_VOLUME-0'";
	 
	    
	}
		
	}
    }
}


(*****************************************************************)
(*                                                               *)
(*                      !!!! WARNING !!!!                        *)
(*                                                               *)
(* Due to differences in the underlying architecture of the      *)
(* X-Series masters, changing variables in the DEFINE_PROGRAM    *)
(* section of code can negatively impact program performance.    *)
(*                                                               *)
(* See ?Differences in DEFINE_PROGRAM Program Execution? section *)
(* of the NX-Series Controllers WebConsole & Programming Guide   *)
(* for additional and alternate coding methodologies.            *)
(*****************************************************************)

DEFINE_PROGRAM

(*****************************************************************)
(*                       END OF PROGRAM                          *)
(*                                                               *)
(*         !!!  DO NOT PUT ANY CODE BELOW THIS COMMENT  !!!      *)
(*                                                               *)
(*****************************************************************)

