PROGRAM_NAME='ModuleComponent'
(***********************************************************)
(*  FILE_LAST_MODIFIED_ON: 03/08/2018  AT: 09:45:38        *)
(***********************************************************)

#IF_NOT_DEFINED __MODULECOMPONENT__
#DEFINE __MODULECOMPONENT__

#INCLUDE 'Helper Libraries'

DEFINE_CONSTANT

	CH_TP_REGISTERED_TEXT                   = '259'

  CH_DEBUG_LEVEL                          = 3605
	BTN_REFRESH															= 3606
	BTN_REINIT															= 3607

  INTEGER BTN_DEBUG[]                     =
  {
    3601, 3602, 3603, 3604
  }

DEFINE_VARIABLE

	CHAR cRegisteredText[DUET_MAX_PARAM_LEN]	= 'No Device Registered'

DEFINE_MUTUALLY_EXCLUSIVE
  ([dvTP,BTN_DEBUG[1]]..[dvTP,BTN_DEBUG[4]])


DEFINE_EVENT

	DATA_EVENT [dvTP]
  {
    ONLINE:
    {
      SEND_COMMAND vdvGateWayModule, '?DEBUG'
			fnTPSetButtonTextAllStates(dvTP,CH_TP_REGISTERED_TEXT,cRegisteredText)

      SEND_COMMAND vdvHProDevice,"'REFRESH'"
    }
  }

 	DATA_EVENT[vdvGateWayModule]
  {
    ONLINE:
    {
      SEND_COMMAND vdvGateWayModule, '?DEBUG'
    }

    COMMAND:
    {
      // local variables
      STACK_VAR CHAR    cCmd[DUET_MAX_CMD_LEN]
      STACK_VAR CHAR    cHeader[DUET_MAX_HDR_LEN]
      STACK_VAR CHAR    cParameter[DUET_MAX_PARAM_LEN]
      STACK_VAR INTEGER nParameter
      STACK_VAR CHAR    cTrash[20]
      STACK_VAR INTEGER nZone

      cCmd                              =	DATA.TEXT

      cHeader                           =	UPPER_STRING(DuetParseCmdHeader(cCmd))

      IF(fnStringStartsWith(cHeader,'DEBUG'))
      {
        nParameter                      =	ATOI(DuetParseCmdParam(cCmd))

        IF(nParameter >=1 && nParameter<=4)
        {
          ON[dvTP,BTN_DEBUG[nParameter]]
          ON[dvTP,CH_DEBUG_LEVEL]
          fnTPSetButtonText(dvTP,ITOA(CH_DEBUG_LEVEL),BTN_STATE_ON,"'Debug Level: ',fnDebugLevelString(nParameter)")
        }
        ELSE
        {
          OFF[dvTP,CH_DEBUG_LEVEL]
          fnTPSetButtonText(dvTP,ITOA(CH_DEBUG_LEVEL),BTN_STATE_ON,'Debug Level: ?')
        }
      }
    }
  }

	BUTTON_EVENT[dvTP, BTN_DEBUG]
  {
    PUSH:
    {
      SEND_COMMAND vdvGateWayModule, "'DEBUG-',ITOA(GET_LAST(BTN_DEBUG))"
    }
  }

	BUTTON_EVENT[dvTP, BTN_REFRESH]
  {
    PUSH:
    {
      SEND_COMMAND vdvGateWayModule, "'REFRESH'"
    }
  }

	BUTTON_EVENT[dvTP, BTN_REFRESH]
  {
    PUSH:
    {
      SEND_COMMAND vdvGateWayModule, "'REINIT'"
    }
  }

/*|------------------------------------------------------------------------------|
	|  When registered module is Data Initialized (Channel 252 ON), Register       |
	|       device(s)                                                              |
	|------------------------------------------------------------------------------|*/
CHANNEL_EVENT[vdvGateWayModule, DEVICE_COMMUNICATING]
{
  ON:
  {
     // 2/5/18 Removed RegisterDevice() calls - should be done in Main code at Initialization (chan 252)
  }
}

/*|-----------------------------------------------------------------------------|
	| When registered device comes Online (Channel 251 ON), Add telephone line(s) |
	|-----------------------------------------------------------------------------|*/
	CHANNEL_EVENT[vdvHProDevice, DEVICE_COMMUNICATING]
	{
		ON:
		{
			cRegisteredText = "'Registered Device ',ITOA(vdvHProDevice.NUMBER),' - ',DEVICE_NODE_ID,' (',ITOA(HEXTOI(DEVICE_NODE_ID)),') ', cCtrlMethod"
			fnTPSetButtonTextAllStates(dvTP,CH_TP_REGISTERED_TEXT,cRegisteredText)
		}

		OFF:
		{
			cRegisteredText = "'No Device Registered'"
			fnTPSetButtonTextAllStates(dvTP,CH_TP_REGISTERED_TEXT,cRegisteredText)
		}
	}

/*|-----------------------------------------------------------------------------|
  | Due to differences in the underlying architecture of the X-Series masters,  |
	|     changing variables in the DEFINE_PROGRAM section of code can negatively |
  |     impact program performance.                                             |
  |                                                                             |
	| TimeLine implementation refer to ?Differences in DEFINE_PROGRAM Program     |
  |     Execution? section of the NX-Series Controllers WebConsole &            |
  |     Programming Guide for additional and alternate coding methodologies.    |
  |-----------------------------------------------------------------------------|*/

	TIMELINE_EVENT[DEFINE_PROGRAM_TIMELINE_ID]
  {
    [dvTPDeviceStatus,DEVICE_COMMUNICATING]         =	[vdvHProDevice,DEVICE_COMMUNICATING]
    [dvTPDeviceStatus,DATA_INITIALIZED]             =	[vdvHProDevice,DATA_INITIALIZED]
  }

  (***********************************************************)
  (*                     END OF PROGRAM                      *)
  (*        DO NOT PUT ANY CODE BELOW THIS COMMENT           *)
  (***********************************************************)

 #END_IF  // __MODULECOMPONENT__