PROGRAM_NAME='Harman Pro Commands'
(***********************************************************)
(*  FILE_LAST_MODIFIED_ON: 03/07/2018  AT: 09:42:36        *)
(***********************************************************)

#IF_NOT_DEFINED __HARMAN_PRO_COMMANDS__
#DEFINE __HARMAN_PRO_COMMANDS__

INCLUDE 'SNAPI'
INCLUDE 'Helper Libraries'

/*|--------------------------------------------------------------------------------------------------|
|                                       Available Functions                                        |
|                                                                                                  |
| fnAddPots: Subscribe to Analog telephone device object                                           |
| fnAddPotsEx: Subscribe to Analog telephone device object                                         |
| fnAddVoip: Subscribe to VoIP telephone device object                                             |
| fnAddVoipEx: Subscribe to VoIP telephone device object                                           |
| fnBumpByPercentage: Send HProComm request to bump device object by +/- percentage                |
| fnBumpByPercentageEx: Send HProComm request to bump device object by +/- percentage              |

| fnPassthruCOMMAND: Subscribe to object parameter with feedback using command                     |
| fnPassthruCommandEx: Subscribe to object parameter with feedback using command                   |
| fnRecallPrameterPreset: Recall a parameter preset; setup in Audio Architect                      |
| fnRegisterIPDevice: Connect to device via IP feedback on requested DPS                           |
| fnRegisterIPDeviceEx: Connect to device via IP feedback on requested DPS                         |
| fnRegisterRS232Device: Connect to device via IP feedback on requested DPS                        |
| fnRegisterRS232DeviceEx: Connect to device via IP feedback on requested DPS                      |
| fnRegisterRS232DeviceBaudRateEx: Connect to device via IP feedback on requested DPS and supply   |
|       the optional baud rate                                                                     |
| fnReportRoomCombine: Reports all items by room subscribed to                                     |

| fnReportRoomCombinePartition: Subscribe to Room Combine partition, feedback using command        |
| fnReportRoomCombineRoom: Reports all items by room subscribed to                                 |
| fnReportSubscriptions: Reports all items by subscribed to                                        |
| fnRoomCombineActiveGroupSubscribeChannel: Subscribe to Room Combine ACTIVE Group, feedback using |
|       channel                                                                                    |
| fnRoomCombineActiveGroupSubscribeChannelEx: Subscribe to Room Combine ACTIVE Group, feedback     |
|       using channel                                                                              |

| fnRoomCombineActiveGroupSubscribeCOMMAND: Subscribe to Room Combine ACTIVE Group, feedback using |
|       command                                                                                    |
| fnRoomCombineActiveGroupSubscribeCommandEx: Subscribe to Room Combine ACTIVE Group, feedback     |
|       using command                                                                              |
| fnRoomCombineAddRoom: Add Room to Room Combine Object                                            |
| fnRoomCombineAddRoomEx: Add Room to Room Combine Object                                          |
| fnRoomCombinePartitionSubscribeChannel: Subscribe to Room Combine partition, feedback using      |
|       channel                                                                                    |
| fnRoomCombinePartitionSubscribeChannelEx: Subscribe to Room Combine partition, feedback using    |
|       channel                                                                                    |

| fnRoomCombinePartitionSubscribeCOMMAND: Subscribe to Room Combine partition, feedback using      |
|       command                                                                                    |
| fnRoomCombinePartitionSubscribeCommandEx: Subscribe to Room Combine partition, feedback using    |
|       command                                                                                    |
| fnRoomCombineRegister: Register a Room Combine Object                                            |
| fnRoomCombineRegister: Register a Room Combine Object                                            |
| fnRoomCombineRoomSubscribeChannel: Subscribe to room combine room object parameter with feedback |
|       on channel                                                                                 |
| fnRoomCombineRoomSubscribeChannelEx: Subscribe to room combine room object parameter with        |
|       feedback on channel                                                                        |

| fnRoomCombineRoomSubscribeCOMMAND: Subscribe to room combine room object parameter with feedback |
|       using command                                                                              |

| fnRoomCombineRoomSubscribeCOMMAND: Subscribe to room combine room object parameter with feedback |
|       using command                                                                              |
| fnRoomCombineRoomSubscribeCommandPercent: Subscribe to room combine room object parameter with   |
|       feedback using command                                                                     |
| fnRoomCombineRoomSubscribeCommandPercentEx: Subscribe to room combine room object parameter with |
|       feedback using command                                                                     |
| fnRoomCombineRoomSubscribeLevel: Subscribe to room combine room for value feedback on level.     |
|       Feedback values will be in the range of 0.00 - 255.00                                      |
| fnRoomCombineRoomSubscribeLevelEx: Subscribe to room combine room for value feedback on level.   |
|       Feedback values will be in the range of 0.00 - 255.00                                      |
| fnRoomCombineRoomSubscribeLevelPrecent: Subscribe to room combine room for percentage feedback   |
|       on level. Feedback values will be in the range of 0.00- 100.00                             |
| fnRoomCombineRoomSubscribeLevelPrecentEx: Subscribe to room combine room for percentage feedback |
|       on level. Feedback values will be in the range of 0.00- 100.00                             |
| fnRoomCombineRoomSubscribeLevelRange: Subscribe to room combine room for value feedback on level |
|       user specified range                                                                       |
| fnRoomCombineRoomSubscribeLevelRangeEx: Subscribe to room combine room for value feedback on     |
|       level user specified range                                                                 |
| fnSpeedDialStore: Store name, number at given index in speed dial list       |
| fnSpeedDialStoreEx: Store name, number at given index in speed dial list                         |
| fnSpeedDialStore: Store name, number at given index in speed dial list                           |
| fnSpeedDialStoreEx: Recall index in speed dial list                                              |
| fnSubscribeChannel: Subscribe to object parameter with feedback on channel                       |
| fnSubscribeChannelEx: Subscribe channel                                                          |

| fnSubscribeCOMMAND: Subscribe to object parameter with feedback using command                    |
| fnSubscribeCommandEx: Subscribe command                                                          |
| fnSubscribeCommandPercent: Subscribe for percentage feedback using command                       |
| fnSubscribeCommandPercentEx: Subscribe for percentage feedback using command                     |
| fnSubscribeLevel: Subscribe for value feedback on level. Feedback range of 0.00 - 255.00         |
| fnSubscribeLevelEx: Subscribe level                                                              |
| fnSubscribeLevelPercent: Subscribe for value feedback on level. Feedback range of 0.00 - 100.00  |
| fnSubscribeLevelPercentEx: Subscribe for value feedback on level. Feedback range of 0.00 -       |
|       100.00                                                                                     |

| fnSubscribeLevelRange: Subscribe for value feedback on level user specified range                |
| fnSubscribeLevelRangeEx: Subscribe level with range                                              |
| fnUnsubscribe: Unsubscribe from object parameter                                                 |
| fnUnsubscribe: Unsubscribe from object parameter                                                 |

| fnUpdateCOMMAND: Update device object subscribed to using command                                |
| fnUpdateCommandEx: Update device object subscribed via command                                   |
|--------------------------------------------------------------------------------------------------|*/

DEFINE_CONSTANT

  LOGFILE_NAME                          =	'HProSendCommandsLog.xml'

  CMD_ADD_POTS                          =	'ADD.POTS'
  CMD_ADD_VOIP                          =	'ADD.VOIP'
  CMD_BUMP_BY_PERCENTAGE                =	'BUMP.BY.PERCENTAGE'
  CMD_DIALER_AUTO_ANSWER_RING_COUNT     =	'DIALER.AUTO.ANSWER.RING.COUNT'
  CMD_DIALER_DIAL_DTMF                  =	'DIALER.DIAL.DTMF'
  CMD_DIALER_DIAL_NUMBER                =	'DIALER.DIAL.NUMBER'
  CMD_DIALER_HOLD                       =	'DIALER.HOLD'
  CMD_DIALER_LAST_NUMBER_DIALED         =	'DIALER.LAST.NUMBER.DIALED'
  CMD_DIALER_PICKUP_HANGUP              =	'DIALER.PICKUP.HANGUP'
  CMD_DIALER_PRIVACY                    =	'DIALER.PRIVACY'
  CMD_DIALER_REJECT_CALL                =	'DIALER.REJECT.CALL'
  CMD_DIALER_SPD_NAME                   =	'DIALER.SPDDIAL.NAME'
  CMD_DIALER_SPD_NUMBER                 =	'DIALER.SPDDIAL.NUMBER'
  CMD_DIALER_SPD_RECALL                 =	'DIALER.SPDDIAL.RECALL'
  CMD_DIALER_SPD_STORE                  =	'DIALER.SPDDIAL.STORE'
  CMD_DIALER_VOIP_CALLER_ID             =	'DIALER.VOIP.CALLER.ID'
  CMD_DIALER_VOIP_CALL_ACCT_ERROR       =	'DIALER.VOIP.ACCT.ERROR'
  CMD_DIALER_VOIP_CALL_ERROR            =	'DIALER.VOIP.CALL.ERROR'
  CMD_DIALER_VOL_DOWN                   =	'DIALER.VOL.DOWN'
  CMD_DIALER_VOL_UP                     =	'DIALER.VOL.UP'
  CMD_PASSTHRU                          =	'PASSTHRU'
  CMD_RC_ACTGRP_SUB_CHN                 =	'ROOMCOMBINE.ACTIVEGROUP.SUBSCRIBE.CHANNEL'
  CMD_RC_ACTGRP_SUB_CMD                 =	'ROOMCOMBINE.ACTIVEGROUP.SUBSCRIBE.COMMAND'
  CMD_RC_PARTITION_QUERY                =	'?REPORT.ROOMCOMBINE.PARTITION'
  CMD_RC_PARTITION_REPORT               =	'REPORT.ROOMCOMBINE.PARTITION'
  CMD_RC_PARTITION_SUB_CHN              =	'ROOMCOMBINE.PARTITION.SUBSCRIBE.CHANNEL'
  CMD_RC_PARTITION_SUB_CMD              =	'ROOMCOMBINE.PARTITION.SUBSCRIBE.COMMAND'
  CMD_RC_QUERY                          =	'?REPORT.ROOMCOMBINE'
  CMD_RC_REGISTER                       =	'ROOMCOMBINE.REGISTER'
  CMD_RC_REPORT                         =	'REPORT.ROOMCOMBINE'
  CMD_RC_ROOM_ADD                       =	'ROOMCOMBINE.ROOM.ADD'
  CMD_RC_ROOM_QUERY                     =	'?REPORT.ROOMCOMBINE.ROOM'
  CMD_RC_ROOM_REPORT                    =	'REPORT.ROOMCOMBINE.ROOM'
  CMD_RC_ROOM_SUB_CHN                   =	'ROOMCOMBINE.ROOM.SUBSCRIBE.CHANNEL'
  CMD_RC_ROOM_SUB_CMD                   =	'ROOMCOMBINE.ROOM.SUBSCRIBE.COMMAND'
  CMD_RC_ROOM_SUB_CMD_PERCENT           =	'ROOMCOMBINE.ROOM.SUBSCRIBE.COMMAND.PERCENT'
  CMD_RC_ROOM_SUB_LEV                   =	'ROOMCOMBINE.ROOM.SUBSCRIBE.LEVEL'
  CMD_RC_ROOM_SUB_LEV_PERCENT           =	'ROOMCOMBINE.ROOM.SUBSCRIBE.LEVEL.PERCENT'
  CMD_RC_ROOM_SUB_LEV_RANGE             =	'ROOMCOMBINE.ROOM.SUBSCRIBE.LEVEL.RANGE'
  CMD_RECALL_PARAMETER_PRESET           =	'RECALL.PARAMETER.PRESET'
  CMD_REGISTER_IP_DEVICE                =	'REGISTER.IP.DEVICE'
  CMD_REGISTER_RS232_DEVICE             =	'REGISTER.RS232.DEVICE'
  CMD_SUBSCRIPTIONS_QUERY               =	'?REPORT.SUBSCRIPTIONS'
  CMD_SUBSCRIPTIONS_REPORT              =	'REPORT.SUBSCRIPTIONS'
  CMD_SUB_CHN                           =	'SUBSCRIBE.CHANNEL'
  CMD_SUB_CMD                           =	'SUBSCRIBE.COMMAND'
  CMD_SUB_CMD_PERCENT                   =	'SUBSCRIBE.COMMAND.PERCENT'
  CMD_SUB_LEV                           =	'SUBSCRIBE.LEVEL'
  CMD_SUB_LEV_PERCENT                   =	'SUBSCRIBE.LEVEL.PERCENT'
  CMD_SUB_LEV_RANGE                     =	'SUBSCRIBE.LEVEL.RANGE'
  CMD_UNSUB                             =	'UNSUBSCRIBE'

