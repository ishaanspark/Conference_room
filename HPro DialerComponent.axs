MODULE_NAME='HPro DialerComponent' (DEV vdvDev, DEV dvTP[], DEVCHAN dcBarBtn)
(***********************************************************)
(*  FILE_LAST_MODIFIED_ON: 03/07/2018  AT: 09:47:04        *)
(***********************************************************)

INCLUDE 'Harman Pro Commands'
INCLUDE 'Helper Libraries'
INCLUDE 'MainLine TimeLine'

DEFINE_CONSTANT

  CH_DIALER_OFF_HOOK                    =	202
  CH_DIALER_INCOMMING_CALL              =	257
  CH_DIALER_LINE_STATUS                 =	258

  SPD_EDIT_NAME_TXT                     =	10
  SPD_EDIT_NUMBER_TXT                   =	20

  BTN_SPD_EDIT_NAME                     =	11
  BTN_SPD_EDIT_NUMBER                   =	21

  BTN_SPD_CLEAR_NAME                    =	12
  BTN_SPD_CLEAR_NUMBER                  =	22

  CH_DIALER_SPD_NAME_BASE               =	600
  CH_DIALER_SPD_NUMBER_BASE             =	700
  CH_DIALER_SPD_RECALL_BASE             =	800
  DIALER_SPD_COUNT                      =	50

  CH_DIALER_ANSWER_CALL                 =	4

  BUMP_VOL_BY_PERCENT_UP                =	10.0
  BUMP_VOL_BY_PERCENT_DOWN              =	-10.0

  BTN_AUTO_ANSWER_BOGUS                 =	3175
  BTN_AUTO_ANSWER_IMMEDIATE             =	3176
  BTN_AUTO_ANSWER_1_RING                =	3177
  BTN_AUTO_ANSWER_2_RING                =	3178
  BTN_AUTO_ANSWER_3_RING                =	3179
  BTN_AUTO_ANSWER_4_RING                =	3180
  BTN_AUTO_ANSWER_5_RING                =	3181
  BTN_AUTO_ANSWER_6_RING                =	3182
  BTN_AUTO_ANSWER_7_RING                =	3183
  BTN_AUTO_ANSWER_8_RING                =	3184
  BTN_AUTO_ANSWER_9_RING                =	3185
  BTN_AUTO_ANSWER_10_RING               =	3186

  BTN_DELETE                            =	3171
  BTN_BACKSPACE                         =	3172
  BTN_INCOMMING_CALL                    =	3174

  BTN_BAR_VOIP_LINE_1                   =	3180
  BTN_BAR_VOIP_LINE_2                   =	3181

  CHAR PPP_VOIP_LINE_1[][30]            =
  {
    {'VoIP Line 1'},
    {'VoIP Line 1 Bar'},
    {'VoIP Line 1 SpeedDial'}
  }

  CHAR PPP_VOIP_LINE_2[][30]            =
  {
    {'VoIP Line 2'},
    {'VoIP Line 2 Bar'},
    {'VoIP Line 2 SpeedDial'}
  }

  KPAD_DIGIT_0                          =	3150
  KPAD_DIGIT_1                          =	3151
  KPAD_DIGIT_2                          =	3152
  KPAD_DIGIT_3                          =	3153
  KPAD_DIGIT_4                          =	3154
  KPAD_DIGIT_5                          =	3155
  KPAD_DIGIT_6                          =	3156
  KPAD_DIGIT_7                          =	3157
  KPAD_DIGIT_8                          =	3158
  KPAD_DIGIT_9                          =	3159
  KPAD_DIGIT_ASTERISK                   =	3160
  KPAD_DIGIT_POUND                      =	3161
  KPAD_DIGIT_COMMA                      =	3162
  KPAD_DIGIT_PLUS                       =	3163

  TXT_NUMBER_TO_DIAL                    =	3170  // Text: Display Number to Dial

  LINE_STATUS                           =	3173	// Line status

  INTEGER BTN_DIALER_NUMPAD_LIST[]      =				// Button: Dialing NumPad (0-9,*,#,CLEAR,Pause)
  {
    KPAD_DIGIT_0,
    KPAD_DIGIT_1,
    KPAD_DIGIT_2,
    KPAD_DIGIT_3,
    KPAD_DIGIT_4,
    KPAD_DIGIT_5,
    KPAD_DIGIT_6,
    KPAD_DIGIT_7,
    KPAD_DIGIT_8,
    KPAD_DIGIT_9,
    KPAD_DIGIT_ASTERISK,
    KPAD_DIGIT_POUND,
    KPAD_DIGIT_COMMA,
    KPAD_DIGIT_PLUS
  }

  CHAR VAL_DIALER_NUMPAD_LIST[][1]      =				// Button: Dialing NumPad (0-9,*,#,CLEAR,Pause)
  {
    {'0'},
    {'1'},
    {'2'},
    {'3'},
    {'4'},
    {'5'},
    {'6'},
    {'7'},
    {'8'},
    {'9'},
    {'*'},
    {'#'},
    {','},
    {'+'}
  }

  CHAR VAL_DTMF_DIALER_NUMPAD_LIST[][1] =				// Button: Dialing NumPad (0-9,*,#,CLEAR,Pause)
  {
    {'0'},
    {'1'},
    {'2'},
    {'3'},
    {'4'},
    {'5'},
    {'6'},
    {'7'},
    {'8'},
    {'9'},
    {'*'},
    {'#'}
  }
  INTEGER CH_LIST[]                     =
  {
    MENU_HOLD,
    CH_DIALER_OFF_HOOK,
    DIAL_REDIAL,
    MENU_REJECT,
    CH_DIALER_INCOMMING_CALL,
    CH_DIALER_LINE_STATUS,
    DIAL_AUTO_ANSWER_ON,
    DIAL_AUDIBLE_RING_ON,
    ACONF_PRIVACY_ON
  }

  CHAR BTN_AUTO_ANSWER_RING_LIST[][1]   =
  {
    {'0'},
    {'0'},
    {'1'},
    {'2'},
    {'3'}
  }

  INTEGER BTN_AUTO_ANSWER_LIST[]        =
  {
    BTN_AUTO_ANSWER_BOGUS,
    BTN_AUTO_ANSWER_IMMEDIATE,
    BTN_AUTO_ANSWER_1_RING,
    BTN_AUTO_ANSWER_2_RING,
    BTN_AUTO_ANSWER_3_RING,
    BTN_AUTO_ANSWER_4_RING,
    BTN_AUTO_ANSWER_5_RING,
    BTN_AUTO_ANSWER_6_RING,
    BTN_AUTO_ANSWER_7_RING,
    BTN_AUTO_ANSWER_8_RING,
    BTN_AUTO_ANSWER_9_RING,
    BTN_AUTO_ANSWER_10_RING
  }

  INTEGER BTN_SPD_STORE_LIST[]          =
  {
    501, 502, 503, 504, 505, 506, 507, 508, 509, 510,
    511, 512, 513, 514, 515, 516, 517, 518, 519, 520,
    521, 522, 523, 524, 525, 526, 527, 528, 529, 530,
    531, 532, 533, 534, 535, 536, 537, 538, 539, 540,
    541, 542, 543, 544, 545, 546, 547, 548, 549, 550
  }

  INTEGER BTN_SPD_NAME_LIST[]           =
  {
    601, 602, 603, 604, 605, 606, 607, 608, 609, 610,
    611, 612, 613, 614, 615, 616, 617, 618, 619, 620,
    621, 622, 623, 624, 625, 626, 627, 628, 629, 630,
    631, 632, 633, 634, 635, 636, 637, 638, 639, 640,
    641, 642, 643, 644, 645, 646, 647, 648, 649, 650
  }

  INTEGER BTN_SPD_NUMBER_LIST[]         =
  {
    701, 702, 703, 704, 705, 706, 707, 708, 709, 710,
    711, 712, 713, 714, 715, 716, 717, 718, 719, 720,
    721, 722, 723, 724, 725, 726, 727, 728, 729, 730,
    731, 732, 733, 734, 735, 736, 737, 738, 739, 740,
    741, 742, 743, 744, 745, 746, 747, 748, 749, 750
  }

  INTEGER BTN_SPD_RECALL_LIST[]         =
  {
    801, 802, 803, 804, 805, 806, 807, 808, 809, 810,
    811, 812, 813, 814, 815, 816, 817, 818, 819, 820,
    821, 822, 823, 824, 825, 826, 827, 828, 829, 830,
    831, 832, 833, 834, 835, 836, 837, 838, 839, 840,
    841, 842, 843, 844, 845, 846, 847, 848, 849, 850
  }

  INTEGER BTN_ACTION_LIST[]             =
  {
    VOL_UP,
    VOL_DN,
    MENU_REJECT,
    MENU_HOLD,
    ACONF_PRIVACY_ON,
    DIAL_REDIAL,
    DIAL_AUTO_ANSWER_ON,
    DIAL_AUDIBLE_RING_ON,
    BTN_DELETE,
    BTN_BACKSPACE,
    DIAL_OFF_HOOK_ON,
    CH_DIALER_ANSWER_CALL,
    DIAL_FLASH_HOOK
  }

