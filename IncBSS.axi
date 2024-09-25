PROGRAM_NAME='IncBSS'

INCLUDE 'Harman Pro Commands'
INCLUDE 'MainLine TimeLine'

DEFINE_CONSTANT

  //#WARN 'Verify BSS Audio Device Node Id and IP Address'
  DEVICE_NODE_ID                              = '0x1'          // Node ID/Device ID from Audio Architect
  DEVICE_IP_ADDR                              = '192.168.0.16' // IP Address of device

DEFINE_DEVICE

  vdvGateWayModule                      =	41001:1:0

  dvTPDeviceStatus                      =	10001:2:0
  vdvHProDevice                         =	41010:1:0

  vdvGainChannel_1                      =	41010:1:0
  vdvGainChannel_2                      =	41010:2:0
  vdvGainChannel_3                      =	41010:3:0
  vdvGainChannel_4                      =	41010:4:0
  vdvGainChannel_5                      =	41010:5:0
  vdvGainChannel_6                      =	41010:6:0
  vdvGainChannel_7                      =	41010:7:0
  vdvGainChannel_8                      =	41010:8:0
  vdvGainChannel_9                      =	41010:9:0
  vdvGainChannel_10                     =	41010:10:0
  vdvGainChannel_11                     =	41010:11:0
  vdvGainChannel_12                     =	41010:12:0

  dvTP                                  =	10001:1:0

  dvTPGainChannel_1                     =	10001:1:0
  dvTPGainChannel_2                     =	10001:2:0
  dvTPGainChannel_3                     =	10001:3:0
  dvTPGainChannel_4                     =	10001:4:0
  dvTPGainChannel_5                     =	10001:5:0
  dvTPGainChannel_6                     =	10001:6:0
  dvTPGainChannel_7                     =	10001:7:0
  dvTPGainChannel_8                     =	10001:8:0
  dvTPGainChannel_9                     =	10001:9:0
  dvTPGainChannel_10                    =	10001:10:0
  dvTPGainChannel_11                    =	10001:11:0
  dvTPGainChannel_12                    =	10001:12:0
  
  //voip
  vdvVoIPDialer1                                = 41010:13:0//6
  vdvVoIPDialer2                                = 41010:14:0

  vdvPOTSDialer                                 = 41010:15:0

  //dvTP                                          = 10001:1:0
  //dvTPDeviceStatus                              = 10001:2:0
  dvTPVoIPDialer1                               = 10001:13:0
  dvTPVoIPDialer2                               = 10001:14:0
  dvTPPOTSDialer                                = 10001:15:0

DEFINE_CONSTANT

  INTEGER GAIN_LEVEL                    =	1
  INTEGER CH_POLARITY                   =	260
  FLOAT BUMP_UP_PRECENT                 =	5.0
  FLOAT BUMP_DOWN_PRECENT               =	-5.0

  CHAR sGainParmID[6]                   =	'0x00'
  CHAR sMuteParmID[6]                   =	'0x1'
  CHAR sPolarityParmID[6]               =	'0x2'

  CHAR      sObjectID[][8]              =
  {
    '0.1.3','0.1.24','0.1.25','0.1.26',
    '0.1.A','0.1.B','0.1.C','0.1.D',
    '0.1.E','0.1.F','0.1.10','0.1.11'
  }

  CHAR sRowLabels[][30]                 =
  {
    'FOH SPK','Ceiling SPK','Audio to Far End','Audio From Far End',
    'P12','P13','P14','P15',
    'P16','P17','P18','P19'
  }
//voip
  TELEPHONE_OBJECT_ID                           = '0.0.3'

  BTN_BAR_VoIP_LINE_1                           = 3180
  BTN_BAR_VoIP_LINE_2                           = 3181
  BTN_BAR_POTS                                  = 0

  VoIP_LINE_1                                   = 1
  VoIP_LINE_2                                   = 2
  POTS_LINE_1                                   = 1

  SPEEDDIAL_MAX                                 = 16

  CHAR popUpPagesPots[][50]                     =
  {
    {'Dialer Popup'},
    {'Pots Line 1'},
    {'Pots Line 1 SpeedDial'}
  }

  CHAR popUpPagesVoIp[][50]                     =
  {
    {'Dialer Popup'},
    {'VoIP Line 1'},
    {'VoIP Line 1 Bar'},
    {'VoIP Line 1 SpeedDial'}
  }

  DEV TPVoIPDialer1[1]                          = {dvTPVoIPDialer1}
  DEV TPVoIPDialer2[1]                          = {dvTPVoIPDialer2}
  DEV TPPOTSDialer[1]                           = {dvTPPOTSDialer}
  CMD_PROPERTY                                  = 'PROPERTY'