DEFINE_TYPE

  STRUCTURE _AddTelephoneStruct
  {
    CHAR      sObjectID[8]                                                    //  format n.n.n
    INTEGER   nFBControlPort                                                  //  virtual device's port to control item
    INTEGER   nTelephoneLine                                                  //  which line to control, 1 or 2

    INTEGER   nSpeedDialMax                                                   //  number of speedDial slots to look for, default is 50, will conserve resources if less
  }

  STRUCTURE _BumpByPercentStruct
  {
    CHAR      sObjectID[8]                                                    //  format n.n.n
    CHAR      sParameterID[6]                                                 //  parameter id in 0xhex format
    FLOAT     fBumpBy                                                         //  range  -100.00 to +100.00
  }

  STRUCTURE _PassthruCommandStruct
  {
    INTEGER   nFBControlPort                                                  //  virtual device's port to control item
    CHAR      sCommandPrefix[DUET_MAX_PARAM_LEN]                              //  command prefix
    CHAR      sPassthruData[DUET_MAX_PARAM_LEN]                               //  passthru data to send
  }

  STRUCTURE _RecallPreset
  {
    INTEGER   nPresetID                                                       //  nPresetID to be recalled
  }

  STRUCTURE _RegisterDeviceStruct
  {
    CHAR      sNodeID[6]                                                      //  0xhex format
    DEV       vdvDevice                                                       //  virtual device to control Object
    CHAR      sIPAddrHostname[DUET_MAX_PARAM_LEN]                             //  ipaddress/hostname
    DEV       dvRS232Device                                                   //  masters RS232 port
    CHAR      sBaudRate[6]                                                    //  baud rate  optional, default 115200
  }

  STRUCTURE _RoomCombineAddRoomStruct
  {
    CHAR      sRoomGroupAddr[6]                                               //  room group address in 0xhex format
    CHAR      sRoomName[DUET_MAX_PARAM_LEN]                                   //  optional, room name
  }

  STRUCTURE _RoomCombineActiveGroupSubscribeChannelStruct
  {
    CHAR      sActiveGroupAddr[6]                                             //  ACTIVE group address in 0xhex format
    INTEGER   nFBControlPort                                                  //  virtual device's port to control item
    INTEGER   nFBControlChannel                                               //  virtual device's channel to control item
  }

  STRUCTURE _RoomCombineActiveGroupSubscribeCommandStruct
  {
    CHAR      sActiveGroupAddr[6]                                             //  ACTIVE group address in 0xhex format
    INTEGER   nFBControlPort                                                  //  virtual device's port to control item
    CHAR      sCommandPrefix[DUET_MAX_PARAM_LEN]                              //  command prefix
  }

  STRUCTURE _RoomCombinePartitionSubscribeChannelStruct
  {
    CHAR      sPartitionAddr[6]                                               //  partition address in 0xhex format
    INTEGER   nFBControlPort                                                  //  virtual device's port to control item
    INTEGER   nFBControlChannel                                               //  virtual device's channel to control item
    CHAR      sPartitionName[DUET_MAX_PARAM_LEN]                              //  optional, partition name
  }

  STRUCTURE _RoomCombinePartitionSubscribeCommandStruct
  {
    CHAR      sPartitionAddr[6]                                               //  partition address in 0xhex format
    INTEGER   nFBControlPort                                                  //  virtual device's port to control item
    CHAR      sCommandPrefix[DUET_MAX_PARAM_LEN]                              //  command prefix
    CHAR      sPartitionName[DUET_MAX_PARAM_LEN]                              //  optional, partition name
  }

  STRUCTURE _RoomCombineRegisterStruct
  {
    CHAR      sObjectID[8]                                                    //  format n.n.n
    DEV       vdvRoomCombine                                                  //  virtual device to control Room Combine Object
  }

  STRUCTURE _RoomCombineSubscribeChannelStruct
  {
    CHAR      sRoomGroupAddr[6]                                               //  room group address in 0xhex format
    CHAR      sRoomItemMnemonic[2]                                            //  see documentation for listing of RoomCombine Room Item Mnemonics
    INTEGER   nFBControlPort                                                  //  virtual device's port to control item
    INTEGER   nFBControlChannel                                               //  virtual device's channel to control item
  }

  STRUCTURE _RoomCombineSubscribeCommandStruct
  {
    CHAR      sRoomGroupAddr[6]                                               //  room group address in 0xhex format
    CHAR      sRoomItemMnemonic[2]                                            //  see documentation for listing of RoomCombine Room Item Mnemonics
    INTEGER   nFBControlPort                                                  //  virtual device's port to control item
    CHAR      sCommandPrefix[DUET_MAX_PARAM_LEN]                              //  command prefix
  }

  STRUCTURE _RoomCombineSubscribeLevelStruct
  {
    CHAR      sRoomGroupAddr[6]                                               //  room group address in 0xhex format
    CHAR      sRoomItemMnemonic[2]                                            //  see documentation for listing of RoomCombine Room Item Mnemonics
    INTEGER   nFBControlPort                                                  //  virtual device's port to control item
    INTEGER   nFBControlLevel                                                 //  virtual device's level to control item
    SINTEGER  nRangeMinimum                                                   //  level range minimum
    SINTEGER  nRangeMaximum                                                   //  level range maximum
  }

  STRUCTURE _SpeedDialStruct
  {
    INTEGER   nIndex                                                          //  index of speed dial number, 1 to 50
    CHAR      sName[100]                                                      //  name of speed dial number
    CHAR      sNumber[100]                                                    //  number to dial
  }

  STRUCTURE _SubscribeChannelStruct
  {
    CHAR      sObjectID[8]                                                    //  format n.n.n
    CHAR      sObjectType[4]                                                  //  see documentation for listing of Object Types
    CHAR      sParameterID[6]                                                 //  parameter id in 0xhex format
    INTEGER   nFBControlPort                                                  //  virtual device's port to control item
    INTEGER   nFBControlChannel                                               //  virtual device's channel to control item
  }

  STRUCTURE _SubscribeCommandStruct
  {
    CHAR      sObjectID[8]                                                    //  format n.n.n
    CHAR      sObjectType[4]                                                  //  see documentation for listing of Object Types
    CHAR      sParameterID[6]                                                 //  parameter id in 0xhex format
    INTEGER   nFBControlPort                                                  //  virtual device's port to control item
    CHAR      sCommandPrefix[DUET_MAX_PARAM_LEN]                              //  command prefix
    SINTEGER  nRangeMinimum                                                   //  level range minimum
    SINTEGER  nRangeMaximum                                                   //  level range maximum
  }

  STRUCTURE _SubscribeLevelStruct
  {
    CHAR      sObjectID[8]                                                    //  format n.n.n
    CHAR      sObjectType[4]                                                  //  see documentation for listing of Object Types
    CHAR      sParameterID[6]                                                 //  parameter id in 0xhex format
    INTEGER   nFBControlPort                                                  //  virtual device's port to control item
    INTEGER   nFBControlLevel                                                 //  virtual device's level to control item
    SINTEGER  nRangeMinimum                                                   //  level range minimum
    SINTEGER  nRangeMaximum                                                   //  level range maximum
  }

  STRUCTURE _UnSubscribeStruct
  {
    CHAR      sObjectID[8]                                                    //  format n.n.n
    CHAR      sParameterID[6]                                                 //  parameter id in 0xhex format
  }

  STRUCTURE _UpdateCommandValueStruct
  {
    CHAR     sCommandPrefix[DUET_MAX_PARAM_LEN]                               //  command prefix
    CHAR     sValue[DUET_MAX_PARAM_LEN]                                       //  update to value
  }

  (***********************************************************)
  (*               VARIABLE DEFINITIONS GO BELOW             *)
  (***********************************************************)