DEFINE_VARIABLE

  VOLATILE INTEGER bLineStatus          =	FALSE
  VOLATILE INTEGER bIncommingCall       =	FALSE
  VOLATILE INTEGER bAudibleRing         =	FALSE
  VOLATILE INTEGER bAutoAnswer          =	FALSE
  VOLATILE INTEGER bOffHook             =	FALSE
  VOLATILE INTEGER bPrivacy             =	FALSE
  VOLATILE INTEGER bOnHold              =	FALSE
  VOLATILE CHAR    sPhoneNumber[50]            	// Current phone number to dial

  CHAR sSPD_EDIT_NAME[50]
  CHAR sSPD_EDIT_NUMBER[50]

  CHAR CMD_LIST[13][50]

  DEV EDIT_INPUT_DEVICE

DEFINE_MUTUALLY_EXCLUSIVE

  ([dvTp,BTN_AUTO_ANSWER_LIST[1]]..[dvTp,BTN_AUTO_ANSWER_LIST[LENGTH_ARRAY(BTN_AUTO_ANSWER_LIST)]])

DEFINE_START

  DEFINE_FUNCTION fnDialerChannelUpdate(INTEGER chan, INTEGER state)
  {
    IF(state)
    {
      OFF[vdvDev, chan]
    }
    ELSE
    {
      ON[vdvDev, chan]
    }
  }

  DEFINE_FUNCTION fnDialerDeviceUpdate(INTEGER chan, INTEGER state)
  {
    SWITCH (chan)
    {
      CASE   MENU_HOLD:
      {
        bOnHold                         =	state
      }

      CASE  CH_DIALER_OFF_HOOK:
      {
        bOffHook                        =	state
      }

      CASE  DIAL_REDIAL:
      {
        // NOP
      }

      CASE  MENU_REJECT:
      {
        // NOP
      }

      CASE  CH_DIALER_INCOMMING_CALL:
      {
        bIncommingCall                  =	state
        IF(state)
        {
          PULSE [dcBarBtn]
        }
      }

      CASE  CH_DIALER_LINE_STATUS:
      {
        bLineStatus                     =	state
      }

      CASE  DIAL_AUTO_ANSWER_ON:
      {
        bAutoAnswer                     =	state
      }

      CASE  DIAL_AUDIBLE_RING_ON:
      {
        bAudibleRing                    =	state
      }

      CASE  ACONF_PRIVACY_ON:
      {
        bPrivacy                        =	state
      }
    }
  }

  DEFINE_FUNCTION fnDialerTPHideButton ( CHAR addressRange[])
  {
    STACK_VAR INTEGER idx

    FOR(idx =1; idx <= LENGTH_ARRAY(dvTP); idx++)
    {
      fnTPHideButton(dvTP[idx],addressRange)
    }
  }

  DEFINE_FUNCTION fnDialerTPShowButton ( CHAR addressRange[])
  {
    STACK_VAR INTEGER idx

    FOR(idx =1; idx <= LENGTH_ARRAY(dvTP); idx++)
    {
      fnTPShowButton(dvTP[idx],addressRange)
    }
  }

  DEFINE_FUNCTION fnDialerTPSetButtonTextAllStates (CHAR addressRange[],
    CHAR text[])
  {
    STACK_VAR INTEGER idx

    FOR(idx =1; idx <= LENGTH_ARRAY(dvTP); idx++)
    {
      fnTPSetButtonTextAllStates(dvTP[idx],addressRange, text)
    }
  }

  DEFINE_FUNCTION fnDialerTPReset ()
  {
    STACK_VAR INTEGER idx

    FOR(idx =1; idx <= LENGTH_ARRAY(dvTP); idx++)
    {
      ON[dvTP[idx],BTN_AUTO_ANSWER_BOGUS]
      OFF[dvTP[idx],BTN_INCOMMING_CALL]
    }
  }

  DEFINE_FUNCTION fnDialerPopPagesShow (CHAR PPP_ARRAY[][30])
  {
    STACK_VAR INTEGER idxTP
    STACK_VAR INTEGER idxPPP

    FOR(idxTP =1; idxTP <= LENGTH_ARRAY(dvTP); idxTP++)
    {

      FOR(idxPPP =1; idxPPP <= LENGTH_ARRAY(PPP_ARRAY); idxPPP++)
      {
        fnTPShowPopup(dvTP[idxTP],PPP_ARRAY[idxPPP])
      }
    }
  }

