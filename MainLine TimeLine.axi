PROGRAM_NAME='MainLine TimeLine'

/*|-----------------------------------------------------------------------------|
	|                            Common Implementation                            |
	|                                                                             |
	| Due to differences in the underlying architecture of the X-Series masters,  |
	|     changing variables in the DEFINE_PROGRAM section of code can negatively |
	|     impact program performance.                                             |
	|                                                                             |
	| TimeLine implementation refer to "Differences in DEFINE_PROGRAM Program     |
	|     Execution" section of the NX-Series Controllers WebConsole &            |
	|     Programming Guide for additional and alternate coding methodologies.    |
	|-----------------------------------------------------------------------------|*/

(**
	IMPLEMEMTATION IMPLEMEMTATION IMPLEMEMTATION IMPLEMEMTATION IMPLEMEMTATION

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
	}

**)

  #IF_NOT_DEFINED __MAINLINE_TIMELINE__
  #DEFINE __MAINLINE_TIMELINE__

DEFINE_CONSTANT

  LONG PRG_DEFINE_TIMES[1]              = {500}// process TimeLine every 500ms
	INTEGER DEFINE_PROGRAM_TIMELINE_ID    = 6076// unique TimeLine Id

DEFINE_START

TIMELINE_CREATE(DEFINE_PROGRAM_TIMELINE_ID, PRG_DEFINE_TIMES, 1, TIMELINE_RELATIVE, TIMELINE_REPEAT)

  #END_IF  // __MAINLINE_TIMELINE__

  (*****************************************************************)
  (*                       END OF PROGRAM                          *)
  (*                                                               *)
  (*         !!!  DO NOT PUT ANY CODE BELOW THIS COMMENT  !!!      *)
  (*                                                               *)
  (*****************************************************************)