DEFINE_VARIABLE

  INTEGER nFirstTime                    =	0

  DEFINE_FUNCTION fnAddPots(DEV vdvDevice,                                  //  virtual device controlling registered BSS Audio Device
  _AddTelephoneStruct _struct)
  {
    /*|-----------------------------------------------------------------------------|
    | fnAddPots: Subscribe to Analog telephone device object                      |
    |     Parameters:                                                             |
    |         vdvDevice virtual device of registered BSS Audio Device             |
    |         _AddTelephoneStruct                                                 |
    |              sObjectID Format n.n.n                                         |
    |              nFBControlPort Virtual device's port to control item           |
    |              nSpeedDialMax Number of speedDial slots to look for            |
    |     RETURNs: Nothing                                                        |
    |-----------------------------------------------------------------------------|*/

    STACK_VAR CHAR sXML[DUET_MAX_CMD_LEN]
    STACK_VAR SLONG slResult

    slResult                            =	VARIABLE_TO_XML(_struct, sXML, 1,0)

    IF(slResult == 0)
    {
      _fnSendXMLCommand(vdvDevice, CMD_ADD_POTS,sXML)
    }
    ELSE
    {
      _fnReportParseError(slResult, 'fnAddPots')
    }
  }

  DEFINE_FUNCTION fnAddPotsEx(DEV vdvDevice,                                //  virtual device controlling registered BSS Audio Device
  CHAR      sObjectID[8],                                                 //  format n.n.n
  INTEGER   nFBControlPort,                                               //  virtual device's port to control item
  INTEGER   nSpeedDialMax                                                 //  number of speedDial slots to look for, default is 50, will conserve resouces in less
  )
  {
    /*|-----------------------------------------------------------------------------|
    | fnAddPotsEx: Subscribe to Analog telephone device object                    |
    |     Parameters:                                                             |
    |         vdvDevice virtual device of registered BSS Audio Device             |
    |         sObjectID Format n.n.n                                              |
    |         nFBControlPort Virtual device's port to control item                |
    |         nSpeedDialMax Number of speedDial slots to look for                 |
    |     RETURNs: Nothing                                                        |
    |-----------------------------------------------------------------------------|*/

    STACK_VAR _AddTelephoneStruct _struct

    _struct.sObjectID                   =	sObjectID
    _struct.nFBControlPort              =	nFBControlPort
    _struct.nSpeedDialMax               =	nSpeedDialMax

    fnAddPots(vdvDevice, _struct)
  }
  DEFINE_FUNCTION fnAddVoip(DEV vdvDevice,                                  //  virtual device controlling registered BSS Audio Device
  _AddTelephoneStruct _struct)
  {
    /*|-----------------------------------------------------------------------------|
    | fnAddVoip: Subscribe to VoIP telephone device object                        |
    |     Parameters:                                                             |
    |         vdvDevice virtual device of registered BSS Audio Device             |
    |         _AddTelephoneStruct                                                 |
    |              sObjectID Format n.n.n                                         |
    |              nFBControlPort Virtual device's port to control item           |
    |              nTelephoneLine Which line to control 1 or 2                    |
    |              nSpeedDialMax Number of speedDial slots to look for            |
    |     RETURNs: Nothing                                                        |
    |-----------------------------------------------------------------------------|*/

    STACK_VAR CHAR sXML[DUET_MAX_CMD_LEN]
    STACK_VAR SLONG slResult

    slResult                            =	VARIABLE_TO_XML(_struct, sXML, 1,0)

    IF(slResult == 0)
    {
      _fnSendXMLCommand(vdvDevice, CMD_ADD_VOIP,sXML)
    }
    ELSE
    {
      _fnReportParseError(slResult, 'fnAddVoip')
    }
  }

  DEFINE_FUNCTION fnAddVoipEx(DEV vdvDevice,                                //  virtual device controlling registered BSS Audio Device
  CHAR      sObjectID[8],                                                 //  format n.n.n
  INTEGER   nFBControlPort,                                               //  virtual device's port to control item
  INTEGER   nTelephoneLine,                                               //  which line to control, 1 or 2
  INTEGER   nSpeedDialMax)                                                //  number of speedDial slots to look for, default is 50, will conserve resouces in less

  {
    /*|-----------------------------------------------------------------------------|
    | fnAddVoipEx: Subscribe to VoIP telephone device object                      |
    |     Parameters:                                                             |
    |         vdvDevice virtual device of registered BSS Audio Device             |
    |         sObjectID Format n.n.n                                              |
    |         nFBControlPort Virtual device's port to control item                |
    |         nTelephoneLine which line to control, 1 or 2                        |
    |         nSpeedDialMax Number of speedDial slots to look for                 |
    |     RETURNs: Nothing                                                        |
    |-----------------------------------------------------------------------------|*/

    STACK_VAR _AddTelephoneStruct _struct

    _struct.sObjectID                   =	sObjectID
    _struct.nFBControlPort              =	nFBControlPort
    _struct.nTelephoneLine              =	nTelephoneLine
    _struct.nSpeedDialMax               =	nSpeedDialMax

    fnAddVoip(vdvDevice, _struct)
  }

  DEFINE_FUNCTION fnBumpByPercentage(DEV vdvDevice,                         //  virtual device controlling registered BSS Audio Device
  _BumpByPercentStruct _struct)
  {
    /*|-----------------------------------------------------------------------------|
    | fnBumpByPercentage: Send HProComm request to bump device object by +/-      |
    |       percentage                                                            |
    |     Parameters:                                                             |
    |         vdvDevice virtual device of registered BSS Audio Device             |
    |         _BumpByPercentStruct                                                |
    |              sObjectID Format n.n.n                                         |
    |              sParameterID Parameter id in 0xhex format                      |
    |              fBumpBy range -100.00 to +100.00                               |
    |     RETURNs: Nothing                                                        |
    |-----------------------------------------------------------------------------|*/

    STACK_VAR CHAR sXML[DUET_MAX_CMD_LEN]
    STACK_VAR SLONG slResult

    slResult                            =	VARIABLE_TO_XML(_struct, sXML, 1,0)

    IF(slResult == 0)
    {
      _fnSendXMLCommand(vdvDevice, CMD_BUMP_BY_PERCENTAGE,sXML)
    }
    ELSE
    {
      _fnReportParseError(slResult, 'fnBumpByPercentage')
    }
  }

  DEFINE_FUNCTION fnBumpByPercentageEx(DEV vdvDevice,                       //  virtual device controlling registered BSS Audio Device
  CHAR      sObjectID[8],                                                 //  format n.n.n
  CHAR      sParameterID[6],                                              //  parameter id in 0xhex format
  FLOAT     fBumpBy)                                                      //  range  -100.00 to +100.00
  {
    /*|-----------------------------------------------------------------------------|
    | fnBumpByPercentageEx: Send HProComm request to bump device object by +/-    |
    |       percentage                                                            |
    |     Parameters:                                                             |
    |         vdvDevice virtual device of registered BSS Audio Device             |
    |         sObjectID Format n.n.n                                              |
    |         sParameterID Parameter id in 0xhex format                           |
    |         fBumpBy range -100.00 to +100.00                                    |
    |     RETURNs: Nothing                                                        |
    |-----------------------------------------------------------------------------|*/

    STACK_VAR _BumpByPercentStruct _struct

    _struct.sObjectID                   =	sObjectID
    _struct.sParameterID                =	sParameterID
    _struct.fBumpBy                     =	fBumpBy

    fnBumpByPercentage(vdvDevice, _struct)
  }

  DEFINE_FUNCTION fnPassthruCommand(DEV vdvDevice,                          //  virtual device controlling registered BSS Audio Device
  _PassthruCommandStruct _struct)
  {
    /*|-----------------------------------------------------------------------------|

    | fnPassthruCOMMAND: Subscribe to object parameter with feedback using        |
    |       command                                                               |
    |     Parameters:                                                             |
    |         vdvDevice virtual device of registered BSS Audio Device             |
    |         _PassthruCommandStruct                                              |
    |              nFBControlPort Virtual device's port to control item           |
    |              sCommandPrefix Command prefix                                  |
    |              sPassthruData Passthru data to send                            |
    |     RETURNs: Nothing                                                        |
    |-----------------------------------------------------------------------------|*/

    STACK_VAR CHAR sXML[DUET_MAX_CMD_LEN]
    STACK_VAR SLONG slResult

    slResult                            =	VARIABLE_TO_XML(_struct, sXML, 1,0)

    IF(slResult == 0)
    {
      _fnSendXMLCommand(vdvDevice, CMD_PASSTHRU,sXML)
    }
    ELSE
    {
      _fnReportParseError(slResult, 'fnPassthruCommand')
    }
  }

  DEFINE_FUNCTION fnPassthruCommandEx(DEV vdvDevice,                        //  virtual device controlling registered BSS Audio Device
  INTEGER   nFBControlPort,                                               //  virtual device's port to control item
  CHAR      sCommandPrefix[DUET_MAX_PARAM_LEN],                           //  command prefix
  CHAR      sPassthruData[DUET_MAX_PARAM_LEN])                            //  passthru data to send
  {
    /*|-----------------------------------------------------------------------------|
    | fnPassthruCommandEx: Subscribe to object parameter with feedback using      |
    |       command                                                               |
    |     Parameters:                                                             |
    |         vdvDevice virtual device of registered BSS Audio Device             |
    |         nFBControlPort Virtual device's port to control item                |
    |         sCommandPrefix Command prefix                                       |
    |         sPassthruData Rassthru data to send                                 |
    |     RETURNs: Nothing                                                        |
    |-----------------------------------------------------------------------------|*/

    STACK_VAR _PassthruCommandStruct _struct

    _struct.nFBControlPort              =	nFBControlPort
    _struct.sCommandPrefix              =	sCommandPrefix
    _struct.sPassthruData               =	sPassthruData

    fnPassthruCommand(vdvDevice, _struct)
  }

  DEFINE_FUNCTION fnRecallPrameterPreset(DEV vdvDevice,                     //  virtual device controlling registered BSS Audio Device
  INTEGER nPresetID)
  {
    /*|-----------------------------------------------------------------------------|
    | fnRecallPrameterPreset: Recall a parameter preset; setup in Audio Architect |
    |     Parameters:                                                             |
    |         vdvDevice virtual device of registered BSS Audio Device             |
    |         nPresetID nPresetID to be recalled                                  |
    |     RETURNs: Nothing                                                        |
    |-----------------------------------------------------------------------------|*/

    STACK_VAR CHAR sXML[DUET_MAX_CMD_LEN]
    STACK_VAR SLONG slResult
    STACK_VAR _RecallPreset _struct

    _struct.nPresetID                   =	nPresetID

    slResult                            =	VARIABLE_TO_XML(_struct, sXML, 1,0)

    IF(slResult == 0)
    {
      _fnSendXMLCommand(vdvDevice, CMD_RECALL_PARAMETER_PRESET,sXML)
    }
    ELSE
    {
      _fnReportParseError(slResult, 'fnRecallPrameterPreset')
    }
  }

  DEFINE_FUNCTION fnRegisterIPDevice(DEV vdvModule,                         //  HPro module virtual device
  _RegisterDeviceStruct _struct)
  {
    /*|-----------------------------------------------------------------------------|
    | fnRegisterIPDevice: Connect to device via IP feedback on requested DPS      |
    |     Parameters:                                                             |
    |         vdvModule HPro module virtual device                                |
    |     RETURNs: Nothing                                                        |
    |-----------------------------------------------------------------------------|*/

    STACK_VAR CHAR sXML[DUET_MAX_CMD_LEN]
    STACK_VAR SLONG slResult

    slResult                            =	VARIABLE_TO_XML(_struct, sXML, 1,0)

    IF(slResult == 0)
    {
      _fnSendXMLCommand(vdvModule, CMD_REGISTER_IP_DEVICE,sXML)
    }
    ELSE
    {
      _fnReportParseError(slResult, 'fnRegisterIPDevice')
    }
  }

  DEFINE_FUNCTION fnRegisterIPDeviceEx(DEV vdvModule,                       //  HPro module virtual device
  CHAR      sNodeID[6],                                                   //  0xhex format
  DEV       vdvDevice,                                                    //  virtual device to control Object
  CHAR      sIPAddrHostname[DUET_MAX_PARAM_LEN])                          //  ipaddress/hostname
  {
    /*|-----------------------------------------------------------------------------|
    | fnRegisterIPDeviceEx: Connect to device via IP feedback on requested DPS    |
    |     Parameters:                                                             |
    |         vdvModule HPro module virtual device                                |
    |         sNodeID 0xhex format                                                |
    |         vdvDevice virtual device to control Object                          |
    |         sIPAddrHostname ipaddress/hostname                                  |
    |     RETURNs: Nothing                                                        |
    |-----------------------------------------------------------------------------|*/

    STACK_VAR _RegisterDeviceStruct _struct

    _struct.sNodeID                     =	sNodeID
    _struct.vdvDevice                   =	vdvDevice
    _struct.sIPAddrHostname             =	sIPAddrHostname

    fnRegisterIPDevice(vdvModule, _struct)
  }

  DEFINE_FUNCTION fnRegisterRS232Device(DEV vdvModule,                      //  HPro module virtual device
  _RegisterDeviceStruct _struct)
  {
    /*|-----------------------------------------------------------------------------|
    | fnRegisterRS232Device: Connect to device via IP feedback on requested DPS   |
    |     Parameters:                                                             |
    |         vdvModule HPro module virtual device                                |
    |     RETURNs: Nothing                                                        |
    |-----------------------------------------------------------------------------|*/

    STACK_VAR CHAR sXML[DUET_MAX_CMD_LEN]
    STACK_VAR SLONG slResult

    slResult                            =	VARIABLE_TO_XML(_struct, sXML, 1,0)

    IF(slResult == 0)
    {
      _fnSendXMLCommand(vdvModule, CMD_REGISTER_RS232_DEVICE,sXML)
    }
    ELSE
    {
      _fnReportParseError(slResult, 'fnRegisterRS232Device')
    }
  }

  DEFINE_FUNCTION fnRegisterRS232DeviceEx(DEV vdvModule,                    //  HPro module virtual device
  CHAR      sNodeID[6],                                                   //  0xhex format
  DEV       vdvDevice,                                                    //  virtual device to control Object
  DEV       dvRS232Device)                                                 //  baud rate  optional, default 115200
  {
    /*|-----------------------------------------------------------------------------|
    | fnRegisterRS232DeviceEx: Connect to device via IP feedback on requested DPS |
    |     Parameters:                                                             |
    |         vdvModule HPro module virtual device                                |
    |         sNodeID 0xhex format                                                |
    |         vdvDevice virtual device to control Object                          |
    |         dvRS232Device masters RS232 port                                    |
    |     RETURNs: Nothing                                                        |
    |-----------------------------------------------------------------------------|*/

    STACK_VAR _RegisterDeviceStruct _struct

    _struct.sNodeID                     =	sNodeID
    _struct.vdvDevice                   =	vdvDevice
    _struct.dvRS232Device               =	dvRS232Device

    fnRegisterRS232Device(vdvModule, _struct)
  }

  DEFINE_FUNCTION fnRegisterRS232DeviceBaudRateEx(DEV vdvModule,            //  HPro module virtual device
  CHAR      sNodeID[6],                                                   //  0xhex format
  DEV       vdvDevice,                                                    //  virtual device to control Object
  DEV       dvRS232Device,                                                //  masters RS232 port
  CHAR      sBaudRate[6])                                                 //  baud rate  optional, default 115200
  {
    /*|-----------------------------------------------------------------------------|
    | fnRegisterRS232DeviceBaudRateEx: Connect to device via IP feedback on       |
    |         requested DPS and supply the optional baud rate                     |
    |     Parameters:                                                             |
    |         vdvModule HPro module virtual device                                |
    |         sNodeID 0xhex format                                                |
    |         vdvDevice virtual device to control Object                          |
    |         dvRS232Device masters RS232 port                                    |
    |         sBaudRate baud rate  optional, default 115200                      |
    |     RETURNs: Nothing                                                        |
    |-----------------------------------------------------------------------------|*/

    STACK_VAR _RegisterDeviceStruct _struct

    _struct.sNodeID                     =	sNodeID
    _struct.vdvDevice                   =	vdvDevice
    _struct.dvRS232Device               =	dvRS232Device
    _struct.sBaudRate                   =	sBaudRate

    fnRegisterRS232Device(vdvModule, _struct)
  }

  DEFINE_FUNCTION fnReportRoomCombine(DEV vdvRoomCombine)                        //  virtual device controlling Room Combine Object
  {
    /*|-----------------------------------------------------------------------------|
    | fnReportRoomCombine: Reports all items by room subscribed to                |
    |     Parameters:                                                             |
    |         vdvRoomCombine virtual device controlling Room Combine Object       |
    |     RETURNs: Nothing                                                        |
    |-----------------------------------------------------------------------------|*/

    _fnSendCommand(vdvRoomCombine,CMD_RC_QUERY)
  }

  DEFINE_FUNCTION fnReportRoomCombinePartition(DEV vdvRoomCombine)               //  virtual device controlling Room Combine Object
  {
    /*|-----------------------------------------------------------------------------|

    | fnReportRoomCombinePartition: Subscribe to Room Combine partition, feedback |
    |       using command                                                         |
    |     Parameters:                                                             |
    |         vdvRoomCombine virtual device controlling Room Combine Object       |
    |     RETURNs: Nothing                                                        |
    |-----------------------------------------------------------------------------|*/

    _fnSendCommand(vdvRoomCombine,CMD_RC_PARTITION_QUERY)
  }

  DEFINE_FUNCTION fnReportRoomCombineRoom(DEV vdvRoomCombine)                    //  virtual device controlling Room Combine Object
  {
    /*|-----------------------------------------------------------------------------|
    | fnReportRoomCombineRoom: Reports all items by room subscribed to            |
    |     Parameters:                                                             |
    |         vdvRoomCombine virtual device controlling Room Combine Object       |
    |     RETURNs: Nothing                                                        |
    |-----------------------------------------------------------------------------|*/

    _fnSendCommand(vdvRoomCombine,CMD_RC_ROOM_QUERY)
  }

  DEFINE_FUNCTION fnReportSubscriptions(DEV vdvDevice)                           //  virtual device to report subscriptions
  {
    /*|-----------------------------------------------------------------------------|
    | fnReportSubscriptions: Reports all items by subscribed to                   |
    |     Parameters:                                                             |
    |         vdvDevice virtual device to report on, if virual devices is the     |
    |              module all registered devices are reported                     |
    |     RETURNs: Nothing                                                        |
    |-----------------------------------------------------------------------------|*/
    _fnSendCommand(vdvDevice,CMD_SUBSCRIPTIONS_QUERY)
  }

  DEFINE_FUNCTION fnRoomCombineActiveGroupSubscribeChannel(DEV vdvRoomCombine,   //  virtual device controlling Room Combine Object
  _RoomCombineActiveGroupSubscribeChannelStruct _struct)
  {
    /*|-----------------------------------------------------------------------------|
    | fnRoomCombineActiveGroupSubscribeChannel: Subscribe to Room Combine ACTIVE  |
    |       Group, feedback using channel                                         |
    |     Parameters:                                                             |
    |         vdvRoomCombine virtual device controlling Room Combine Object       |
    |         _RoomCombineActiveGroupSubscribeChannelStruct                       |
    |              sActiveGroupAddr ACTIVE group address in 0xhex format          |
    |              nFBControlPort Virtual device's port to control item           |
    |              nFBControlChannel Virtual device's channel to control item     |
    |     RETURNs: Nothing                                                        |
    |-----------------------------------------------------------------------------|*/

    STACK_VAR CHAR sXML[DUET_MAX_CMD_LEN]
    STACK_VAR SLONG slResult

    slResult                            =	VARIABLE_TO_XML(_struct, sXML, 1,0)

    IF(slResult == 0)
    {
      _fnSendXMLCommand(vdvRoomCombine, CMD_RC_ACTGRP_SUB_CHN,sXML)
    }
    ELSE
    {
      _fnReportParseError(slResult, 'fnRoomCombineActiveGroupSubscribeChannel')
    }
  }

  DEFINE_FUNCTION fnRoomCombineActiveGroupSubscribeChannelEx(DEV vdvRoomCombine, //  virtual device controlling Room Combine Object
  CHAR      sActiveGroupAddr[6],                                               //  ACTIVE group address in 0xhex format
  INTEGER   nFBControlPort,                                                    //  virtual device's port to control item
  INTEGER   nFBControlChannel)                                                 //  virtual device's channel to control item
  {
    /*|-----------------------------------------------------------------------------|
    | fnRoomCombineActiveGroupSubscribeChannelEx: Subscribe to Room Combine       |
    |       ACTIVE Group, feedback using channel                                  |
    |     Parameters:                                                             |
    |         vdvRoomCombine virtual device controlling Room Combine Object       |
    |         sActiveGroupAddr ACTIVE group address in 0xhex format               |
    |         nFBControlPort Virtual device's port to control item                |
    |         nFBControlChannel Virtual device's channel to control item          |
    |     RETURNs: Nothing                                                        |
    |-----------------------------------------------------------------------------|*/

    STACK_VAR _RoomCombineActiveGroupSubscribeChannelStruct _struct

    _struct.sActiveGroupAddr            =	sActiveGroupAddr
    _struct.nFBControlPort              =	nFBControlPort
    _struct.nFBControlChannel           =	nFBControlChannel

    fnRoomCombineActiveGroupSubscribeChannel(vdvRoomCombine, _struct)
  }

  DEFINE_FUNCTION fnRoomCombineActiveGroupSubscribeCommand(DEV vdvRoomCombine,   //  virtual device controlling Room Combine Object
  _RoomCombineActiveGroupSubscribeCommandStruct _struct)
  {
    /*|-----------------------------------------------------------------------------|

    | fnRoomCombineActiveGroupSubscribeCOMMAND: Subscribe to Room Combine ACTIVE  |
    |       Group, feedback using command                                         |
    |     Parameters:                                                             |
    |         vdvRoomCombine virtual device controlling Room Combine Object       |
    |         _RoomCombineActiveGroupSubscribeCommandStruct                       |
    |              sActiveGroupAddr ACTIVE group address in 0xhex format          |
    |              nFBControlPort Virtual device's port to control item           |
    |              sCommandPrefix Command prefix                                  |
    |     RETURNs: Nothing                                                        |
    |-----------------------------------------------------------------------------|*/

    STACK_VAR CHAR sXML[DUET_MAX_CMD_LEN]
    STACK_VAR SLONG slResult

    slResult                            =	VARIABLE_TO_XML(_struct, sXML, 1,0)

    IF(slResult == 0)
    {
      _fnSendXMLCommand(vdvRoomCombine, CMD_RC_ACTGRP_SUB_CMD,sXML)
    }
    ELSE
    {
      _fnReportParseError(slResult, 'fnRoomCombineActiveGroupSubscribeCommand')
    }
  }

  DEFINE_FUNCTION fnRoomCombineActiveGroupSubscribeCommandEx(DEV vdvRoomCombine, //  virtual device controlling Room Combine Object
  CHAR      sActiveGroupAddr[6],                                               //  ACTIVE group address in 0xhex format
  INTEGER   nFBControlPort,                                                      //  virtual device's port to control item
  CHAR      sCommandPrefix[DUET_MAX_PARAM_LEN])                                  //  command prefix
  {
    /*|-----------------------------------------------------------------------------|
    | fnRoomCombineActiveGroupSubscribeCommandEx: Subscribe to Room Combine       |
    |       ACTIVE Group, feedback using command                                  |
    |     Parameters:                                                             |
    |         vdvRoomCombine virtual device controlling Room Combine Object       |
    |              sActiveGroupAddr ACTIVE group address in 0xhex format          |
    |              nFBControlPort Virtual device's port to control item           |
    |              sCommandPrefix Command prefix                                  |
    |     RETURNs: Nothing                                                        |
    |-----------------------------------------------------------------------------|*/

    STACK_VAR _RoomCombineActiveGroupSubscribeCommandStruct _struct

    _struct.sActiveGroupAddr            =	sActiveGroupAddr
    _struct.nFBControlPort              =	nFBControlPort
    _struct.sCommandPrefix              =	sCommandPrefix

    fnRoomCombineActiveGroupSubscribeCommand(vdvRoomCombine, _struct)
  }

  DEFINE_FUNCTION fnRoomCombineAddRoom(DEV vdvRoomCombine,                       //  virtual device controlling Room Combine Object
  _RoomCombineAddRoomStruct _struct)
  {
    /*|-----------------------------------------------------------------------------|
    | fnRoomCombineAddRoom: Add Room to Room Combine Object                       |
    |     Parameters:                                                             |
    |         vdvRoomCombine virtual device controlling Room Combine Object       |
    |         _RoomCombineAddRoomStruct                                           |
    |              sRoomGroupAddr Room group address in 0xhex format              |
    |              sRoomName Optional, room name                                  |
    |     RETURNs: Nothing                                                        |
    |-----------------------------------------------------------------------------|*/

    STACK_VAR CHAR sXML[DUET_MAX_CMD_LEN]
    STACK_VAR SLONG slResult

    slResult                            =	VARIABLE_TO_XML(_struct, sXML, 1,0)

    IF(slResult == 0)
    {
      _fnSendXMLCommand(vdvRoomCombine, CMD_RC_ROOM_ADD,sXML)
    }
    ELSE
    {
      _fnReportParseError(slResult, 'fnRoomCombineAddRoom')
    }
  }

  DEFINE_FUNCTION fnRoomCombineAddRoomEx(DEV vdvRoomCombine,                     //  virtual device controlling Room Combine Object
  CHAR      sRoomGroupAddr[6],                                                   //  room group address in 0xhex format
  CHAR      sRoomName[DUET_MAX_PARAM_LEN])                                       //  optional, room name
  {
    /*|-----------------------------------------------------------------------------|
    | fnRoomCombineAddRoomEx: Add Room to Room Combine Object                     |
    |     Parameters:                                                             |
    |         vdvRoomCombine virtual device controlling Room Combine Object       |
    |         sRoomGroupAddr Room group address in 0xhex format                   |
    |         sRoomName Optional, room name                                       |
    |     RETURNs: Nothing                                                        |
    |-----------------------------------------------------------------------------|*/

    STACK_VAR _RoomCombineAddRoomStruct _struct

    _struct.sRoomGroupAddr              =	sRoomGroupAddr
    _struct.sRoomName                   =	sRoomName

    fnRoomCombineAddRoom(vdvRoomCombine, _struct)
  }

  DEFINE_FUNCTION fnRoomCombinePartitionSubscribeChannel(DEV vdvRoomCombine,     //  virtual device controlling Room Combine Object
  _RoomCombinePartitionSubscribeChannelStruct _struct)
  {
    /*|-----------------------------------------------------------------------------|
    | fnRoomCombinePartitionSubscribeChannel: Subscribe to Room Combine           |
    |       partition, feedback using channel                                     |
    |     Parameters:                                                             |
    |         vdvRoomCombine virtual device controlling Room Combine Object       |
    |         _RoomCombinePartitionSubscribeChannelStruct                         |
    |              sPartitionAddr Partition address in 0xhex format               |
    |              nFBControlPort Virtual device's port to control item           |
    |              nFBControlChannel Virtual device's channel to control item     |
    |              sPartitionName optional, partition name                        |
    |     RETURNs: Nothing                                                        |
    |-----------------------------------------------------------------------------|*/

    STACK_VAR CHAR sXML[DUET_MAX_CMD_LEN]
    STACK_VAR SLONG slResult

    slResult                            =	VARIABLE_TO_XML(_struct, sXML, 1,0)

    IF(slResult == 0)
    {
      _fnSendXMLCommand(vdvRoomCombine, CMD_RC_PARTITION_SUB_CHN,sXML)
    }
    ELSE
    {
      _fnReportParseError(slResult, 'fnRoomCombinePartitionSubscribeChannel')
    }
  }

  DEFINE_FUNCTION fnRoomCombinePartitionSubscribeChannelEx(DEV vdvRoomCombine,   //  virtual device controlling Room Combine Object
  CHAR      sPartitionAddr[6],                                                   //  partition address in 0xhex format
  INTEGER   nFBControlPort,                                                      //  virtual device's port to control item
  INTEGER   nFBControlChannel,                                                   //  virtual device's channel to control item
  CHAR      sPartitionName[DUET_MAX_PARAM_LEN])                                  //  optional, partition name
  {
    /*|-----------------------------------------------------------------------------|
    | fnRoomCombinePartitionSubscribeChannelEx: Subscribe to Room Combine         |
    |       partition, feedback using channel                                     |
    |     Parameters:                                                             |
    |         vdvRoomCombine virtual device controlling Room Combine Object       |
    |         sPartitionAddr Partition address in 0xhex format                    |
    |         nFBControlPort Virtual device's port to control item                |
    |         nFBControlChannel Virtual device's channel to control item          |
    |         sPartitionName optional, partition name                             |
    |     RETURNs: Nothing                                                        |
    |-----------------------------------------------------------------------------|*/

    STACK_VAR _RoomCombinePartitionSubscribeChannelStruct _struct

    _struct.sPartitionAddr              =	sPartitionAddr
    _struct.nFBControlPort              =	nFBControlPort
    _struct.nFBControlChannel           =	nFBControlChannel
    _struct.sPartitionName              =	sPartitionName

    fnRoomCombinePartitionSubscribeChannel(vdvRoomCombine, _struct)
  }

  DEFINE_FUNCTION fnRoomCombinePartitionSubscribeCommand(DEV vdvRoomCombine,     //  virtual device controlling Room Combine Object
  _RoomCombinePartitionSubscribeCommandStruct _struct)
  {
    /*|-----------------------------------------------------------------------------|

    | fnRoomCombinePartitionSubscribeCOMMAND: Subscribe to Room Combine           |
    |       partition, feedback using command                                     |
    |     Parameters:                                                             |
    |         vdvRoomCombine virtual device controlling Room Combine Object       |
    |         _RoomCombinePartitionSubscribeCommandStruct                         |
    |              sPartitionAddr Partition address in 0xhex format               |
    |              nFBControlPort Virtual device's port to control item           |
    |              sCommandPrefix Command prefix                                  |
    |              sPartitionName optional, partition name                        |
    |     RETURNs: Nothing                                                        |
    |-----------------------------------------------------------------------------|*/

    STACK_VAR CHAR sXML[DUET_MAX_CMD_LEN]
    STACK_VAR SLONG slResult

    slResult                            =	VARIABLE_TO_XML(_struct, sXML, 1,0)

    IF(slResult == 0)
    {
      _fnSendXMLCommand(vdvRoomCombine, CMD_RC_PARTITION_SUB_CMD,sXML)
    }
    ELSE
    {
      _fnReportParseError(slResult, 'fnRoomCombinePartitionSubscribeCommand')
    }
  }

  DEFINE_FUNCTION fnRoomCombinePartitionSubscribeCommandEx(DEV vdvRoomCombine,     //  virtual device controlling Room Combine Object
  CHAR      sPartitionAddr[6],                                                   //  partition address in 0xhex format
  INTEGER   nFBControlPort,                                                      //  virtual device's port to control item
  CHAR      sCommandPrefix[DUET_MAX_PARAM_LEN],                                  //  command prefix
  CHAR      sPartitionName[DUET_MAX_PARAM_LEN])                                  //  optional, partition name
  {
    /*|-----------------------------------------------------------------------------|
    | fnRoomCombinePartitionSubscribeCommandEx: Subscribe to Room Combine         |
    |       partition, feedback using command                                     |
    |     Parameters:                                                             |
    |         vdvRoomCombine virtual device controlling Room Combine Object       |
    |         sPartitionAddr Partition address in 0xhex format                    |
    |         nFBControlPort Virtual device's port to control item                |
    |         sCommandPrefix Command prefix                                       |
    |         sPartitionName optional, partition name                             |
    |     RETURNs: Nothing                                                        |
    |-----------------------------------------------------------------------------|*/

    STACK_VAR _RoomCombinePartitionSubscribeCommandStruct _struct

    _struct.sPartitionAddr              =	sPartitionAddr
    _struct.nFBControlPort              =	nFBControlPort
    _struct.sCommandPrefix              =	sCommandPrefix
    _struct.sPartitionName              =	sPartitionName

    fnRoomCombinePartitionSubscribeCommand(vdvRoomCombine, _struct)
  }

  DEFINE_FUNCTION fnRoomCombineRegister(DEV vdvDevice,                      //  virtual device controlling registered BSS Audio Device
  _RoomCombineRegisterStruct _struct)
  {
    /*|-----------------------------------------------------------------------------|
    | fnRoomCombineRegister: Register a Room Combine Object                       |
    |     Parameters:                                                             |
    |         vdvDevice virtual device of registered BSS Audio Device             |
    |         _RoomCombineRegisterStruct                                          |
    |              sObjectID Format n.n.n                                         |
    |              vdvDevice virtual device to control Room Combine Object        |
    |     RETURNs: Nothing                                                        |
    |-----------------------------------------------------------------------------|*/

    STACK_VAR CHAR sXML[DUET_MAX_CMD_LEN]
    STACK_VAR SLONG slResult

    slResult                            =	VARIABLE_TO_XML(_struct, sXML, 1,0)

    IF(slResult == 0)
    {
      _fnSendXMLCommand(vdvDevice, CMD_RC_REGISTER,sXML)
    }
    ELSE
    {
      _fnReportParseError(slResult, 'fnRoomCombineRegister')
    }
  }

  DEFINE_FUNCTION fnRoomCombineRegisterEx(DEV vdvDevice,                    //  virtual device controlling registered BSS Audio Device
  CHAR      sObjectID[8],                                                 //  format n.n.n
  DEV       vdvRoomCombine)                                               //  virtual device to control Room Combine Object
  {
    /*|-----------------------------------------------------------------------------|
    | fnRoomCombineRegister: Register a Room Combine Object                       |
    |     Parameters:                                                             |
    |         vdvDevice virtual device of registered BSS Audio Device             |
    |         sObjectID Format n.n.n                                              |
    |         vdvRoomCombine virtual device to control Room Combine Object        |
    |     RETURNs: Nothing                                                        |
    |-----------------------------------------------------------------------------|*/

    STACK_VAR _RoomCombineRegisterStruct _struct

    _struct.sObjectID                   =	sObjectID
    _struct.vdvRoomCombine              =	vdvRoomCombine

    fnRoomCombineRegister(vdvDevice, _struct)
  }

  DEFINE_FUNCTION fnRoomCombineRoomSubscribeChannel(DEV vdvRoomCombine,          //  virtual device controlling Room Combine Object
  _RoomCombineSubscribeChannelStruct _struct)
  {
    /*|-----------------------------------------------------------------------------|
    | fnRoomCombineRoomSubscribeChannel: Subscribe to room combine room object    |
    |       parameter with feedback on channel                                    |
    |     Parameters:                                                             |
    |         vdvRoomCombine virtual device controlling Room Combine Object       |
    |         _RoomCombineSubscribeChannelStruct                                  |
    |              sRoomGroupAddr Room group address in 0xhex format              |
    |              sRoomItemMnemonic See documentation for listing of RoomCombine |
    |                 Room Item Mnemonics                                         |
    |              nFBControlPort Virtual device's port to control item           |
    |              nFBControlChannel Virtual device's channel to control item     |
    |     RETURNs: Nothing                                                        |
    |-----------------------------------------------------------------------------|*/

    STACK_VAR CHAR sXML[DUET_MAX_CMD_LEN]
    STACK_VAR SLONG slResult

    slResult                            =	VARIABLE_TO_XML(_struct, sXML, 1,0)

    IF(slResult == 0)
    {
      _fnSendXMLCommand(vdvRoomCombine, CMD_RC_ROOM_SUB_CHN,sXML)
    }
    ELSE
    {
      _fnReportParseError(slResult, 'fnRoomCombineRoomSubscribeChannel')
    }
  }

  DEFINE_FUNCTION fnRoomCombineRoomSubscribeChannelEx(DEV vdvRoomCombine,        //  virtual device controlling Room Combine Object
  CHAR      sRoomGroupAddr[6],                                                 //  room group address in 0xhex format
  CHAR      sRoomItemMnemonic[2],                                              //  see documentation for listing of RoomCombine Room Item Mnemonics
  INTEGER   nFBControlPort,                                                    //  virtual device's port to control item
  INTEGER   nFBControlChannel)                                                 //  virtual device's channel to control item
  {
    /*|-----------------------------------------------------------------------------|
    | fnRoomCombineRoomSubscribeChannelEx: Subscribe to room combine room object  |
    |       parameter with feedback on channel                                    |
    |     Parameters:                                                             |
    |         vdvRoomCombine virtual device controlling Room Combine Object       |
    |              sRoomGroupAddr Room group address in 0xhex format              |
    |              sRoomItemMnemonic See documentation for listing of RoomCombine |
    |                 Room Item Mnemonics                                         |
    |              nFBControlPort Virtual device's port to control item           |
    |              nFBControlChannel Virtual device's channel to control item     |
    |     RETURNs: Nothing                                                        |
    |-----------------------------------------------------------------------------|*/

    STACK_VAR _RoomCombineSubscribeChannelStruct _struct

    _struct.sRoomGroupAddr              =	sRoomGroupAddr
    _struct.sRoomItemMnemonic           =	sRoomItemMnemonic
    _struct.nFBControlPort              =	nFBControlPort
    _struct.nFBControlChannel           =	nFBControlChannel

    fnRoomCombineRoomSubscribeChannel(vdvRoomCombine, _struct)
  }

  DEFINE_FUNCTION fnRoomCombineRoomSubscribeCommand(DEV vdvRoomCombine,          //  virtual device controlling Room Combine Object
  _RoomCombineSubscribeCommandStruct _struct)
  {
    /*|-----------------------------------------------------------------------------|

    | fnRoomCombineRoomSubscribeCOMMAND: Subscribe to room combine room object    |
    |       parameter with feedback using command                                 |
    |     Parameters:                                                             |
    |         vdvRoomCombine virtual device controlling Room Combine Object       |
    |         _RoomCombineSubscribeCommandStruct                                  |
    |              sRoomGroupAddr Room group address in 0xhex format              |
    |              sRoomItemMnemonic See documentation for listing of RoomCombine |
    |                   Room Item Mnemonics                                       |
    |              nFBControlPort Virtual device's port to control item           |
    |              sCommandPrefix Command prefix                                  |
    |     RETURNs: Nothing                                                        |
    |-----------------------------------------------------------------------------|*/

    STACK_VAR CHAR sXML[DUET_MAX_CMD_LEN]
    STACK_VAR SLONG slResult

    slResult                            =	VARIABLE_TO_XML(_struct, sXML, 1,0)

    IF(slResult == 0)
    {
      _fnSendXMLCommand(vdvRoomCombine, CMD_RC_ROOM_SUB_CMD,sXML)
    }
    ELSE
    {
      _fnReportParseError(slResult, 'fnRoomCombineRoomSubscribeCommand')
    }
  }

  DEFINE_FUNCTION fnRoomCombineRoomSubscribeCommandEx(DEV vdvRoomCombine,        //  virtual device controlling Room Combine Object
  CHAR      sRoomGroupAddr[6],                                                 //  room group address in 0xhex format
  CHAR      sRoomItemMnemonic[2],                                              //  see documentation for listing of RoomCombine Room Item Mnemonics
  INTEGER   nFBControlPort,                                                    //  virtual device's port to control item
  CHAR      sCommandPrefix[DUET_MAX_PARAM_LEN])                                //  command prefix
  {
    /*|-----------------------------------------------------------------------------|

    | fnRoomCombineRoomSubscribeCOMMAND: Subscribe to room combine room object    |
    |       parameter with feedback using command                                 |
    |     Parameters:                                                             |
    |         vdvRoomCombine virtual device controlling Room Combine Object       |
    |         sRoomGroupAddr Room group address in 0xhex format                   |
    |         sRoomItemMnemonic See documentation for listing of RoomCombine      |
    |            Room Item Mnemonics                                              |
    |         nFBControlPort Virtual device's port to control item                |
    |         sCommandPrefix Command prefix                                       |
    |     RETURNs: Nothing                                                        |
    |-----------------------------------------------------------------------------|*/

    STACK_VAR _RoomCombineSubscribeCommandStruct _struct

    _struct.sRoomGroupAddr              =	sRoomGroupAddr
    _struct.sRoomItemMnemonic           =	sRoomItemMnemonic
    _struct.nFBControlPort              =	nFBControlPort
    _struct.sCommandPrefix              =	sCommandPrefix

    fnRoomCombineRoomSubscribeCommand(vdvRoomCombine, _struct)
  }

  DEFINE_FUNCTION fnRoomCombineRoomSubscribeCommandPercent(DEV vdvRoomCombine,   //  virtual device controlling Room Combine Object
  _RoomCombineSubscribeCommandStruct _struct)
  {
    /*|-----------------------------------------------------------------------------|
    | fnRoomCombineRoomSubscribeCommandPercent: Subscribe to room combine room    |
    |       object parameter with feedback using command                          |
    |     Parameters:                                                             |
    |         vdvRoomCombine virtual device controlling Room Combine Object       |
    |         _RoomCombineSubscribeCommandStruct                                  |
    |              sRoomGroupAddr Room group address in 0xhex format              |
    |              sRoomItemMnemonic See documentation for listing of RoomCombine |
    |                 Room Item Mnemonics                                         |
    |              nFBControlPort Virtual device's port to control item           |
    |              sCommandPrefix Command prefix                                  |
    |     RETURNs: Nothing                                                        |
    |-----------------------------------------------------------------------------|*/

    STACK_VAR CHAR sXML[DUET_MAX_CMD_LEN]
    STACK_VAR SLONG slResult

    slResult                            =	VARIABLE_TO_XML(_struct, sXML, 1,0)

    IF(slResult == 0)
    {
      _fnSendXMLCommand(vdvRoomCombine, CMD_RC_ROOM_SUB_CMD_PERCENT,sXML)
    }
    ELSE
    {
      _fnReportParseError(slResult, 'fnRoomCombineRoomSubscribeCommandPercent')
    }
  }

  DEFINE_FUNCTION fnRoomCombineRoomSubscribeCommandPercentEx(DEV vdvRoomCombine, //  virtual device controlling Room Combine Object
  CHAR      sRoomGroupAddr[6],                                                 //  room group address in 0xhex format
  CHAR      sRoomItemMnemonic[2],                                              //  see documentation for listing of RoomCombine Room Item Mnemonics
  INTEGER   nFBControlPort,                                                    //  virtual device's port to control item
  CHAR      sCommandPrefix[DUET_MAX_PARAM_LEN])                                //  command prefix
  {
    /*|-----------------------------------------------------------------------------|
    | fnRoomCombineRoomSubscribeCommandPercentEx: Subscribe to room combine room  |
    |       object parameter with feedback using command                          |
    |     Parameters:                                                             |
    |         vdvRoomCombine virtual device controlling Room Combine Object       |
    |         sRoomGroupAddr Room group address in 0xhex format                   |
    |         sRoomItemMnemonic See documentation for listing of RoomCombine      |
    |            Room Item Mnemonics                                              |
    |         nFBControlPort Virtual device's port to control item                |
    |         sCommandPrefix Command prefix                                       |
    |     RETURNs: Nothing                                                        |
    |-----------------------------------------------------------------------------|*/

    STACK_VAR _RoomCombineSubscribeCommandStruct _struct

    _struct.sRoomGroupAddr              =	sRoomGroupAddr
    _struct.sRoomItemMnemonic           =	sRoomItemMnemonic
    _struct.nFBControlPort              =	nFBControlPort
    _struct.sCommandPrefix              =	sCommandPrefix

    fnRoomCombineRoomSubscribeCommandPercent(vdvRoomCombine, _struct)
  }

  DEFINE_FUNCTION fnRoomCombineRoomSubscribeLevel(DEV vdvRoomCombine,            //  virtual device controlling Room Combine Object
  _RoomCombineSubscribeLevelStruct _struct)
  {
    /*|-----------------------------------------------------------------------------|
    | fnRoomCombineRoomSubscribeLevel: Subscribe to room combine room for value   |
    |       feedback on level. Feedback values will be in the range of 0.00 -     |
    |       255.00                                                                |
    |     Parameters:                                                             |
    |         vdvRoomCombine virtual device controlling Room Combine Object       |
    |         _RoomCombineSubscribeLevelStruct                                    |
    |              sRoomGroupAddr Room group address in 0xhex format              |
    |              sRoomItemMnemonic See documentation for listing of RoomCombine |
    |                 Room Item Mnemonics                                         |
    |              nFBControlPort Virtual device's port to control item           |
    |              nFBControlLevel Virtual device's level to control item         |
    |     RETURNs: Nothing                                                        |
    |-----------------------------------------------------------------------------|*/

    STACK_VAR CHAR sXML[DUET_MAX_CMD_LEN]
    STACK_VAR SLONG slResult

    slResult                            =	VARIABLE_TO_XML(_struct, sXML, 1,0)

    IF(slResult == 0)
    {
      _fnSendXMLCommand(vdvRoomCombine, CMD_RC_ROOM_SUB_LEV,sXML)
    }
    ELSE
    {
      _fnReportParseError(slResult, 'fnRoomCombineRoomSubscribeLevel')
    }
  }

  DEFINE_FUNCTION fnRoomCombineRoomSubscribeLevelEx(DEV vdvRoomCombine,          //  virtual device controlling Room Combine Object
  CHAR      sRoomGroupAddr[6],                                                 //  room group address in 0xhex format
  CHAR      sRoomItemMnemonic[2],                                              //  see documentation for listing of RoomCombine Room Item Mnemonics
  INTEGER   nFBControlPort,                                                    //  virtual device's port to control item
  INTEGER   nFBControlLevel)                                                   //  virtual device's level to control item
  {
    /*|-----------------------------------------------------------------------------|
    | fnRoomCombineRoomSubscribeLevelEx: Subscribe to room combine room for value |
    |       feedback on level. Feedback values will be in the range of 0.00 -     |
    |       255.00                                                                |
    |     Parameters:                                                             |
    |         vdvRoomCombine virtual device controlling Room Combine Object       |
    |         sRoomGroupAddr Room group address in 0xhex format                   |
    |         sRoomItemMnemonic See documentation for listing of RoomCombine      |
    |            Room Item Mnemonics                                              |
    |         nFBControlPort Virtual device's port to control item                |
    |         sCommandPrefix Command prefix                                       |
    |     RETURNs: Nothing                                                        |
    |-----------------------------------------------------------------------------|*/

    STACK_VAR _RoomCombineSubscribeLevelStruct _struct

    _struct.sRoomGroupAddr              =	sRoomGroupAddr
    _struct.sRoomItemMnemonic           =	sRoomItemMnemonic
    _struct.nFBControlPort              =	nFBControlPort
    _struct.nFBControlLevel             =	nFBControlLevel

    fnRoomCombineRoomSubscribeLevel(vdvRoomCombine, _struct)
  }

  DEFINE_FUNCTION fnRoomCombineRoomSubscribeLevelPrecent(DEV vdvRoomCombine,     //  virtual device controlling Room Combine Object
  _RoomCombineSubscribeLevelStruct _struct)
  {
    /*|-----------------------------------------------------------------------------|
    | fnRoomCombineRoomSubscribeLevelPrecent: Subscribe to room combine room for  |
    |       percentage feedback on level. Feedback values will be in the range of |
    |       0.00- 100.00                                                          |
    |     Parameters:                                                             |
    |         vdvRoomCombine virtual device controlling Room Combine Object       |
    |         _RoomCombineSubscribeLevelStruct                                    |
    |              sRoomGroupAddr Room group address in 0xhex format              |
    |              sRoomItemMnemonic See documentation for listing of RoomCombine |
    |                 Room Item Mnemonics                                         |
    |              nFBControlPort Virtual device's port to control item           |
    |              nFBControlLevel Virtual device's level to control item         |
    |     RETURNs: Nothing                                                        |
    |-----------------------------------------------------------------------------|*/

    STACK_VAR CHAR sXML[DUET_MAX_CMD_LEN]
    STACK_VAR SLONG slResult

    slResult                            =	VARIABLE_TO_XML(_struct, sXML, 1,0)

    IF(slResult == 0)
    {
      _fnSendXMLCommand(vdvRoomCombine, CMD_RC_ROOM_SUB_LEV_PERCENT,sXML)
    }
    ELSE
    {
      _fnReportParseError(slResult, 'fnRoomCombineRoomSubscribeLevelPrecent')
    }
  }

  DEFINE_FUNCTION fnRoomCombineRoomSubscribeLevelPrecentEx(DEV vdvRoomCombine,   //  virtual device controlling Room Combine Object
  CHAR      sRoomGroupAddr[6],                                                 //  room group address in 0xhex format
  CHAR      sRoomItemMnemonic[2],                                              //  see documentation for listing of RoomCombine Room Item Mnemonics
  INTEGER   nFBControlPort,                                                    //  virtual device's port to control item
  INTEGER   nFBControlLevel)                                                   //  virtual device's level to control item
  {
    /*|-----------------------------------------------------------------------------|
    | fnRoomCombineRoomSubscribeLevelPrecentEx: Subscribe to room combine room for|
    |       percentage feedback on level. Feedback values will be in the range of |
    |       0.00- 100.00                                                          |
    |     Parameters:                                                             |
    |         vdvRoomCombine virtual device controlling Room Combine Object       |
    |         sRoomGroupAddr Room group address in 0xhex format                   |
    |         sRoomItemMnemonic See documentation for listing of RoomCombine      |
    |            Room Item Mnemonics                                              |
    |         nFBControlPort Virtual device's port to control item                |
    |         sCommandPrefix Command prefix                                       |
    |     RETURNs: Nothing                                                        |
    |-----------------------------------------------------------------------------|*/

    STACK_VAR _RoomCombineSubscribeLevelStruct _struct

    _struct.sRoomGroupAddr              =	sRoomGroupAddr
    _struct.sRoomItemMnemonic           =	sRoomItemMnemonic
    _struct.nFBControlPort              =	nFBControlPort
    _struct.nFBControlLevel             =	nFBControlLevel

    fnRoomCombineRoomSubscribeLevelPrecent(vdvRoomCombine, _struct)
  }

  DEFINE_FUNCTION fnRoomCombineRoomSubscribeLevelRange(DEV vdvRoomCombine,       //  virtual device controlling Room Combine Object
  _RoomCombineSubscribeLevelStruct _struct)
  {
    /*|-----------------------------------------------------------------------------|
    | fnRoomCombineRoomSubscribeLevelRange: Subscribe to room combine room for    |
    |       value feedback on level user specified range                          |
    |     Parameters:                                                             |
    |         vdvRoomCombine virtual device controlling Room Combine Object       |
    |         _RoomCombineSubscribeLevelStruct                                    |
    |              sRoomGroupAddr Room group address in 0xhex format              |
    |              sRoomItemMnemonic See documentation for listing of RoomCombine |
    |                 Room Item Mnemonics                                         |
    |              nFBControlPort Virtual device's port to control item           |
    |              nFBControlLevel Virtual device's level to control item         |
    |              nRangeMinimum Level range minimum                              |
    |              nRangeMaximum Level range maximum                              |
    |     RETURNs: Nothing                                                        |
    |-----------------------------------------------------------------------------|*/

    STACK_VAR CHAR sXML[DUET_MAX_CMD_LEN]
    STACK_VAR SLONG slResult

    slResult                            =	VARIABLE_TO_XML(_struct, sXML, 1,0)

    IF(slResult == 0)
    {
      _fnSendXMLCommand(vdvRoomCombine, CMD_RC_ROOM_SUB_LEV_RANGE,sXML)
    }
    ELSE
    {
      _fnReportParseError(slResult, 'fnRoomCombineRoomSubscribeLevelRange')
    }
  }

  DEFINE_FUNCTION fnRoomCombineRoomSubscribeLevelRangeEx(DEV vdvRoomCombine,     //  virtual device controlling Room Combine Object
  CHAR      sRoomGroupAddr[6],                                                 //  room group address in 0xhex format
  CHAR      sRoomItemMnemonic[2],                                              //  see documentation for listing of RoomCombine Room Item Mnemonics
  INTEGER   nFBControlPort,                                                    //  virtual device's port to control item
  INTEGER   nFBControlLevel,                                                   //  virtual device's level to control item
  SINTEGER  nRangeMinimum,                                                     //  level range minimum
  SINTEGER  nRangeMaximum)                                                     //  level range maximum
  {
    /*|-----------------------------------------------------------------------------|
    | fnRoomCombineRoomSubscribeLevelRange: Subscribe to room combine room for    |
    |       value feedback on level user specified range                          |
    |     Parameters:                                                             |
    |         vdvRoomCombine virtual device controlling Room Combine Object       |
    |         sRoomGroupAddr Room group address in 0xhex format                   |
    |         sRoomItemMnemonic See documentation for listing of RoomCombine      |
    |                 Room Item Mnemonics                                         |
    |         nFBControlPort Virtual device's port to control item                |
    |         nFBControlLevel Virtual device's level to control item              |
    |         nRangeMinimum Level range minimum                                   |
    |         nRangeMaximum Level range maximum                                   |
    |     RETURNs: Nothing                                                        |
    |-----------------------------------------------------------------------------|*/

    STACK_VAR _RoomCombineSubscribeLevelStruct _struct

    _struct.sRoomGroupAddr              =	sRoomGroupAddr
    _struct.sRoomItemMnemonic           =	sRoomItemMnemonic
    _struct.nFBControlPort              =	nFBControlPort
    _struct.nFBControlLevel             =	nFBControlLevel
    _struct.nRangeMinimum               =	nRangeMinimum
    _struct.nRangeMaximum               =	nRangeMaximum

    fnRoomCombineRoomSubscribeLevelRange(vdvRoomCombine, _struct)
  }

  DEFINE_FUNCTION fnSpeedDialStore(DEV vdvDevice,                                  //  virtual device controlling registered BSS Audio Device
  _SpeedDialStruct _struct)
  {
    /*|-----------------------------------------------------------------------------|
    | fnSpeedDialStore: Store name, number at given index in speed dial list      |
    |     Parameters:                                                             |
    |         vdvDevice virtual device of registered BSS Audio Device             |
    |         _SpeedDialStruct                                                    |
    |              nIndex index of speed dial number, 1 to 50                     |
    |              sName name of speed dial number                                |
    |              sNumber number to dial                                         |
    |     RETURNs: Nothing                                                        |
    |-----------------------------------------------------------------------------|*/

    STACK_VAR CHAR sXML[DUET_MAX_CMD_LEN]
    STACK_VAR SLONG slResult

    slResult                            =	VARIABLE_TO_XML(_struct, sXML, 1,0)

    IF(slResult == 0)
    {
      _fnSendXMLCommand(vdvDevice, CMD_DIALER_SPD_STORE,sXML)
    }
    ELSE
    {
      _fnReportParseError(slResult, 'fnSpeedDialStore')
    }
  }

  DEFINE_FUNCTION fnSpeedDialStoreEx(DEV vdvDevice,                       //  virtual device controlling registered BSS Audio Device
  INTEGER   nIndex,                                                     //  index of speed dial number, 1 to 50
  CHAR      sName[100],                                                 //  name of speed dial number
  CHAR      sNumber[100])
  {
    /*|-----------------------------------------------------------------------------|
    | fnSpeedDialStoreEx: Store name, number at given index in speed dial list    |
    |     Parameters:                                                             |
    |         vdvDevice virtual device of registered BSS Audio Device             |
    |         nIndex index of speed dial number, 1 to 50                          |
    |         sName name of speed dial number                                     |
    |         sNumber number to dial                                              |
    |     RETURNs: Nothing                                                        |
    |-----------------------------------------------------------------------------|*/

    STACK_VAR _SpeedDialStruct _struct

    _struct.nIndex                      =	nIndex
    _struct.sName                       =	sName
    _struct.sNumber                     =	sNumber

    fnSpeedDialStore(vdvDevice, _struct)
  }

  DEFINE_FUNCTION fnSpeedDialRecall(DEV vdvDevice,                                  //  virtual device controlling registered BSS Audio Device
  _SpeedDialStruct _struct)
  {
    /*|-----------------------------------------------------------------------------|
    | fnSpeedDialStore: Store name, number at given index in speed dial list      |
    |     Parameters:                                                             |
    |         vdvDevice virtual device of registered BSS Audio Device             |
    |         _SpeedDialStruct                                                    |
    |              nIndex index of speed dial number, 1 to 50                     |
    |     RETURNs: Nothing                                                        |
    |-----------------------------------------------------------------------------|*/

    STACK_VAR CHAR sXML[DUET_MAX_CMD_LEN]
    STACK_VAR SLONG slResult

    slResult                            =	VARIABLE_TO_XML(_struct, sXML, 1,0)

    IF(slResult == 0)
    {
      _fnSendXMLCommand(vdvDevice, CMD_DIALER_SPD_RECALL,sXML)
    }
    ELSE
    {
      _fnReportParseError(slResult, 'fnSpeedDialRecall')
    }
  }

  DEFINE_FUNCTION fnSpeedDialRecallEx(DEV vdvDevice,                       //  virtual device controlling registered BSS Audio Device
  INTEGER   nIndex)                                                     //  index of speed dial number, 1 to 50
  {
    /*|-----------------------------------------------------------------------------|
    | fnSpeedDialStoreEx: Recall index in speed dial list                         |
    |     Parameters:                                                             |
    |         vdvDevice virtual device of registered BSS Audio Device             |
    |         nIndex index of speed dial number, 1 to 50                          |
    |     RETURNs: Nothing                                                        |
    |-----------------------------------------------------------------------------|*/

    STACK_VAR _SpeedDialStruct _struct

    _struct.nIndex                      =	nIndex

    fnSpeedDialRecall(vdvDevice, _struct)
  }

  DEFINE_FUNCTION fnSubscribeChannel(DEV vdvDevice,                         //  virtual device controlling registered BSS Audio Device
  _SubscribeChannelStruct _struct)
  {
    /*|-----------------------------------------------------------------------------|
    | fnSubscribeChannel: Subscribe to object parameter with feedback on channel  |
    |     Parameters:                                                             |
    |         vdvDevice virtual device of registered BSS Audio Device             |
    |         _SubscribeChannelStruct                                             |
    |              sObjectID Format n.n.n                                         |
    |              sObjectType See documentation for listing of Object Types      |
    |              sParameterID Parameter id in 0xhex format                      |
    |              nFBControlPort Virtual device's port to control item           |
    |              nFBControlChannel Virtual device's channel to control item     |
    |     RETURNs: Nothing                                                        |
    |-----------------------------------------------------------------------------|*/

    STACK_VAR CHAR sXML[DUET_MAX_CMD_LEN]
    STACK_VAR SLONG slResult

    slResult                            =	VARIABLE_TO_XML(_struct, sXML, 1,0)

    IF(slResult == 0)
    {
      _fnSendXMLCommand(vdvDevice, CMD_SUB_CHN,sXML)
    }
    ELSE
    {
      _fnReportParseError(slResult, 'fnSubscribeChannel')
    }
  }

  DEFINE_FUNCTION fnSubscribeChannelEx(DEV vdvDevice,                       //  virtual device controlling registered BSS Audio Device
  CHAR        sObjectID[8],                                               //  format n.n.n
  CHAR        sObjectType[4],                                             //  see documentation for listing of Object Types
  CHAR        sParameterID[6],                                            //  parameter id in 0xhex format
  INTEGER     nFBControlPort,                                             //  virtual device's port to control item
  INTEGER     nFBControlChannel)                                          //  virtual device's channel to control item
  {
    /*|-----------------------------------------------------------------------------|
    | fnSubscribeChannelEx: Subscribe channel                                     |
    |     Parameters:                                                             |
    |         vdvDevice virtual device of registered BSS Audio Device             |
    |         sObjectID Format n.n.n                                              |
    |         sObjectType See documentation for listing of Object Types           |
    |         sParameterID Parameter id in 0xhex format                           |
    |         nFBControlPort Virtual device's port to control item                |
    |         nFBControlChannel Virtual device's channel to control item          |
    |     RETURNs: Nothing                                                        |
    |-----------------------------------------------------------------------------|*/

    STACK_VAR _SubscribeChannelStruct _struct

    _struct.sObjectID                   =	sObjectID
    _struct.sObjectType                 =	sObjectType
    _struct.sParameterID                =	sParameterID
    _struct.nFBControlPort              =	nFBControlPort
    _struct.nFBControlChannel           =	nFBControlChannel

    fnSubscribeChannel(vdvDevice, _struct)
  }

  DEFINE_FUNCTION fnSubscribeCommand(DEV vdvDevice,                         //  virtual device controlling registered BSS Audio Device
  _SubscribeCommandStruct _struct)
  {
    /*|-----------------------------------------------------------------------------|

    | fnSubscribeCOMMAND: Subscribe to object parameter with feedback using       |
    |       command                                                               |
    |     Parameters:                                                             |
    |         vdvDevice virtual device of registered BSS Audio Device             |
    |         _SubscribeCommandStruct                                             |
    |              sObjectID Format n.n.n                                         |
    |              sObjectType See documentation for listing of Object Types      |
    |              sParameterID Parameter id in 0xhex format                      |
    |              nFBControlPort Virtual device's port to control item           |
    |              sCommandPrefix Command prefix                                  |
    |     RETURNs: Nothing                                                        |
    |-----------------------------------------------------------------------------|*/

    STACK_VAR CHAR sXML[DUET_MAX_CMD_LEN]
    STACK_VAR SLONG slResult

    slResult                            =	VARIABLE_TO_XML(_struct, sXML, 1,0)

    IF(slResult == 0)
    {
      _fnSendXMLCommand(vdvDevice, CMD_SUB_CMD,sXML)
    }
    ELSE
    {
      _fnReportParseError(slResult, 'fnSubscribeCommand')
    }
  }

  DEFINE_FUNCTION fnSubscribeCommandEx(DEV vdvDevice,                       //  virtual device controlling registered BSS Audio Device
  CHAR        sObjectID[8],                                               //  format n.n.n
  CHAR        sObjectType[4],                                             //  see documentation for listing of Object Types
  CHAR        sParameterID[6],                                            //  parameter id in 0xhex format
  INTEGER     nFBControlPort,                                             //  virtual device's port to control item
  CHAR        sCommandPrefix[DUET_MAX_PARAM_LEN])                         //  command prefix
  {
    /*|-----------------------------------------------------------------------------|
    | fnSubscribeCommandEx: Subscribe command                                     |
    |     Parameters:                                                             |
    |         vdvDevice virtual device of registered BSS Audio Device             |
    |         sObjectID Format n.n.n                                              |
    |         sObjectType See documentation for listing of Object Types           |
    |         sParameterID Parameter id in 0xhex format                           |
    |         nFBControlPort Virtual device's port to control item                |
    |         sCommandPrefix Command prefix                                       |
    |     RETURNs: Nothing                                                        |
    |-----------------------------------------------------------------------------|*/

    STACK_VAR _SubscribeCommandStruct _struct

    _struct.sObjectID                   =	sObjectID
    _struct.sObjectType                 =	sObjectType
    _struct.sParameterID                =	sParameterID
    _struct.nFBControlPort              =	nFBControlPort
    _struct.sCommandPrefix              =	sCommandPrefix

    fnSubscribeCommand(vdvDevice, _struct)
  }

  DEFINE_FUNCTION fnSubscribeCommandPercent(DEV vdvDevice,                  //  virtual device controlling registered BSS Audio Device
  _SubscribeCommandStruct _struct)
  {
    /*|-----------------------------------------------------------------------------|
    | fnSubscribeCommandPercent: Subscribe for percentage feedback using command  |
    |     Parameters:                                                             |
    |         vdvDevice virtual device of registered BSS Audio Device             |
    |         _SubscribeCommandStruct                                             |
    |              sObjectID Format n.n.n                                         |
    |              sObjectType See documentation for listing of Object Types      |
    |              sParameterID Parameter id in 0xhex format                      |
    |              nFBControlPort Virtual device's port to control item           |
    |              sCommandPrefix Command prefix                                  |
    |     RETURNs: Nothing                                                        |
    |-----------------------------------------------------------------------------|*/

    STACK_VAR CHAR sXML[DUET_MAX_CMD_LEN]
    STACK_VAR SLONG slResult

    slResult                            =	VARIABLE_TO_XML(_struct, sXML, 1,0)

    IF(slResult == 0)
    {
      _fnSendXMLCommand(vdvDevice, CMD_SUB_CMD_PERCENT,sXML)
    }
    ELSE
    {
      _fnReportParseError(slResult, 'fnSubscribeCommandPercent')
    }
  }

  DEFINE_FUNCTION fnSubscribeCommandPercentEx(DEV vdvDevice,                //  virtual device controlling registered BSS Audio Device
  CHAR        sObjectID[8],                                               //  format n.n.n
  CHAR        sObjectType[4],                                             //  see documentation for listing of Object Types
  CHAR        sParameterID[6],                                            //  parameter id in 0xhex format
  INTEGER     nFBControlPort,                                             //  virtual device's port to control item
  CHAR        sCommandPrefix[DUET_MAX_PARAM_LEN])                         //  command prefix
  {
    /*|-----------------------------------------------------------------------------|
    | fnSubscribeCommandPercentEx: Subscribe for percentage feedback using        |
    |       command                                                               |
    |     Parameters:                                                             |
    |         vdvDevice virtual device of registered BSS Audio Device             |
    |         sObjectID Format n.n.n                                              |
    |         sObjectType See documentation for listing of Object Types           |
    |         sParameterID Parameter id in 0xhex format                           |
    |         nFBControlPort Virtual device's port to control item                |
    |         sCommandPrefix Command prefix                                       |
    |     RETURNs: Nothing                                                        |
    |-----------------------------------------------------------------------------|*/

    STACK_VAR _SubscribeCommandStruct _struct

    _struct.sObjectID                   =	sObjectID
    _struct.sObjectType                 =	sObjectType
    _struct.sParameterID                =	sParameterID
    _struct.nFBControlPort              =	nFBControlPort
    _struct.sCommandPrefix              =	sCommandPrefix

    fnSubscribeCommand(vdvDevice, _struct)
  }

  DEFINE_FUNCTION fnSubscribeLevel(DEV vdvDevice,                           //  virtual device controlling registered BSS Audio Device
  _SubscribeLevelStruct _struct)
  {
    /*|-----------------------------------------------------------------------------|
    | fnSubscribeLevel: Subscribe for value feedback on level. Feedback range of  |
    |       0.00 - 255.00                                                         |
    |     Parameters:                                                             |
    |         vdvDevice virtual device of registered BSS Audio Device             |
    |         _SubscribeLevelStruct                                               |
    |              sObjectID Format n.n.n                                         |
    |              sObjectType See documentation for listing of Object Types      |
    |              sParameterID Parameter id in 0xhex format                      |
    |              nFBControlPort Virtual device's port to control item           |
    |              nFBControlLevel Virtual device's level to control item         |
    |     RETURNs: Nothing                                                        |
    |-----------------------------------------------------------------------------|*/

    STACK_VAR CHAR sXML[DUET_MAX_CMD_LEN]
    STACK_VAR SLONG slResult

    slResult                            =	VARIABLE_TO_XML(_struct, sXML, 1,0)

    IF(slResult == 0)
    {
      _fnSendXMLCommand(vdvDevice, CMD_SUB_LEV,sXML)
    }
    ELSE
    {
      _fnReportParseError(slResult, 'fnSubscribeLevel')
    }
  }

  DEFINE_FUNCTION fnSubscribeLevelEx(DEV vdvDevice,                         //  virtual device controlling registered BSS Audio Device
  CHAR        sObjectID[8],                                               //  format n.n.n
  CHAR        sObjectType[4],                                             //  see documentationllisting of Object Types
  CHAR        sParameterID[6],                                            //  parameter id in 0xhex format
  INTEGER     nFBControlPort,                                             //  virtual device's port to control item
  INTEGER     nFBControlLevel)                                            //  virtual device's level to control item
  {
    /*|-----------------------------------------------------------------------------|
    | fnSubscribeLevelEx: Subscribe level                                         |
    |     Parameters:                                                             |
    |         vdvDevice virtual device of registered BSS Audio Device             |
    |         sObjectID Format n.n.n                                              |
    |         sObjectType See documentation for listing of Object Types           |
    |         sParameterID Parameter id in 0xhex format                           |
    |         nFBControlPort Virtual device's port to control item                |
    |         nFBControlLevel Virtual device's level to control item              |
    |     RETURNs: Nothing                                                        |
    |-----------------------------------------------------------------------------|*/

    STACK_VAR _SubscribeLevelStruct _struct

    _struct.sObjectID                   =	sObjectID
    _struct.sObjectType                 =	sObjectType
    _struct.sParameterID                =	sParameterID
    _struct.nFBControlPort              =	nFBControlPort
    _struct.nFBControlLevel             =	nFBControlLevel

    fnSubscribeLevel(vdvDevice, _struct)
  }

  DEFINE_FUNCTION fnSubscribeLevelPercent(DEV vdvDevice,                    //  virtual device controlling registered BSS Audio Device
  _SubscribeLevelStruct _struct)
  {
    /*|-----------------------------------------------------------------------------|
    | fnSubscribeLevelPercent: Subscribe for value feedback on level. Feedback    |
    |       range of 0.00 - 100.00                                                |
    |     Parameters:                                                             |
    |         vdvDevice virtual device of registered BSS Audio Device             |
    |         _SubscribeLevelStruct                                               |
    |              sObjectID Format n.n.n                                         |
    |              sObjectType See documentation for listing of Object Types      |
    |              sParameterID Parameter id in 0xhex format                      |
    |              nFBControlPort Virtual device's port to control item           |
    |              nFBControlLevel Virtual device's level to control item         |
    |     RETURNs: Nothing                                                        |
    |-----------------------------------------------------------------------------|*/

    STACK_VAR CHAR sXML[DUET_MAX_CMD_LEN]
    STACK_VAR SLONG slResult

    slResult                            =	VARIABLE_TO_XML(_struct, sXML, 1,0)

    IF(slResult == 0)
    {
      _fnSendXMLCommand(vdvDevice, CMD_SUB_LEV_PERCENT,sXML)
    }
    ELSE
    {
      _fnReportParseError(slResult, 'fnSubscribeLevelPercent')
    }
  }

  DEFINE_FUNCTION fnSubscribeLevelPercentEx(DEV vdvDevice,                  //  virtual device controlling registered BSS Audio Device
  CHAR        sObjectID[8],                                               //  format n.n.n
  CHAR        sObjectType[4],                                             //  see documentationllisting of Object Types
  CHAR        sParameterID[6],                                            //  parameter id in 0xhex format
  INTEGER     nFBControlPort,                                             //  virtual device's port to control item
  INTEGER     nFBControlLevel)                                            //  virtual device's level to control item
  {
    /*|-----------------------------------------------------------------------------|
    | fnSubscribeLevelPercentEx: Subscribe for value feedback on level. Feedback  |
    |       range of 0.00 - 100.00                                                |
    |     Parameters:                                                             |
    |         vdvDevice virtual device of registered BSS Audio Device             |
    |         sObjectID Format n.n.n                                              |
    |         sObjectType See documentation for listing of Object Types           |
    |         sParameterID Parameter id in 0xhex format                           |
    |         nFBControlPort Virtual device's port to control item                |
    |         nFBControlLevel Virtual device's level to control item              |
    |     RETURNs: Nothing                                                        |
    |-----------------------------------------------------------------------------|*/

    STACK_VAR _SubscribeLevelStruct _struct

    _struct.sObjectID                   =	sObjectID
    _struct.sObjectType                 =	sObjectType
    _struct.sParameterID                =	sParameterID
    _struct.nFBControlPort              =	nFBControlPort
    _struct.nFBControlLevel             =	nFBControlLevel

    fnSubscribeLevelPercent(vdvDevice, _struct)
  }

  DEFINE_FUNCTION fnSubscribeLevelRange(DEV vdvDevice,                      //  virtual device controlling registered BSS Audio Device
  _SubscribeLevelStruct _struct)
  {
    /*|-----------------------------------------------------------------------------|

    | fnSubscribeLevelRange: Subscribe for value feedback on level user specified |
    |       range                                                                 |
    |     Parameters:                                                             |
    |         vdvDevice virtual device of registered BSS Audio Device             |
    |         _SubscribeLevelStruct                                               |
    |              sObjectID Format n.n.n                                         |
    |              sObjectType See documentation for listing of Object Types      |
    |              sParameterID Parameter id in 0xhex format                      |
    |              nFBControlPort Virtual device's port to control item           |
    |              nFBControlLevel Virtual device's level to control item         |
    |              nRangeMinimum Level range minimum                              |
    |              nRangeMaximum Level range maximum                              |
    |     RETURNs: Nothing                                                        |
    |-----------------------------------------------------------------------------|*/

    STACK_VAR CHAR sXML[DUET_MAX_CMD_LEN]
    STACK_VAR SLONG slResult

    slResult                            =	VARIABLE_TO_XML(_struct, sXML, 1,0)

    IF(slResult == 0)
    {
      _fnSendXMLCommand(vdvDevice, CMD_SUB_LEV_RANGE,sXML)
    }
    ELSE
    {
      _fnReportParseError(slResult, 'fnSubscribeLevelRange')
    }
  }

  DEFINE_FUNCTION fnSubscribeLevelRangeEx(DEV vdvDevice,                    //  virtual device controlling registered BSS Audio Device
  CHAR        sObjectID[8],                                               //  format n.n.n
  CHAR        sObjectType[4],                                             //  see documentation for listing of Object Types
  CHAR        sParameterID[6],                                            //  parameter id in 0xhex format
  INTEGER     nFBControlPort,                                             //  virtual device's port to control item
  INTEGER     nFBControlLevel,                                            //  virtual device's level to control item
  SINTEGER    nRangeMinimum,                                              //  level range minumum
  SINTEGER    nRangeMaximum)                                              //  level range maximum)
  {
    /*|-----------------------------------------------------------------------------|
    | fnSubscribeLevelRangeEx: Subscribe level with range                         |
    |     Parameters:                                                             |
    |         vdvDevice virtual device of registered BSS Audio Device             |
    |         sObjectID Format n.n.n                                              |
    |         sObjectType See documentation for listing of Object Types           |
    |         sParameterID Parameter id in 0xhex format                           |
    |         nFBControlPort Virtual device's port to control item                |
    |         nFBControlLevel Virtual device's level to control item              |
    |         nRangeMinimum Level range minimum                                   |
    |         nRangeMaximum Level range maximum                                   |
    |     RETURNs: Nothing                                                        |
    |-----------------------------------------------------------------------------|*/

    STACK_VAR _SubscribeLevelStruct _struct

    _struct.sObjectID                   =	sObjectID
    _struct.sObjectType                 =	sObjectType
    _struct.sParameterID                =	sParameterID
    _struct.nFBControlPort              =	nFBControlPort
    _struct.nFBControlLevel             =	nFBControlLevel
    _struct.nRangeMinimum               =	nRangeMinimum
    _struct.nRangeMaximum               =	nRangeMaximum

    fnSubscribeLevelRange(vdvDevice, _struct)
  }

  DEFINE_FUNCTION fnUnsubscribe(DEV vdvDevice,                              //  virtual device controlling registered BSS Audio Device
  _UnSubscribeStruct _struct)
  {
    /*|-----------------------------------------------------------------------------|
    | fnUnsubscribe: Unsubscribe from object parameter                            |
    |     Parameters:                                                             |
    |         vdvDevice virtual device of registered BSS Audio Device             |
    |         _UnSubscribeStruct                                                  |
    |              sObjectID Format n.n.n                                         |
    |              sParameterID Parameter id in 0xhex format                      |
    |     RETURNs: Nothing                                                        |
    |-----------------------------------------------------------------------------|*/

    STACK_VAR CHAR sXML[DUET_MAX_CMD_LEN]
    STACK_VAR SLONG slResult

    slResult                            =	VARIABLE_TO_XML(_struct, sXML, 1,0)

    IF(slResult == 0)
    {
      _fnSendXMLCommand(vdvDevice, CMD_UNSUB,sXML)
    }
    ELSE
    {
      _fnReportParseError(slResult, 'fnUnsubscribe')
    }
  }

  DEFINE_FUNCTION fnUnsubscribeEx(DEV vdvDevice,                            //  virtual device controlling registered BSS Audio Device
  CHAR      sObjectID[8],                                                 //  format n.n.n
  CHAR      sParameterID[6])                                              //  parameter id in 0xhex format
  {
    /*|-----------------------------------------------------------------------------|
    | fnUnsubscribe: Unsubscribe from object parameter                            |
    |     Parameters:                                                             |
    |         vdvDevice virtual device of registered BSS Audio Device             |
    |         sObjectID Format n.n.n                                              |
    |         sParameterID Parameter id in 0xhex format                           |
    |     RETURNs: Nothing                                                        |
    |-----------------------------------------------------------------------------|*/

    STACK_VAR _UnSubscribeStruct _struct

    _struct.sObjectID                   =	sObjectID
    _struct.sParameterID                =	sParameterID

    fnUnsubscribe(vdvDevice, _struct)
  }

  DEFINE_FUNCTION fnUpdateCommand(DEV vdvDevice,                            //  virtual device controlling registered BSS Audio Device
  _UpdateCommandValueStruct _struct)
  {
    /*|-----------------------------------------------------------------------------|
			| fnUpdateCOMMAND: Update device object subscribed to using command           |
			|     Parameters:                                                             |
			|         vdvDevice virtual device of registered BSS Audio Device             |
			|         _UpdateCommandValueStruct                                           |
			|              sCommandPrefix Command prefix                                  |
			|              sValue Update to value                                         |
			|     RETURNs: Nothing                                                        |
			|-----------------------------------------------------------------------------|*/
    STACK_VAR CHAR sXML[DUET_MAX_CMD_LEN]
    STACK_VAR SLONG slResult

    slResult                            =	VARIABLE_TO_XML(_struct, sXML, 1,0)

    IF(slResult == 0)
    {
      _fnSendXMLCommand(vdvDevice, _struct.sCommandPrefix,sXML)
    }
    ELSE
    {
      _fnReportParseError(slResult, 'fnUpdateCommand')
    }
  }

  DEFINE_FUNCTION fnUpdateCommandEx(DEV vdvDevice,                          //  virtual device controlling registered BSS Audio Device
  CHAR      sCommandPrefix[DUET_MAX_PARAM_LEN],                           //  command prefix
  CHAR      sValue[DUET_MAX_PARAM_LEN])                                   //  update to value
  {
    /*|-----------------------------------------------------------------------------|
    | fnUpdateCommandEx: Update device object subscribed via command              |
    |     Parameters:                                                             |
    |         vdvDevice virtual device of registered BSS Audio Device             |
    |         sCommandPrefix Command prefix                                       |
    |         sValue Update to value                                              |
    |     RETURNs: Nothing                                                        |
    |-----------------------------------------------------------------------------|*/

    STACK_VAR _UpdateCommandValueStruct _struct

    _struct.sCommandPrefix              =	sCommandPrefix
    _struct.sValue                      =	sValue

    fnUpdateCommand(vdvDevice, _struct)
  }

  DEFINE_FUNCTION _fnLog(CHAR cLogString[])
  {
    /*|-----------------------------------------------------------------------------|
    | _fnLog: Writes log to disk                                                  |
    |     Parameters: None                                                        |
    |     RETURNs: Nothing                                                        |
    |-----------------------------------------------------------------------------|*/

    STACK_VAR SLONG slFileHandle                                            // Stores the tag that represents the file (or and error code)

    IF(!fnDebugIsLevelDebug())   RETURN

    IF(nFirstTime)
    {
      FILE_DELETE(LOGFILE_NAME)
      nFirstTime                        =	FALSE
    }

    slFileHandle                        =	FILE_OPEN(LOGFILE_NAME,FILE_RW_APPEND)          // Open old file (or create new one)

    IF(slFileHandle>0)                                                     // A positive number is RETURNed if successful
    {
      FILE_WRITE_LINE(slFileHandle,cLogString,LENGTH_ARRAY(cLogString))    // Write the new info
      FILE_CLOSE(slFileHandle)                                              // Close the log file
    }
  }

  DEFINE_FUNCTION _fnReportParseError(SLONG slResult,
  CHAR      sfnName[])
  {

    IF(slResult == 3)
    {
      fnIOPrintln("sfnName,': XML decode data type mismatch'")
    }

    ELSE IF(slResult ==  2)
    {
      fnIOPrintln("sfnName,': XML decode data too small, more members in structure'")
    }

    ELSE IF(slResult ==  1)
    {
      fnIOPrintln("sfnName,': XML decode data too small, more members in structure'")
    }

    ELSE IF(slResult ==  -1)
    {
      fnIOPrintln("sfnName,': decode variable type mismatch'")
    }

    ELSE IF(slResult ==  -2 )
    {
      fnIOPrintln("sfnName,': decode data too small, decoder ran out of data. Most likely poorly formed XML.'")
    }

    ELSE IF(slResult ==  -3)
    {
      fnIOPrintln("sfnName,': output CHARacter buffer was too small'")
    }
  }

  DEFINE_FUNCTION _fnSendCommand(DEV vdvDevice,                             //  virtual device controlling registered BSS Audio Device
  CHAR      sCommand[DUET_MAX_CMD_LEN])
  {
    /*|-----------------------------------------------------------------------------|

    | _fnSendCOMMAND: Send Command Helper Function                                |
    |     Parameters:                                                             |
    |         vdvDevice virtual device of registered BSS Audio Device             |
    |     RETURNs: Nothing                                                        |
    |-----------------------------------------------------------------------------|*/

    _fnLog("'SEND_COMMAND ',DPSTOA(vdvDevice),',',sCommand")
    SEND_COMMAND vdvDevice,sCommand
  }

  DEFINE_FUNCTION _fnSendXMLCommand(DEV vdvDevice,                          //  virtual device controlling registered BSS Audio Device
  CHAR      sHeader[DUET_MAX_HDR_LEN],
  CHAR      sCommand[DUET_MAX_CMD_LEN])
  {
    /*|-----------------------------------------------------------------------------|

    | _fnSendXMLCOMMAND: Send Command Helper Function                             |
    |     Parameters:                                                             |
    |         vdvDevice virtual device of registered BSS Audio Device             |
    |         sHeader                                                             |
    |         sCommand                                                            |
    |     RETURNs: Nothing                                                        |
    |-----------------------------------------------------------------------------|*/

    _fnSendCommand( vdvDevice,"sHeader,'-',sCommand")
  }

  #END_IF  // __HARMAN_PRO_COMMANDS__

  (*****************************************************************)
  (*                       END OF PROGRAM                          *)
  (*                                                               *)
  (*         !!!  DO NOT PUT ANY CODE BELOW THIS COMMENT  !!!      *)
  (*                                                               *)
  (*****************************************************************)