DEFINE_EVENT

  //---------------------------------------------------------------------------------
  //
	// EVENT TYPE:       DATA_EVENT for vdvDev
  //                   DialerComponent: data event
  //
  // PURPOSE:          This data event is used to listen for SNAPI component
  //                   commands and track feedback for the DialerComponent.
  //
  // LOCAL VARIABLES:  cHeader   :  SNAPI command header
  //                   cParameter:  SNAPI command parameter
  //                   nParameter:  SNAPI command parameter value
  //                   cCmd      :  received SNAPI command
  //
  //---------------------------------------------------------------------------------

	DATA_EVENT[vdvDev]
  {
    COMMAND:
    {
      // local variables
      STACK_VAR CHAR    cCmd[DUET_MAX_CMD_LEN]
      STACK_VAR CHAR    cHeader[DUET_MAX_HDR_LEN]
      STACK_VAR CHAR    cParameter[DUET_MAX_PARAM_LEN]
      STACK_VAR INTEGER nParameter
      STACK_VAR CHAR    cTrash[20]
      STACK_VAR INTEGER nSPDIdx

      // get received SNAPI command
      cCmd                              =	DATA.TEXT

      // parse command header
      cHeader                           =	DuetParseCmdHeader(cCmd)

      SWITCH (cHeader)
      {
        CASE CMD_DIALER_HOLD:
        {
          IF(bOffHook)
          {
            cParameter                  =	DuetParseCmdParam(cCmd)
            fnDialerDeviceUpdate(MENU_HOLD, ATOI(cParameter))
          }
          ELSE
          {
            fnDialerDeviceUpdate(MENU_HOLD, FALSE)
          }
        }

        CASE  CMD_DIALER_PRIVACY:
        {
          cParameter                    =	DuetParseCmdParam(cCmd)
          fnDialerDeviceUpdate(ACONF_PRIVACY_ON, ATOI(cParameter))
        }

        CASE  CMD_DIALER_SPD_NAME:
        {
          nSPDIdx                       =	ATOI(DuetParseCmdParam(cCmd))

          fnDialerTPSetButtonTextAllStates(ITOA(CH_DIALER_SPD_NAME_BASE + nSPDIdx),cCmd)
        }

        CASE  CMD_DIALER_SPD_NUMBER:
        {
          nSPDIdx                       =	ATOI(DuetParseCmdParam(cCmd))

          fnDialerTPSetButtonTextAllStates(ITOA(CH_DIALER_SPD_NUMBER_BASE + nSPDIdx),cCmd)
        }

        CASE  CMD_DIALER_AUTO_ANSWER_RING_COUNT:
        {
          cParameter                    =	DuetParseCmdParam(cCmd)

          IF(ATOI(cParameter) >=0 && ATOI(cParameter) <= 10)
          {
            ON[dvTP,BTN_AUTO_ANSWER_IMMEDIATE+ATOI(cParameter)]
          }
          ELSE
          {
            ON[dvTP,BTN_AUTO_ANSWER_BOGUS]
          }
        }

        CASE  CMD_DIALER_PICKUP_HANGUP:
        {
          cParameter                    =	DuetParseCmdParam(cCmd)

          fnDialerDeviceUpdate(CH_DIALER_OFF_HOOK, ATOI(cParameter))
        }

        CASE CMD_DIALER_LAST_NUMBER_DIALED:
        {
          sPhoneNumber                  =	DuetParseCmdParam(cCmd)
          fnDialerTPSetButtonTextAllStates(ITOA(TXT_NUMBER_TO_DIAL),sPhoneNumber)
        }

        DEFAULT:
        {

          IF(LENGTH_ARRAY(cHeader) == 0 ||
						cHeader == CMD_DIALER_REJECT_CALL ||
						cHeader == CMD_DIALER_PICKUP_HANGUP ||
						cHeader == CMD_BUMP_BY_PERCENTAGE)
          {
            // NOP
          }
          ELSE
          {
            fnIOPrintln("'Unknown COMMAND: [',DATA.TEXT,']'")
          }
        }
      }
    }
  }

	CHANNEL_EVENT [vdvDev, CH_LIST]
  {
    ON:
    {
      fnDialerDeviceUpdate(CHANNEL.CHANNEL, TRUE)
    }

    OFF:
    {
      fnDialerDeviceUpdate(CHANNEL.CHANNEL, FALSE)
    }
  }

	BUTTON_EVENT[dvTP, BTN_SPD_RECALL_LIST]
  {
    PUSH:
    {
      fnSpeedDialRecallEx(vdvDev, GET_LAST(BTN_SPD_RECALL_LIST))
    }
  }

	BUTTON_EVENT[dvTP, BTN_SPD_STORE_LIST]
  {
    PUSH:
    {
      fnSpeedDialStoreEx(vdvDev, GET_LAST(BTN_SPD_STORE_LIST), sSPD_EDIT_NAME, sSPD_EDIT_NUMBER)  // numbers only, no -, . ( )

      fnDialerTPSetButtonTextAllStates(ITOA(BTN_SPD_NAME_LIST[GET_LAST(BTN_SPD_STORE_LIST)]),sSPD_EDIT_NAME)
      fnDialerTPSetButtonTextAllStates(ITOA(BTN_SPD_NUMBER_LIST[GET_LAST(BTN_SPD_STORE_LIST)]),sSPD_EDIT_NUMBER)

      sSPD_EDIT_NAME                    =	NULL_STR
      sSPD_EDIT_NUMBER                  =	NULL_STR

      fnDialerTPSetButtonTextAllStates(ITOA(SPD_EDIT_NAME_TXT),sSPD_EDIT_NAME)
      fnDialerTPSetButtonTextAllStates(ITOA(SPD_EDIT_NUMBER_TXT),sSPD_EDIT_NUMBER)
    }
  }

	BUTTON_EVENT[dvTP,BTN_SPD_CLEAR_NAME]
  {
    PUSH:
    {
      sSPD_EDIT_NAME                    =	NULL_STR
      fnDialerTPSetButtonTextAllStates(ITOA(SPD_EDIT_NAME_TXT),sSPD_EDIT_NAME)
    }
  }

	BUTTON_EVENT[dvTP,BTN_SPD_CLEAR_NUMBER]
  {
    PUSH:
    {
      sSPD_EDIT_NUMBER                  =	NULL_STR
      fnDialerTPSetButtonTextAllStates(ITOA(SPD_EDIT_NUMBER_TXT),sSPD_EDIT_NUMBER)
    }
  }

	BUTTON_EVENT[dvTP,BTN_SPD_EDIT_NAME]
  {
    PUSH:
    {
      EDIT_INPUT_DEVICE                 =	BUTTON.INPUT.DEVICE
      SEND_COMMAND dvTP[1].NUMBER:1:0,"'@AKB-;',sSPD_EDIT_NAME"
    }
  }

	BUTTON_EVENT[dvTP,BTN_SPD_EDIT_NUMBER]
  {
    PUSH:
    {
      EDIT_INPUT_DEVICE                 =	BUTTON.INPUT.DEVICE
      SEND_COMMAND dvTP[1].NUMBER:1:0,"'@AKP-;',sSPD_EDIT_NUMBER"
    }
  }

	DATA_EVENT[dvTP]
  {
    ONLINE:
    {
      fnDialerTPSetButtonTextAllStates( ITOA(TXT_NUMBER_TO_DIAL),NULL_STR)

      ON[dvTP,BTN_AUTO_ANSWER_BOGUS]
      OFF[dvTP,BTN_INCOMMING_CALL]

      fnDialerTPSetButtonTextAllStates("ITOA(CH_DIALER_SPD_NAME_BASE),'.',ITOA(CH_DIALER_SPD_NAME_BASE+DIALER_SPD_COUNT)",NULL_STR)
      fnDialerTPSetButtonTextAllStates("ITOA(CH_DIALER_SPD_NUMBER_BASE),'.',ITOA(CH_DIALER_SPD_NUMBER_BASE+DIALER_SPD_COUNT)",NULL_STR)

      sPhoneNumber                      =	NULL_STR
      sSPD_EDIT_NAME                    =	NULL_STR
      sSPD_EDIT_NUMBER                  =	NULL_STR

      fnDialerTPSetButtonTextAllStates(ITOA(TXT_NUMBER_TO_DIAL),sPhoneNumber)
      fnDialerTPSetButtonTextAllStates(ITOA(SPD_EDIT_NAME_TXT),sSPD_EDIT_NAME)
      fnDialerTPSetButtonTextAllStates(ITOA(SPD_EDIT_NUMBER_TXT),sSPD_EDIT_NUMBER)

      bLineStatus                       =	FALSE
      bIncommingCall                    =	FALSE
      bAudibleRing                      =	FALSE
      bAutoAnswer                       =	FALSE
      bOffHook                          =	FALSE
      bPrivacy                          =	FALSE
      bOnHold                           =	FALSE

      SEND_COMMAND vdvDev,"'REFRESH'"
    }
  }

	DATA_EVENT[dvTP[1].NUMBER:1:0]
  {
    STRING:
    {
      // local variables
      STACK_VAR CHAR    cCmd[DUET_MAX_CMD_LEN]
      STACK_VAR CHAR    cHeader[DUET_MAX_HDR_LEN]
      STACK_VAR CHAR    cParameter[DUET_MAX_PARAM_LEN]

      // get received SNAPI command
      cCmd                              =	DATA.TEXT
      cHeader                           =	DuetParseCmdHeader(cCmd)
      cParameter                        =	DuetParseCmdParam(cCmd)

      SWITCH (cHeader)
      {
        CASE 'KEYB':
        {
          sSPD_EDIT_NAME                =	cParameter
          fnDialerTPSetButtonTextAllStates(ITOA(SPD_EDIT_NAME_TXT),sSPD_EDIT_NAME)
        }

        CASE 'KEYP':
        {
          sSPD_EDIT_NUMBER              =	cParameter
          fnDialerTPSetButtonTextAllStates(ITOA(SPD_EDIT_NUMBER_TXT),sSPD_EDIT_NUMBER)
        }
      }
    }
  }

	BUTTON_EVENT[dvTP, BTN_DIALER_NUMPAD_LIST]
  {
    PUSH:
    {
      STACK_VAR INTEGER idx
      idx                               =	GET_LAST(BTN_DIALER_NUMPAD_LIST)

      // Send Directly (DTMF)
      IF(bOffHook)
      {

        IF(idx <= LENGTH_ARRAY(VAL_DTMF_DIALER_NUMPAD_LIST))
        {
          sPhoneNumber                  =	"sPhoneNumber, VAL_DIALER_NUMPAD_LIST[idx]"
          fnUpdateCommandEx(vdvDev, CMD_DIALER_DIAL_DTMF,VAL_DIALER_NUMPAD_LIST[idx])
        }
      }
      ELSE
      {
        sPhoneNumber                    =	"sPhoneNumber, VAL_DIALER_NUMPAD_LIST[idx]"
      }

      fnDialerTPSetButtonTextAllStates( ITOA(TXT_NUMBER_TO_DIAL),sPhoneNumber)

    }
  }

	BUTTON_EVENT[dvTP, BTN_AUTO_ANSWER_LIST]
  {
    PUSH:
    {
      fnUpdateCommandEx(vdvDev,CMD_DIALER_AUTO_ANSWER_RING_COUNT,ITOA(GET_LAST(BTN_AUTO_ANSWER_LIST) -2))
    }
  }

	BUTTON_EVENT[dvTP, BTN_ACTION_LIST]
  {
    PUSH:
    {
      SWITCH (BUTTON.INPUT.CHANNEL)
      {
        CASE VOL_UP:                    // Increment volume
        {
          fnBumpByPercentageEx(vdvDev,NULL_STR,NULL_STR,BUMP_VOL_BY_PERCENT_UP)
        }

        CASE VOL_DN:                    // Decrement volume
        {
          fnBumpByPercentageEx(vdvDev,NULL_STR,NULL_STR,BUMP_VOL_BY_PERCENT_DOWN)
        }

        CASE MENU_REJECT:               // Momentary: Press menu button reject
        {
          IF(bIncommingCall)
          {
            fnUpdateCommandEx(vdvDev, CMD_DIALER_REJECT_CALL,NULL_STR)
          }
        }

        CASE MENU_HOLD:                 // Momentary: Press menu button hold
        {
          IF(bOffHook)
          {
            fnUpdateCommandEx(vdvDev, CMD_DIALER_HOLD,NULL_STR)  // always send TRUE
          }
        }

        CASE ACONF_PRIVACY_ON:          // Discrete:  Set privacy on or off
        {
					fnUpdateCommandEx(vdvDev,CMD_DIALER_PRIVACY,ITOA(!bPrivacy))

        }

        CASE DIAL_AUTO_ANSWER_ON:       // Discrete:  Set auto answer on or off
        {
          fnDialerChannelUpdate( DIAL_AUTO_ANSWER_ON,bAutoAnswer)
        }

        CASE DIAL_AUDIBLE_RING_ON:      // Discrete:  Set the audible ring state on or off
        {
          fnDialerChannelUpdate( DIAL_AUDIBLE_RING_ON,bAudibleRing)
        }

        CASE CH_DIALER_ANSWER_CALL:
        {
          fnUpdateCommandEx(vdvDev, CMD_DIALER_PICKUP_HANGUP,NULL_STR)
        }

        CASE DIAL_OFF_HOOK_ON:          // Button: PickUp/HangUp
        {
          IF(bIncommingCall || bOffHook )
          {
            fnUpdateCommandEx(vdvDev, CMD_DIALER_PICKUP_HANGUP,ITOA(!bOffHook))
          }

          ELSE  IF(LENGTH_ARRAY(sPhoneNumber) > 0)
          {
            fnUpdateCommandEx(vdvDev, CMD_DIALER_DIAL_NUMBER,sPhoneNumber)
          }
        }

        CASE DIAL_REDIAL:
        {
          IF(!bOffHook)
          {
            PULSE[vdvDev,DIAL_REDIAL]
          }
        }

        CASE BTN_DELETE:
        {
          IF(!bOffHook)
          {
            sPhoneNumber                =	NULL_STR
            fnTPSetButtonTextAllStates(BUTTON.INPUT.DEVICE,ITOA(TXT_NUMBER_TO_DIAL),sPhoneNumber)
          }
        }

        CASE BTN_BACKSPACE:
        {
          IF(!bOffHook && LENGTH_ARRAY(sPhoneNumber) > 0)
          {
            SET_LENGTH_ARRAY(sPhoneNumber, LENGTH_ARRAY(sPhoneNumber) -1 )
            fnTPSetButtonTextAllStates(BUTTON.INPUT.DEVICE,ITOA(TXT_NUMBER_TO_DIAL),sPhoneNumber)
          }
        }

        CASE DIAL_FLASH_HOOK:
        {
          PULSE[vdvDev,DIAL_FLASH_HOOK]
        }
      }
    }
  }

	BUTTON_EVENT[dcBarBtn]
  {
    PUSH:
    {
      SWITCH (BUTTON.INPUT.CHANNEL)
      {
        CASE BTN_BAR_VoIP_LINE_1:
        {
          fnDialerPopPagesShow(PPP_VOIP_LINE_1)
        }

        CASE BTN_BAR_VoIP_LINE_2:
        {
          fnDialerPopPagesShow(PPP_VOIP_LINE_2)
        }
      }
    }
  }

  /*|-----------------------------------------------------------------------------|
		| Due to differences in the underlying architecture of the X-Series masters,  |
		|     changing variables in the DEFINE_PROGRAM section of code can negatively |
		|     impact program performance.                                             |
		|                                                                             |
		| TimeLine implementation refer to Differences in DEFINE_PROGRAM Program      |
		|     Execution section of the NX-Series Controllers WebConsole &             |
		|     Programming Guide for additional and alternate coding methodologies.    |
		|-----------------------------------------------------------------------------|*/
	TIMELINE_EVENT[DEFINE_PROGRAM_TIMELINE_ID]
  {
    [dvTP,DIAL_AUDIBLE_RING_ON]         =	bAudibleRing
    [dvTP,DIAL_AUTO_ANSWER_ON]          =	bAutoAnswer
    [dvTP,CH_DIALER_OFF_HOOK]           =	bOffHook
    [dvTP,ACONF_PRIVACY_ON]             =	bPrivacy
    [dvTP,MENU_HOLD]                    =	bOnHold
    [dvTP,LINE_STATUS]                  =	bLineStatus
    [dvTP,BTN_INCOMMING_CALL]           =	bIncommingCall
    [dvTP,MENU_REJECT]                  =	bIncommingCall
  }

  (***********************************************************)
  (*                     END OF PROGRAM                      *)
  (*        DO NOT PUT ANY CODE BELOW THIS COMMENT           *)
  (***********************************************************)