DEFINE_VARIABLE

  _RegisterDeviceStruct _BSSRegister
  _BumpByPercentStruct  _BumpDown[12]
  _BumpByPercentStruct  _BumpUp[12]

  CHAR cCtrlMethod[DUET_MAX_PARAM_LEN]
  INTEGER idx

  INTEGER       nMute[]                 =
  {
    FALSE,FALSE,FALSE,FALSE,
    FALSE,FALSE,FALSE,FALSE,
    FALSE,FALSE,FALSE,FALSE
  }

  INTEGER       nPolarity[]             =
  {
    FALSE,FALSE,FALSE,FALSE,
    FALSE,FALSE,FALSE,FALSE,
    FALSE,FALSE,FALSE,FALSE
  }

  DEV vdvGainDevices[]                  =
  {
    vdvGainChannel_1,vdvGainChannel_2,vdvGainChannel_3,vdvGainChannel_4,
    vdvGainChannel_5,vdvGainChannel_6,vdvGainChannel_7,vdvGainChannel_8,
    vdvGainChannel_9,vdvGainChannel_10,vdvGainChannel_11,vdvGainChannel_12
  }

  DEV dvTPGainDevices[]                 =
  {
    dvTPGainChannel_1,dvTPGainChannel_2,dvTPGainChannel_3,dvTPGainChannel_4,
    dvTPGainChannel_5,dvTPGainChannel_6,dvTPGainChannel_7,dvTPGainChannel_8,
    dvTPGainChannel_9,dvTPGainChannel_10,dvTPGainChannel_11,dvTPGainChannel_12
  }

  DEVCHAN dcDevMute[]                   =
  {
    {vdvGainChannel_1,GAIN_MUTE_FB},{vdvGainChannel_2,GAIN_MUTE_FB},{vdvGainChannel_3,GAIN_MUTE_FB},
    {vdvGainChannel_4,GAIN_MUTE_FB},{vdvGainChannel_5,GAIN_MUTE_FB},{vdvGainChannel_6,GAIN_MUTE_FB},
    {vdvGainChannel_7,GAIN_MUTE_FB},{vdvGainChannel_8,GAIN_MUTE_FB},{vdvGainChannel_9,GAIN_MUTE_FB},
    {vdvGainChannel_10,GAIN_MUTE_FB},{vdvGainChannel_11,GAIN_MUTE_FB},{vdvGainChannel_12,GAIN_MUTE_FB}
  }

  DEVCHAN dcDevPolarity[]               =
  {
    {vdvGainChannel_1,CH_POLARITY},{vdvGainChannel_2,CH_POLARITY},{vdvGainChannel_3,CH_POLARITY},
    {vdvGainChannel_4,CH_POLARITY},{vdvGainChannel_5,CH_POLARITY},{vdvGainChannel_6,CH_POLARITY},
    {vdvGainChannel_7,CH_POLARITY},{vdvGainChannel_8,CH_POLARITY},{vdvGainChannel_9,CH_POLARITY},
    {vdvGainChannel_10,CH_POLARITY},{vdvGainChannel_11,CH_POLARITY},{vdvGainChannel_12,CH_POLARITY}
  }

  DEVCHAN dcTPDn[]                      =
  {
    {dvTPGainChannel_1,VOL_DN},{dvTPGainChannel_2,VOL_DN},{dvTPGainChannel_3,VOL_DN},{dvTPGainChannel_4,VOL_DN},
    {dvTPGainChannel_5,VOL_DN},{dvTPGainChannel_6,VOL_DN},{dvTPGainChannel_7,VOL_DN},{dvTPGainChannel_8,VOL_DN},
    {dvTPGainChannel_9,VOL_DN},{dvTPGainChannel_10,VOL_DN},{dvTPGainChannel_11,VOL_DN},{dvTPGainChannel_12,VOL_DN}
  }

  DEVCHAN dcTPMute[]                    =
  {
    {dvTPGainChannel_1,GAIN_MUTE_FB},{dvTPGainChannel_2,GAIN_MUTE_FB},{dvTPGainChannel_3,GAIN_MUTE_FB},
    {dvTPGainChannel_4,GAIN_MUTE_FB},{dvTPGainChannel_5,GAIN_MUTE_FB},{dvTPGainChannel_6,GAIN_MUTE_FB},
    {dvTPGainChannel_7,GAIN_MUTE_FB},{dvTPGainChannel_8,GAIN_MUTE_FB},{dvTPGainChannel_9,GAIN_MUTE_FB},
    {dvTPGainChannel_10,GAIN_MUTE_FB},{dvTPGainChannel_11,GAIN_MUTE_FB},{dvTPGainChannel_12,GAIN_MUTE_FB}
  }

  DEVCHAN dcTPPolarity[]                =
  {
    {dvTPGainChannel_1,CH_POLARITY},{dvTPGainChannel_2,CH_POLARITY},{dvTPGainChannel_3,CH_POLARITY},
    {dvTPGainChannel_4,CH_POLARITY},{dvTPGainChannel_5,CH_POLARITY},{dvTPGainChannel_6,CH_POLARITY},
    {dvTPGainChannel_7,CH_POLARITY},{dvTPGainChannel_8,CH_POLARITY},{dvTPGainChannel_9,CH_POLARITY},
    {dvTPGainChannel_10,CH_POLARITY},{dvTPGainChannel_11,CH_POLARITY},{dvTPGainChannel_12,CH_POLARITY}
  }

  DEVCHAN dcTPUp[]                      =
  {
    {dvTPGainChannel_1,VOL_UP},{dvTPGainChannel_2,VOL_UP},{dvTPGainChannel_3,VOL_UP},
    {dvTPGainChannel_4,VOL_UP},{dvTPGainChannel_5,VOL_UP},{dvTPGainChannel_6,VOL_UP},
    {dvTPGainChannel_7,VOL_UP},{dvTPGainChannel_8,VOL_UP},{dvTPGainChannel_9,VOL_UP},
    {dvTPGainChannel_10,VOL_UP},{dvTPGainChannel_11,VOL_UP},{dvTPGainChannel_12,VOL_UP}
  }

  DEVLEV dcDevLevel[]                   =
  {
    {vdvGainChannel_1,GAIN_LEVEL},{vdvGainChannel_2,GAIN_LEVEL},{vdvGainChannel_3,GAIN_LEVEL},
    {vdvGainChannel_4,GAIN_LEVEL},{vdvGainChannel_5,GAIN_LEVEL},{vdvGainChannel_6,GAIN_LEVEL},
    {vdvGainChannel_7,GAIN_LEVEL},{vdvGainChannel_8,GAIN_LEVEL},{vdvGainChannel_9,GAIN_LEVEL},
    {vdvGainChannel_10,GAIN_LEVEL},{vdvGainChannel_11,GAIN_LEVEL},{vdvGainChannel_12,GAIN_LEVEL}
  }

  DEVLEV dcTPLevel[]                    =
  {
    {dvTPGainChannel_1,GAIN_LEVEL},{dvTPGainChannel_2,GAIN_LEVEL},{dvTPGainChannel_3,GAIN_LEVEL},
    {dvTPGainChannel_4,GAIN_LEVEL},{dvTPGainChannel_5,GAIN_LEVEL},{dvTPGainChannel_6,GAIN_LEVEL},
    {dvTPGainChannel_7,GAIN_LEVEL},{dvTPGainChannel_8,GAIN_LEVEL},{dvTPGainChannel_9,GAIN_LEVEL},
    {dvTPGainChannel_10,GAIN_LEVEL},{dvTPGainChannel_11,GAIN_LEVEL},{dvTPGainChannel_12,GAIN_LEVEL}
  }
  //Start voip
  DEVCHAN dcBTN_BAR_VoIP_LINE_1                 = {dvTP,BTN_BAR_VoIP_LINE_1}
  DEVCHAN dcBTN_BAR_VoIP_LINE_2                 = {dvTP,BTN_BAR_VoIP_LINE_2}
  DEVCHAN dcBTN_BAR_POTS                        = {dvTP,BTN_BAR_POTS}

  //_RegisterDeviceStruct _BSSRegister

  //CHAR cCtrlMethod[DUET_MAX_PARAM_LEN]

  _AddTelephoneStruct _Dialer[2]
//voip end
  #INCLUDE 'ModuleComponent'

DEFINE_START

  _BSSRegister.sNodeID                  =	DEVICE_NODE_ID		// NodeID from Audio Architect
  _BSSRegister.vdvDevice                =	vdvHProDevice     // Virtual device to use for this device
  _BSSRegister.sIPAddrHostname          =	DEVICE_IP_ADDR		// Devices IP address

  FOR(idx = 1; idx <= LENGTH_ARRAY(sObjectID);idx++)
  {
    _BumpDown[idx].fBumpBy              =	BUMP_DOWN_PRECENT
    _BumpDown[idx].sParameterID         =	sGainParmID
    _BumpDown[idx].sObjectID            =	sObjectID[idx]

    _BumpUp[idx].fBumpBy                =	BUMP_UP_PRECENT
    _BumpUp[idx].sParameterID           =	sGainParmID
    _BumpUp[idx].sObjectID              =	sObjectID[idx]
  }
//start voip
  #IF_DEFINED __ISVoIP__
  _Dialer[VoIP_LINE_1].sObjectID              = TELEPHONE_OBJECT_ID
  _Dialer[VoIP_LINE_1].nFBControlPort         = vdvVoIPDialer1.PORT
  _Dialer[VoIP_LINE_1].nTelephoneLine         = VoIP_LINE_1
  _Dialer[VoIP_LINE_1].nSpeedDialMax          = SPEEDDIAL_MAX

  _Dialer[VoIP_LINE_2].sObjectID              = TELEPHONE_OBJECT_ID
  _Dialer[VoIP_LINE_2].nFBControlPort         = vdvVoIPDialer2.PORT
  _Dialer[VoIP_LINE_2].nTelephoneLine         = VoIP_LINE_2
  _Dialer[VoIP_LINE_2].nSpeedDialMax          = SPEEDDIAL_MAX
  #ELSE
  _Dialer[POTS_LINE_1].sObjectID              = TELEPHONE_OBJECT_ID
  _Dialer[POTS_LINE_1].nFBControlPort         = vdvPOTSDialer.PORT
  _Dialer[POTS_LINE_1].nTelephoneLine         = POTS_LINE_1
  _Dialer[POTS_LINE_1].nSpeedDialMax          = SPEEDDIAL_MAX
  #END_IF
//end voip
  /*|--------------------------------------------------------------------------------------------------|
		|                                      Define Gateway module                                       |
		|                                                                                                  |
		| for example: DEFINE_MODULE 'HPro_BSS_Gateway_Comm_dr1_0_0'   hppro_comm(vdvGateWayModule)        |
		|                                                                                                  |
		| When the specified virtual device (vdvGateWayModule) reports Data Initialized (Channel 252 ON)   |
		|     which indicates the HPro ConfigFile loaded successfully then you can register devices you're |
		|     wanting to control using:                                                                    |
		|                                                                                                  |
		|    fnRegisterIPDevice,                                                                           |
		|    fnRegisterIPDeviceEx,                                                                         |
		|    fnRegisterRS232Device,                                                                        |
		|    fnRegisterRS232DeviceEx or                                                                    |
		|    fnRegisterRS232DeviceBaudRateEx                                                               |
		|                                                                                                  |
		|--------------------------------------------------------------------------------------------------|*/
  DEFINE_MODULE 'HPro_BSS_Gateway_Comm_dr1_0_0'                  hppro_comm(vdvGateWayModule)
  //start voip
  #IF_DEFINED __ISVoIP__
  DEFINE_MODULE 'HPro DialerComponent'                           dialervoip1(vdvVoIPDialer1, TPVoIPDialer1,dcBTN_BAR_VoIP_LINE_1)
  DEFINE_MODULE 'HPro DialerComponent'                           dialervoip2(vdvVoIPDialer2, TPVoIPDialer2,dcBTN_BAR_VoIP_LINE_2)
  #ELSE
  DEFINE_MODULE 'HPro DialerComponent'                           dialerpots(vdvPOTSDialer, TPPOTSDialer,dcBTN_BAR_POTS)
  #END_IF
  //end voip
DEFINE_EVENT

	BUTTON_EVENT[dcTPDn]
  {
    PUSH:
    {
      fnBumpByPercentage(vdvHProDevice,_BumpDown[GET_LAST(dcTPDn)])
    }

    HOLD[3,REPEAT]:
    {
      fnBumpByPercentage(vdvHProDevice,_BumpDown[GET_LAST(dcTPDn)])
    }
  }

	BUTTON_EVENT[dcTPMute]
  {
    PUSH:
    {
      IF(nMute[GET_LAST(dcTPMute)])
      {
        OFF[dcDevMute[GET_LAST(dcTPMute)]]
      }
      ELSE
      {
        ON[dcDevMute[GET_LAST(dcTPMute)]]
      }
    }
  }

  /*|-----------------------------------------------------------------------------|
		| Occurs when an user pushes Phantom Power Touch Panel button.  Voices update |
		|     to Devices' listening port/channel.                                     |
		|-----------------------------------------------------------------------------|*/
	BUTTON_EVENT[dcTPPolarity]
  {
    PUSH:
    {
      IF(nPolarity[GET_LAST(dcTPPolarity)])
      {
        OFF[dcDevPolarity[GET_LAST(dcTPPolarity)]]
      }
      ELSE
      {
        ON[dcDevPolarity[GET_LAST(dcTPPolarity)]]
      }
    }
  }

  /*|-----------------------------------------------------------------------------|
		| Occurs when GateWay module is Data Initialized (Channel 252 ON).            |
		|                                                                             |
		| Use this event to register Device(s)                                        |
		|-----------------------------------------------------------------------------|*/
	BUTTON_EVENT[dcTPUp]
  {
    PUSH:
    {
      fnBumpByPercentage(vdvHProDevice,_BumpUp[GET_LAST(dcTPUp)])
    }

    HOLD[3,REPEAT]:
    {
      fnBumpByPercentage(vdvHProDevice,_BumpUp[GET_LAST(dcTPUp)])
    }
  }

  /*|-----------------------------------------------------------------------------|
		| Occurs when an user pushes Mute Touch Panel button.  Voices update to       |
		|     Devices' listening port/channel.                                        |
		|-----------------------------------------------------------------------------|*/
	CHANNEL_EVENT[vdvGateWayModule, DATA_INITIALIZED]
  {
    ON:
    {
      cCtrlMethod                       =	"'(',_BSSRegister.sIPAddrHostname,')'"
      fnRegisterIPDevice(vdvGateWayModule,_BSSRegister)
    }
  }

  /*|------------------------------------------------------------------------------|
		|  When registered device comes Online (Channel 251 ON), Subscribe to device   |
		|       objects                                                                |
		|------------------------------------------------------------------------------|*/
	CHANNEL_EVENT[vdvHProDevice, DEVICE_COMMUNICATING]
  {
    ON:
    {

      FOR(idx = 1; idx <= LENGTH_ARRAY(sObjectID); idx++)
      {
        fnSubscribeLevelPercentEx(vdvHProDevice,
        sObjectID[idx],
        'GAN',
        sGainParmID,
        dcDevLevel[idx].DEVICE.PORT,
        dcDevLevel[idx].LEVEL)

        fnSubscribeChannelEx(vdvHProDevice,
        sObjectID[idx],
        'GAN',
        sMuteParmID,
        idx,
        GAIN_MUTE_FB)

        fnSubscribeChannelEx(vdvHProDevice,
        sObjectID[idx],
        'GAN',
        sPolarityParmID,
        idx,
        CH_POLARITY)
      }

      FOR(idx = 1; idx <= LENGTH_ARRAY(sRowLabels); idx++)
      {
        fnTPSetButtonTextAllStates(dvTPGainDevices[idx],'260',sRowLabels[idx])
      }
    }
  }
  //start voip
  	CHANNEL_EVENT[vdvGateWayModule, DEVICE_COMMUNICATING]
  {
    ON:
    {

      IF(LENGTH_ARRAY(_BSSRegister.sIPAddrHostname) > 0)
      {
        cCtrlMethod                       ="'(',_BSSRegister.sIPAddrHostname,')'"
        fnRegisterIPDevice(vdvGateWayModule,_BSSRegister)
      }
      ELSE
      {
        cCtrlMethod                       ="'(',dpstoa(_BSSRegister.dvRS232Device),')'"
        fnRegisterRS232Device(vdvGateWayModule,_BSSRegister)
      }
    }
  }

/*|-----------------------------------------------------------------------------|
	| When registered device comes Online (Channel 251 ON), Add telephone line(s) |
	|-----------------------------------------------------------------------------|*/
	CHANNEL_EVENT[vdvHProDevice, DEVICE_COMMUNICATING]
  {
    ON:
    {
      #IF_DEFINED __ISVoIP__
      fnAddVoip(vdvHProDevice,_Dialer[1])
      fnAddVoip(vdvHProDevice,_Dialer[2])
      #ELSE
      fnAddPots(vdvHProDevice,_Dialer[1])
      #END_IF

      fnTPSetButtonTextAllStates(dvTP,CH_TP_REGISTERED_TEXT,"'Registered Device ',ITOA(vdvHProDevice.NUMBER),' - ',DEVICE_NODE_ID,' (',ITOA(HEXTOI(DEVICE_NODE_ID)),') ', cCtrlMethod")
    }

    OFF:
    {
      fnTPSetButtonTextAllStates(dvTP,CH_TP_REGISTERED_TEXT,"'No Device Registered'")
    }
  }
//end voip
	CHANNEL_EVENT[dcDevMute]
  {
    ON:
    {
      nMute[GET_LAST(dcDevMute)]        =	TRUE
    }

    OFF:
    {
      nMute[GET_LAST(dcDevMute)]        =	FALSE
    }
  }

	CHANNEL_EVENT[dcDevPolarity]
  {
    ON:
    {
      nPolarity[GET_LAST(dcDevPolarity)] = TRUE
    }

    OFF:
    {
      nPolarity[GET_LAST(dcDevPolarity)] = FALSE
    }
  }

	DATA_EVENT[vdvGateWayModule]
  {
    COMMAND:
    {
      STACK_VAR CHAR    cCmd[DUET_MAX_CMD_LEN]

      cCmd                              =	DATA.TEXT

      SWITCH (DuetParseCmdHeader(cCmd))
      {
        CASE 'REPORT.SUBSCRIPTIONS':
        {
          fnIOPrintln(cCmd)
        }
      }
    }
  }

	DATA_EVENT[dvTP]
  {
    ONLINE:
    {
      SEND_COMMAND vdvHProDevice,"'REFRESH'"
    }
  }

	LEVEL_EVENT[dcDevLevel]
  {
    SEND_LEVEL dcTPLevel[GET_LAST(dcDevLevel)], LEVEL.VALUE
  }

  /*|-----------------------------------------------------------------------------|
		| Due to differences in the underlying architecture of the X-Series masters,  |
		|     changing variables in the DEFINE_PROGRAM section of code can negatively |
		|     impact program performance.                                             |
		|                                                     												|
		| TimeLine implementation refer to Differences in DEFINE_PROGRAM Program     	|
		|     Execution section of the NX-Series Controllers WebConsole &            	|
		|     Programming Guide for additional and alternate coding methodologies.    |
		|-----------------------------------------------------------------------------|*/
	TIMELINE_EVENT[DEFINE_PROGRAM_TIMELINE_ID]
  {
    STACK_VAR INTEGER i

    FOR(i = 1; i <= LENGTH_ARRAY(sObjectID); i++)
    {
      [dcTPMute[i]]                     =	nMute[i]
      [dcTPPolarity[i]]                 =	nPolarity[i]
    }

    [dvTPDeviceStatus,DEVICE_COMMUNICATING]     = [vdvHProDevice,DEVICE_COMMUNICATING]
    [dvTPDeviceStatus,DATA_INITIALIZED]         = [vdvHProDevice,DATA_INITIALIZED]
  }
  
  //start voip
  	DATA_EVENT[dvTP]
  {
    ONLINE:
    {
      STACK_VAR INTEGER idx
      SEND_COMMAND dvTP,"'^PPX'"

      #IF_DEFINED __ISVoIP__

      FOR(idx = 1; idx <= MAX_LENGTH_ARRAY(popUpPagesVoIp); idx++)
      {
        SEND_COMMAND dvTP,"'@PPN-',popUpPagesVoIp[idx]"
      }

      #ELSE

      FOR(idx = 1; idx <= MAX_LENGTH_ARRAY(popUpPagesPots); idx++)
      {
        SEND_COMMAND dvTP,"'@PPN-',popUpPagesPots[idx]"
      }
      #END_IF

      SEND_COMMAND vdvHProDevice,"'REFRESH'"
    }
  }

  (*****************************************************************)
  (*                       END OF PROGRAM                          *)
  (*                                                               *)
  (*         !!!  DO NOT PUT ANY CODE BELOW THIS COMMENT  !!!      *)
  (*                                                               *)
  (*****************************************************************)
