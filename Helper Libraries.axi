PROGRAM_NAME='Helper Libraries'

#IF_NOT_DEFINED __HELPER_LIBRARIES__
#DEFINE __HELPER_LIBRARIES__

#INCLUDE 'SNAPI'

DEFINE_DEVICE

  /*|--------------------------------------------------------------------------------------------------|
  |                                      Array Helper Functions                                      |
  |                                                                                                  |
  | fnArrayDeviceIndex: Finds the index for any matching device entry in an array                    |
  | fnArrayDoubleIndex: Finds the index for any matching item in the double array                    |
  | fnArrayInsertionSort: In-place sorting of an INTEGER array using the insertion sort method.      |
  |     Efficient for small data sets. Crude testing on a NI-900 suggests that insertion sort is     |
  |     faster than the non-recursive quicksort for random INTEGER arrays up to a size of about 25   |
  |     elements.                                                                                    |
  | fnArrayINTEGERIndex: Finds the index for any matching INTEGER entry in an array.                 |
  | fnArrayMaxValue: Finds the maximum value in an INTEGER array                                     |
  | fnArrayMaxValueDouble: Finds the maximum value in a DOUBLE array                                 |
  | fnArrayMinValue: Finds the minimum value in an INTEGER array                                     |
  | fnArrayMinValueDouble: Finds the minimum value in a DOUBLE array                                 |

  | fnArrayPartition: In-place partitioning of an INTEGER array.  It partitions the portion of the   |
  |     array between indices left and right inclusive by moving all elements less than              |
  |     list[pivot_index] before the pivot and those equal or greater after it.                      |
  | fnArrayQuickSort: In-place sorting of an INTEGER array using a non-recursive quicksort method.   |
  | fnArrayStringIndex: Finds the index for any matching string entry in an array.                   |
  | fnArraySwap: In-place swap of two elements in an INTEGER array                                   |
  |                                                                                                  |
  |                                    Debugging Helper Functions                                    |
  |                                                                                                  |

  | fnDebugGetLevelSTRING: RETURNs a string representing the currrent debug level.                   |

  | fnDebugLevelSTRING: RETURNs the requested debug level as String.                                 |

  | fnDebugGetLevelFromSTRING: Gets a numerical debug level based on it's equivalent string          |
  |     representation.                                                                              |
  | fnDebugIsLevelDebug: Query if debug level it set to DEBUG                                        |
  | fnDebugIsLevelError: Query if debug level it set to ERROR or greater                             |
  | fnDebugIsLevelInfo: Query if debug level it set to INFO or greater                               |
  | fnDebugIsLevelWarning: Query if debug level it set to WARNING or greater                         |
  | fnDebugSetLevel: Sets the current system debugging level FOR controlling debug message           |
  |     verbosity.                                                                                   |

  | fnDebugSetLevelBySTRING: Sets the current system debugging level FOR controlling debug message   |
  |     verbosity.                                                                                   |
  | fnDebugErrorMessage: Voices a debug message IF required by the current debug level. All system   |
  |     messages should pass through here. If the ability to dump to a file or networked logging     |
  |     service is required it can be added here.                                                    |
  | fnDebugMessage: Voices a debug message IF required by the current debug level. All system        |
  |     messages should pass through here. If the ability to dump to a file or networked logging     |
  |     service is required it can be added here.                                                    |
  | fnDebugHex: Prints a debug message forced to hex - this avoids situations where a hex value is a |
  |     valid ASCII CHARacter                                                                        |
  | fnDebugDecimal: Prints a debug message forced to decimal                                         |
  |                                                                                                  |
  |                                       IO Helper Functions                                        |
  |                                                                                                  |
  | fnIOPrintBanner: Prints banner to the output stream.                                             |
  | fnIOPrint: Print a CHARacter array to the output stream.                                         |
  | fnIOPrintln: Print a line to the output stream.                                                  |
  | fnIOWrite: Write a CHARacter array to the output device.                                         |	
  |                                                                                                  |
  |                                      Math Helper Functions                                       |
  |                                                                                                  |
  | fnMathBase10Logarithm: Calcultate the base 10 logarithm of the passed number.                    |
  | fnMathBinaryLogarithm: Calcultate the binary logarithm of the passed number.                     |
  | fnMathBuildDouble: Build a DOUBLE using the binary info stored across two LONGs. It is assumed   |
  |     that the data is stored as per the IEEE754 standard.                                         |
  | fnMathBuildFloat: Build a FLOAT using a IEEE754 bit pattern stored in a LONG.                    |
  | fnMathCeiling: RETURNs the smallest (closest to negative infinity) LONG value that is not less   |
  |     than the argument and is equal to a mathematical INTEGER.                                    |
  | fnMathDecimalToBinaryCodedDecimal: Encode a decimal value as binary-coded decimal (BCD).         |
  | fnMathDoubleHighToBits: Load the raw data stored in bits 63 - 32 of a DOUBLE into a LONG.        |
  | fnMathDoubleLowToBits: Load the raw data stored in bits 31 - 0 of a DOUBLE into a LONG.          |
  | fnMathFastSqrt: Approximate the square root of the passed number based on the inverse square     |
  |     root algorithm in fnMathInverseSqrt(x). This is MUCH faster than fnMathSquareRoot(x) and     |
  |     recommended over fnMathSquareRoot() FOR use anywhere a precise square root is not required.  |
  |     Error is approx +/-0.17%.                                                                    |
  | fnMathFloatToBits: Load a FLOAT value's IEEE 754 bit pattern into a LONG.                        |
  | fnMathFloor: RETURNs the largest (closest to positive infinity) LONG value that is not greater   |
  |     than the argument and is equal to a mathematical INTEGER.                                    |
  | fnMathInverseSqrt: Approximate the inverse square root of the passed number. This method uses a  |
  |     INTEGER shift and single Newton refinement aka Quake 3 method. Original algorithm by Greg    |
  |     Walsh.                                                                                       |
  | fnMathIsInfinite: Checks if a value is either positive infinity or negative infinity.            |
  | fnMathIsInt: RETURNs TRUE if the argument has no decimal component, otherwise RETURNs FALSE.     |
  |     +/-Inf and 0 will RETURN TRUE, subnormal and NaN's will RETURN FALSE.                        |
  | fnMathIsNaN: Checks if a value is NaN.                                                           |
  | fnMathIsNear: Compares two numbers and RETURN TRUE if they are within MATH_PRECISION of each     |
  |     other.                                                                                       |
  | fnMathIsNumeric: Checks if a string value contains only a numeric value.                         |
  | fnMathLogarithm: Calcultate the logarithm of the passed number in the specified base.            |

  | fnMathLShiftDouble: Left shift (<<) a DOUBLE 1 bit.                                              |
  | fnMathMapRange: Map a value within a set of original bounds to its equivalent given a secondady  |
  |     set of bound.                                                                                |
  | fnMathNaturalLogarithm: Calcultate the natural logarithm of the passed number.                   |
  | fnMathPower: Calcultate x raised to the n.                                                       |
  | fnMathRandom: RETURNs a DOUBLE value with a positive sign, greater than or equal to 0.0 and      |
  |     less than 1.0.                                                                               |
  | fnMathRawBEtoLong: Load 4 bytes of big endian data contained in a CHARacter array into a LONG.   |
  |     Note: Array position 1 should contain MSB.                                                   |
  | fnMathRawLEtoLong: Load 4 bytes of little endian data contained in a CHARacter array into a      |
  |     LONG. Note: Array position 4 should contain MSB / position 1 should contain LSB              |
  | fnMathRound: Rounds a flouting point number to it's closest whole number.                        |

  | fnMathRShiftDouble: Right shift (>>) a DOUBLE 1 bit.                                             |
  | fnMathSquareRoot: Calculate the square root of the passed number. This function takes a log base |
  |     2 approximation then iterates a Babylonian refinement until the answer is within the math    |
  |     libraries defined precision or exceeds 1000 steps of refinement.                             |
  | fnMathIEEERemainder: Computes the remainder operation on two arguments as prescribed by the IEEE |
  |     754 standard.                                                                                |
  |                                                                                                  |
  |                                     String Helper Functions                                      |
  |                                                                                                  |
  | DPSTOA: to convert a device's DPS to ascii for displaying                                        |
  | fnIntTRUEFALSE: Convert int string 'TRUE' or 'FALSE'

  | fnStringBoolToSTRING: Converts a boolean value to its string equivalent of either a 'ON' or      |
  |     'OFF'.                                                                                       |
  | fnStringConcatenate: Concatenates String a to String b and RETURNs the result                    |
  | fnStringExplode: Explodes a string with a CHAR delimiter into an array of strings. The           |
  |     fnStringExploded data will be placed into ret[]. Due to NetLinx bugs, you must specify the   |
  |     length of ret in ret_len ifyou want the RETURNed array sanitized.                            |
  | fnStringExplodeQuoted: Explodes a string with a CHAR delimiter into an array of strings. The     |
  |     fnStringExploded data will be placed into ret[]. Honors quotes; a CHARacter passed as quote  |
  |     (such asDOUBLE quotes) are treated as one segment. WARNING: Due to NetLinx bugs, you must    |
  |     specify the length of ret in ret_len if you want the RETURNed array sanitized.               |
  | fnStringFindMulti: Search through a string for a match against a list of possible substrings and |
  |     RETURN the element index of the matched string                                               |
  | fnStringImplode: Concatenates elements of an array of strings into a single string with a        |
  |     delimiter string inserted between each item.                                                 |

  | fnStringIntArrayToSTRING: Converts an INTEGER array into a comma serperated string list of its   |
  |     values.                                                                                      |

  | fnStringIsEqualsIgnoreCASE                                                                       |
  | fnStringIsPrintableCHAR: Checks to see if the passed CHARacter is a printable ASCII CHARacter.   |
  | fnStringIsPrintable: Checks to see if the passed string is all printable ASCII CHARacters.       |
  | fnStringIsWhitespace: Checks to see if the passed CHARacter is a whitespace CHARacter.           |
  | fnStringLeftTrim: RETURNs a copy of the string with the left whitespace removed. If no printable |
  |     CHARacters are found, an empty string will be RETURNed.                                      |
  | fnStringRemoveStringByLength: RETURNs the left substrings of a string up to the specified number |
  |     of CHARacters. WARNING: this is a destructive removal - the RETURNed substrings will be      |
  |     removed from string 'a'.                                                                     |
  | fnStringRightTrim: RETURNs a copy of the string with the right whitespace removed. If no         |
  |     printable CHARacters are found, an empty string will be RETURNed.                            |
  | fnStringCiGetBetween: Gets the first instance of a string contained within the bounds of two     |

  |     substrings CASE insensitive                                                                  |
  | fnStringDateInvert: SWITCHes the day and month fields of a date string (for coverting between US |
  |     and international standards). for example 05/28/2009 becomes 28/05/2009.                     |
  | fnStringEndsWith: Check is a string end with another string.                                     |
  | fnStringGetBetween: Gets the first instance of a string contained within the bounds of two       |

  |     substrings CASE sensitive                                                                    |
  | fnStringGetBetweenEx: Gets the first instance of a string contained within the bounds of two     |

  |     substrings CASE sensitive                                                                    |
  | fnStringGetKey: Gets the key from a single key/value pair string with the specified delimiter.   |
  | fnStringGetListItem: Gets an item from a string list. This can be used to grab word n within a   |
  |     string by passing 'space' as the delimiter.                                                  |
  | fnStringGetValue: Gets the value from a key/value pair string with the specified delimiter.      |
  | fnStringPrefixToLength: RETURNs a string prefixed with a specified value, up to a specified      |
  |     length.  If the string is the same size or is larger than the specified length, RETURNs the  |
  |     original string.                                                                             |
  | fnStringReplace: Replace all occurances of a substrings with another string.                     |
  | fnStringReverse: Reverse a string.                                                               |
  | fnStringSizeError: Callback triggered when a funcion within this string processing library       |
  |     attempts to process anything that will result in a RETURN size greater than that defined by  |
  |     STRING_RETURN_SIZE_LIMIT. Anything RETURNed by this will be used as the RETURN of the        |
  |     function that caused the error.                                                              |
  | fnStringStartsWith Check is a string starts with another string.                                 |
  | fnStringSuffixToLength: RETURNs a string suffixed with a specified value, up to a specified      |
  |     length. If the string is the same size or is larger than the specified length, RETURNs the   |
  |     original string.                                                                             |
  | fnStringToBool: Converts common string representations of boolean values into their boolean      |
  |     value equivalents.                                                                           |
  | fnStringTruncate: RETURNs a string truncated to a specific length. If the string is less than    |
  |     the length specified the original string is RETURNed. If it is truncated an elipsis will be  |
  |     appended.                                                                                    |
  | fnStringTruncateEx: RETURNs a string truncated to a specific length. If the string is less than  |
  |     the length specified the original string is RETURN. If it is truncated to contents of value  |
  |     is appended to the truncated string.                                                         |
  | fnStringUcfirst: RETURNs a copy of a string with the first alpha CHARacter capitalized. Non      |

  |     alpha CHARacters are not modified. Pass a LOWER_STRING()'d string to lowerCASE all other     |
  |     CHARacters.                                                                                  |
  | fnStringUcwords: RETURNs a copy of a string with the first alpha CHARacter in each word          |
  |     capitalized. Non alpha CHARacters are not modified. Pass a LOWER_STRING()'d string to lower  |

  |     CASE all other CHARacters.                                                                   |
  | fnStripCHARsRight: Remove CHARacters from the end of the string.                                 |
  | fnStringSubstr: Wrapper method for MID_STRING to bring inline with other programming languages.  |

  | fnStringSubSTRING: Alternative to fnStringSubstr which allows an end location to be specified    |
  |     instead of a count                                                                           |
  | fnStringSubstringEx: RETURNs a substring beginning at specified location to end of string        |
  | fnStringTrim: RETURNs a copy of the string with the whitespace removed. If no printable          |
  |     CHARacters are found, an empty string will be RETURNed.                                      |
  | fnStringUrlEncode: RETURNs a url-encoded string according to RFC 1736 / RFC 2732.                |
  |                                                                                                  |
  |                                   Touch Panel Helper Functions                                   |
  |                                                                                                  |

  | fnTPEnableButton: Enable buttons with a set variable text range                                  |

  | fnTPDisableButton: Disable buttons with a set variable text range                                |
  | fnTPHideAllPopupsOnPage: Close all popups on a specified page. If the page name is empty, the    |
  |     current page is used.                                                                        |
  | fnTPHideAllPopups: Close all popups on all pages.                                                |

  | fnTPHideButton: Hide button(s)                                                                   |
  | fnTPHidePopup: Deactivate a specific popup page on the current page. If the popup page is part   |
  |     of a group, the whole group is deactivated.                                                  |
  | fnTPSetButtonText: Set button state text command                                                 |
  | fnTPSetButtonTextAllStates: Set button state text command for all button states                  |
  | fnTPisG5: Is this a G5 panel?                                                                   |
  | fnTPisG4: Is this a G4 panel?                                                                   |

  | fnTPTextCOMMAND: RETURN the TP command based upon panel type (G4 vs G5)                         |

  | fnTPShowButton: Show button(s)                                                                   |
  | fnTPShowPopup: Activate a specific popup page to launch on the current page. If the popup page   |
  |     is already on, do not re-draw it.                                                            |
  |                                                                                                  |
  |                               Miscellaneous Panel Helper Functions                               |
  |                                                                                                  |
  | fnToggleState: Toggle state              |
  | fnTPToggleChannel: Toggle channel ON or OFF                                                     |
  |--------------------------------------------------------------------------------------------------|*/

  devDebugCommand                          = 33099:1:0

DEFINE_CONSTANT

  BTN_STATE_ALL                            = '0'
  BTN_STATE_OFF                            = '1'
  BTN_STATE_ON                             = '2'

  DEBUG_OFF                                = 0
  DEBUG_ERROR                              = 1
  DEBUG_WARN                               = 2
  DEBUG_INFO                               = 3
  DEBUG_DEBUG                              = 4

  DEBUG_MAX_LEVEL                          = 4

  CHAR DEBUG_LEVEL_STRINGS[5][16]          =
  {
    'Off',
    'Error',
    'Warn',
    'Info',
    'Debug'
  }

  DEBUG_LEVEL_VALUES[5]                    =
  {
    DEBUG_OFF,
    DEBUG_ERROR,
    DEBUG_WARN,
    DEBUG_INFO,
    DEBUG_DEBUG
  }

  DOUBLE MATH_E                            = 2.718281828459045
  DOUBLE MATH_PI                           = 3.141592653589793

  DOUBLE MATH_PRECISION             = 1.0e-13           // Precision required FOR processor intensive math functions. If accuracy is not integral to their use this may be increased to improve performance.

  STRING_RETURN_SIZE_LIMIT                 = 1024              // Maximum string RETURN size for string manipulation functions

DEFINE_VARIABLE

  //  #WARN 'NetLinx debug level is ERROR, to change use Helper Libraries fnDebugSetLevel(0-4)'
  //  #WARN   'Debug Levels: 0-Off, 1-Error, 2-Warning, 3-Info, 4-Debug'

  //  #WARN   'Set Debug Level via COMMAND: SEND_C 33099,"DEBUG-[0-4]"'

  //  #WARN 'Query Debug Level via COMMAND: SEND_C 33099,"?DEBUG"'

  PERSISTENT INTEGER nDebugLevel           = DEBUG_ERROR       // Current system debug level, default to Error
  PERSISTENT DEV IO_OUT                    = 0:0:0             // output stream device
  PERSISTENT CHAR IO_LINE_SEPERATOR        = $0A               // seperator to insert between lines

  VOLATILE DOUBLE MATH_NaN
  VOLATILE DOUBLE MATH_POSITIVE_INFINITY
  VOLATILE DOUBLE MATH_NEGATIVE_INFINITY
  VOLATILE DOUBLE MATH_TWO_52

  DEFINE_FUNCTION INTEGER fnArrayDeviceIndex(DEV dvItem,
  DEV dvList[])
  {
    /*|------------------------------------------------------------------------------|
    | fnArrayDeviceIndex: Finds the index for any matching device entry in an array|
    |      Parameters:                                                             |
    |          dvItem find in the array                                            |
    |          dvList array of items                                               |
    |      RETURNs: the index of the matching value or 0 if no match               |
    |------------------------------------------------------------------------------|*/

    STACK_VAR INTEGER idx

    FOR(idx = 1; idx <= MAX_LENGTH_ARRAY(dvList); idx++)
    {

      IF(dvItem == dvList[idx])
      {

        RETURN idx
      }
    }

    RETURN 0
  }

  DEFINE_FUNCTION INTEGER fnArrayDoubleIndex(DOUBLE dItem,
  DOUBLE dList[])
  {
    /*|------------------------------------------------------------------------------|
    | fnArrayDoubleIndex: Finds the index for any matching item in the double array|
    |      Parameters:                                                             |
    |          dItem find in the array                                             |
    |          dList array of items                                                |
    |      RETURNs: the index of the matching value or 0 if no match               |
    |------------------------------------------------------------------------------|*/

    STACK_VAR INTEGER idx

    FOR(idx = 1; idx <= MAX_LENGTH_ARRAY(dList); idx++)
    {

      IF(dItem == dList[idx])
      {

        RETURN idx
      }
    }

    RETURN 0
  }

  DEFINE_FUNCTION fnArrayInsertionSort(INTEGER nList[])
  {
    /*|------------------------------------------------------------------------------|
    | fnArrayInsertionSort: In-place sorting of an INTEGER array using the         |
    |         insertion sort method. Efficient for small data sets. Crude testing  |
    |         on a NI-900 suggests that insertion sort is faster than the          |
    |         non-recursive quicksort for random INTEGER arrays up to a size of    |
    |         about 25 elements.                                                   |
    |    Parameters:                                                               |
    |       nList array of INTEGERs                                                |
    |    RETURNs: nothing                                                          |
    |------------------------------------------------------------------------------|*/

    STACK_VAR INTEGER length
    STACK_VAR INTEGER n
    STACK_VAR INTEGER val
    STACK_VAR INTEGER hole_pos

    length                                   = LENGTH_ARRAY(nList)

    FOR(n = 2; n <= length; n++)
    {
      val                                      = nList[n]
      hole_pos                                 = n

      WHILE(val < nList[hole_pos - 1])
      {
        nList[hole_pos]                          = nList[hole_pos - 1]
        hole_pos--

        IF(hole_pos == 1)
        {

          BREAK
        }
      }
      nList[hole_pos]                          = val
    }
  }

  DEFINE_FUNCTION INTEGER fnArrayINTEGERIndex(INTEGER nItem,
  INTEGER nList[])
  {
    /*|------------------------------------------------------------------------------|
    | fnArrayDoubleIndex: Finds the index for any matching device entry in an      |
    |         array.                                                               |
    |      Parameters:                                                             |
    |          nItem find in the array                                             |
    |          nList array of items                                                |
    |      RETURNs: the index of the matching value or 0 if no match               |
    |------------------------------------------------------------------------------|*/

    STACK_VAR INTEGER idx

    FOR(idx = 1; idx <= MAX_LENGTH_ARRAY(nList); idx++)
    {

      IF(nItem == nList[idx])
      {

        RETURN idx
      }
    }

    RETURN 0
  }

  DEFINE_FUNCTION INTEGER fnArrayMaxValue(INTEGER nList[])
  {
    /*|--------------------------------------------------------------------------------------------------|
    | fnArrayMaxValue: Finds the maximum value in an INTEGER array                                     |
    |     Parameters:                                                                                  |
    |          nList array of INTEGER                                                                  |
    |     RETURNs: the maximum value in the array                                                      |
    |--------------------------------------------------------------------------------------------------|*/
    STACK_VAR INTEGER idx
    STACK_VAR INTEGER val

    val                                      = 0;

    FOR(idx = 1; idx <= MAX_LENGTH_ARRAY(nList); idx++)
    {
      val                                      = max_value(val, nList[idx]);
    }

    RETURN val;
  }

  DEFINE_FUNCTION DOUBLE fnArrayMaxValueDouble(DOUBLE nList[])
  {
    /*|--------------------------------------------------------------------------------------------------|
    | fnArrayMaxValueDouble: Finds the maximum value in an DOUBLE array                                |
    |     Parameters:                                                                                  |
    |          nList array of double                                                                   |
    |     RETURNs: the maximum value in the array                                                      |
    |--------------------------------------------------------------------------------------------------|*/

    STACK_VAR INTEGER idx
    STACK_VAR DOUBLE  val

    val                                      = MATH_NEGATIVE_INFINITY;

    FOR(idx = 1; idx <= MAX_LENGTH_ARRAY(nList); idx++)
    {

      IF(nList[idx] > val)
      {
        val                                      = nList[idx];
      }
    }

    RETURN val;
  }

  DEFINE_FUNCTION INTEGER fnArrayMinValue(INTEGER nList[])
  {
    /*|--------------------------------------------------------------------------------------------------|
    | fnArrayMinValue: Finds the maximum value in an INTEGER array                                     |
    |     Parameters:                                                                                  |
    |          nList array of INTEGER                                                                  |
    |     RETURNs: the minimum value in the array                                                      |
    |--------------------------------------------------------------------------------------------------|*/
    STACK_VAR INTEGER i
    STACK_VAR INTEGER val

    val                                      = 65535;

    FOR(i = 1; i <= MAX_LENGTH_ARRAY(nList); i++)
    {
      val                                      = min_value(val, nList[i]);
    }

    RETURN val;
  }

  DEFINE_FUNCTION DOUBLE fnArrayMinValueDouble(DOUBLE nList[])
  {
    /*|--------------------------------------------------------------------------------------------------|
    | fnArrayMinValueDouble: Finds the maximum value in an DOUBLE array                                |
    |     Parameters:                                                                                  |
    |          nList array of double                                                                   |
    |     RETURNs: the minimum value in the array                                                      |
    |--------------------------------------------------------------------------------------------------|*/
    STACK_VAR INTEGER i
    STACK_VAR DOUBLE val

    val                                      = MATH_POSITIVE_INFINITY;

    FOR(i = 1; i <= MAX_LENGTH_ARRAY(nList); i++)
    {

      IF(nList[i] < val)
      {
        val                                      = nList[i];
      }
    }

    RETURN val;
  }

  DEFINE_FUNCTION INTEGER fnArrayPartition(INTEGER nList[],
  INTEGER left,
  INTEGER right,
  INTEGER pivot_index)
  {
    /*|--------------------------------------------------------------------------------------------------|

    | fnArrayPartition: In-place partitioning of an INTEGER array.  It partitions the portion of the   |
    |       array between indices left and right inclusive by moving all elements less than            |
    |       list[pivot_index] before the pivot and those equal or greater after it.                    |
    |     Parameters:                                                                                  |
    |          array of INTEGERs                                                                       |
    |          left index of first element of the sub-array to partition                               |
    |          right index of second element of the sub-array to partition                             |
    |          pivot_index of the pivot element                                                        |
    |     RETURNs: nothing                                                                             |
    |--------------------------------------------------------------------------------------------------|*/

    STACK_VAR INTEGER pivot_value
    STACK_VAR INTEGER store_index
    STACK_VAR INTEGER n

    store_index                              = 0

    IF(left <= pivot_index && pivot_index <= right && left && right <= LENGTH_ARRAY(nList))
    {
      pivot_value                              = nList[pivot_index]
      fnArraySwap(nList, pivot_index, right)
      store_index                              = left

      FOR(n = left; n < right; n++)
      {

        IF(nList[n] <= pivot_value)
        {
          fnArraySwap(nList, n, store_index)
          store_index++
        }
      }
      fnArraySwap(nList, store_index, right)
    }

    RETURN store_index
  }

  DEFINE_FUNCTION fnArrayQuickSort(INTEGER nList[])
  {
    /*|--------------------------------------------------------------------------------------------------|
    | fnArrayQuickSort: In-place sorting of an INTEGER array using a non-recursive quicksort method.   |
    |     Parameters:                                                                                  |
    |          array of INTEGERs                                                                       |
    |     RETURNs: nothing                                                                             |
    |--------------------------------------------------------------------------------------------------|*/

    STACK_VAR INTEGER stack_count  // current stack size
    STACK_VAR INTEGER stack[16][2] // stack size with log2(N) slots required: N = max allowable number
    STACK_VAR INTEGER pivot        // current pivot value
    STACK_VAR INTEGER lo, hi       // current lower and upper indices

    stack_count                              = 1
    stack[stack_count][1]                    = 1
    stack[stack_count][2]                    = LENGTH_ARRAY(nList)

    WHILE(stack_count)
    {
      lo                                       = stack[stack_count][1]
      hi                                       = stack[stack_count][2]

      IF(lo < hi)
      {
        pivot                                    = nList[lo]

        WHILE(lo < hi)
        {

          WHILE(nList[hi] >= pivot && lo < hi)
          {
            hi--
          }

          IF(lo < hi)
          {
            nList[lo]                                = nList[hi]
            lo++
          }

          WHILE(nList[lo] <= pivot && lo < hi)
          {
            lo++
          }

          IF(lo < hi)
          {
            nList[hi]                                = nList[lo]
            hi--
          }
        }
        nList[lo]                                = pivot
        stack_count++
        stack[stack_count][1]                    = lo + 1
        stack[stack_count][2]                    = stack[stack_count - 1][2]
        stack[stack_count - 1][2]                = lo
      }
      ELSE
      {
        stack_count--
      }
    }
  }

  DEFINE_FUNCTION INTEGER fnArrayStringIndex(CHAR cItem[],
  CHAR cList[][])
  {
    /*|--------------------------------------------------------------------------------------------------|
    | fnArrayStringIndex: Finds the index for any matching string entry in an array.                   |
    |     Parameters:                                                                                  |
    |          item to find in the array                                                               |
    |          array of items                                                                          |
    |     RETURNs: the index of the matching value, or 0 if no match                                   |
    |--------------------------------------------------------------------------------------------------|*/

    STACK_VAR INTEGER idx

    IF(LENGTH_ARRAY(cItem) > 0)
    {

      FOR(idx = 1; idx <= MAX_LENGTH_ARRAY(cList); idx++)
      {
        fnDebugMessage(DEBUG_INFO,"'item:[',cItem,'] nList[',ITOA(idx),']:[',cList[idx],']'")
        IF(fnStringIsEqualsIgnoreCase(cItem,cList[idx]))
        {

          RETURN idx
        }
      }
    }

    RETURN 0
  }

  DEFINE_FUNCTION fnArraySwap(INTEGER nList[],
  INTEGER index1,
  INTEGER index2)
  {
    /*|--------------------------------------------------------------------------------------------------|
    | fnArraySwap: In-place swap of two elements in an INTEGER array                                   |
    |     Parameters:                                                                                  |
    |          array of INTEGERs                                                                       |
    |          index1 of the first element to swap                                                     |
    |          index2 of the second element to swap                                                    |
    |     RETURNs: nothing                                                                             |
    |--------------------------------------------------------------------------------------------------|*/

    STACK_VAR INTEGER length
    STACK_VAR INTEGER temp_store

    length                                   = LENGTH_ARRAY(nList)

    IF(index1 && index1 <= length && index2 && index2 <= length)
    {
      temp_store                               = nList[index1];
      nList[index1]                            = nList[index2]
      nList[index2]                            = temp_store
    }
  }

  DEFINE_FUNCTION fnDebugDecimal(CHAR msg_level,
  CHAR msg[])
  {
    /*|--------------------------------------------------------------------------------------------------|
    | fnDebugDecimal: Prints a debug message forced to decimal                                         |
    |     Parameters:                                                                                  |
    |          msg_level CHAR specifying the debug level of the message                                |
    |          msg string containing the debug message to be printed as decimal                        |
    |     RETURNs: nothing                                                                             |
    |--------------------------------------------------------------------------------------------------|*/
    STACK_VAR LONG i,l
    STACK_VAR CHAR c
    STACK_VAR CHAR in[255]

    IF(msg_level < DEBUG_ERROR || msg_level > DEBUG_MAX_LEVEL)
    {
      fnDebugMessage(DEBUG_ERROR, "'invalid debug level specified - ', msg")

      RETURN
    }

    IF(msg_level <= nDebugLevel)
    {
      in                                       = msg
      l                                        = LENGTH_ARRAY(in)

      fnIOPrintln("'message length: ',ITOA(l)")

      FOR(i = 1; i <= l; i++)
      {
        c                                        = GET_BUFFER_CHAR(in)
        fnIOPrintln("'[',ITOA(i),'] ',ITOA(c)")
      }
    }
  }

  DEFINE_FUNCTION fnDebugErrorMessage(CHAR msg[])
  {
    /*|--------------------------------------------------------------------------------------------------|
    | fnDebugErrorMessage: Voices a debug message IF required by the current debug level. All system   |
    |       messages should pass through here. If the ability to dump to a file or networked logging   |
    |       service is required it can be added here.                                                  |
    |     Parameters:                                                                                  |
    |          msg_level CHAR specifying the debug level of the message                                |
    |          msg string containing the debug message                                                 |
    |     RETURNs: nothing                                                                             |
    |--------------------------------------------------------------------------------------------------|*/

    fnDebugMessage(DEBUG_ERROR, msg)
  }

  DEFINE_FUNCTION CHAR fnDebugGetLevelFromString(CHAR x[])
  {
    /*|--------------------------------------------------------------------------------------------------|

    | fnDebugGetLevelFromSTRING: Gets a numerical debug level based on it's equivalent string          |
    |       representation.                                                                            |
    |     Parameters:                                                                                  |
    |          x CHARacter array containing the string to parse                                        |
    |     RETURNs: CHARacter containing the numerical debug level represented by the content of x      |
    |--------------------------------------------------------------------------------------------------|*/

    STACK_VAR CHAR lvl

    IF(LENGTH_ARRAY(x) == 1)
    {
      lvl                                      = ATOI(x)

      IF(lvl > 4)
      {
        lvl                                      = DEBUG_OFF
      }
    }

    FOR(lvl                                  = LENGTH_ARRAY(DEBUG_LEVEL_STRINGS); lvl; lvl--)
    {

      IF(LOWER_STRING(x) == LOWER_STRING(DEBUG_LEVEL_STRINGS[lvl]))
      {
        lvl                                      = lvl - 1

        BREAK
      }
    }

    RETURN lvl
  }

  DEFINE_FUNCTION CHAR[16] fnDebugGetLevelString()
  {
    /*|--------------------------------------------------------------------------------------------------|

    | fnDebugGetLevelSTRING: RETURNs the current debug level as String.                                |
    |     Parameters:                                                                                  |
    |     RETURNs: string representing the level                                                       |
    |--------------------------------------------------------------------------------------------------|*/

    RETURN DEBUG_LEVEL_STRINGS[nDebugLevel + 1]
  }

  DEFINE_FUNCTION CHAR[16] fnDebugLevelString(INTEGER nDebugLevel)
  {
    /*|--------------------------------------------------------------------------------------------------|

    | fnDebugLevelSTRING: RETURNs the requested debug level as String.                                 |
    |     nDebugLevel INTEGER specifying the debug level of the message                                |
    |     RETURNs: string representing the level                                                       |
    |--------------------------------------------------------------------------------------------------|*/

    RETURN DEBUG_LEVEL_STRINGS[nDebugLevel + 1]
  }

  DEFINE_FUNCTION fnDebugHex(CHAR msg_level,
  CHAR msg[])
  {
    /*|--------------------------------------------------------------------------------------------------|
    | fnDebugHex: Prints a debug message forced to hex - this avoids situations where a hex value is a |
    |       valid ASCII CHARacter                                                                      |
    |     Parameters:                                                                                  |
    |          msg_level CHAR specifying the debug level of the message                                |
    |          msg string containing the debug message to be printed as hex                            |
    |     RETURNs: nothing                                                                             |
    |--------------------------------------------------------------------------------------------------|*/

    STACK_VAR LONG i,l
    STACK_VAR CHAR c
    STACK_VAR CHAR out[255]
    STACK_VAR CHAR in[255]

    IF(msg_level < DEBUG_ERROR || msg_level > DEBUG_MAX_LEVEL)
    {
      fnDebugMessage(DEBUG_ERROR, "'invalid debug level specified - ', msg")

      RETURN
    }

    IF(msg_level <= nDebugLevel)
    {
      in                                       = msg
      out                                      = ""
      l                                        = LENGTH_ARRAY(in)

      FOR(i = 0; i < l; i++)
      {
        c                                        = GET_BUFFER_CHAR(in)
        out                                      = "out, '$', ITOHEX(c),','"
      }

      fnIOPrintln("UPPER_STRING(fnDebugGetLevelString()),': ',out")
    }
  }

  DEFINE_FUNCTION INTEGER fnDebugIsLevelDebug()
  {
    /*|--------------------------------------------------------------------------------------------------|
    | fnDebugIsLevelDebug: Query if debug level it set to DEBUG                                        |
    |      RETURNs: TRUE or FALSE                                                                      |
    |--------------------------------------------------------------------------------------------------|*/

    RETURN nDebugLevel >= DEBUG_DEBUG
  }

  DEFINE_FUNCTION INTEGER fnDebugIsLevelError()
  {
    /*|--------------------------------------------------------------------------------------------------|
    | fnDebugIsLevelError: Query if debug level it set to ERROR or greater                             |
    |      RETURNs: TRUE or FALSE                                                                      |
    |--------------------------------------------------------------------------------------------------|*/

    RETURN nDebugLevel >= DEBUG_ERROR
  }

  DEFINE_FUNCTION INTEGER fnDebugIsLevelInfo()
  {
    /*|--------------------------------------------------------------------------------------------------|
    | fnDebugIsLevelInfo: Query if debug level it set to INFO or greater                               |
    |      RETURNs: TRUE or FALSE                                                                      |
    |--------------------------------------------------------------------------------------------------|*/

    RETURN nDebugLevel >= DEBUG_INFO
  }

  DEFINE_FUNCTION INTEGER fnDebugIsLevelWarning()
  {
    /*|--------------------------------------------------------------------------------------------------|
    | fnDebugIsLevelWarning: Query if debug level it set to WARNING or greater                         |
    |      RETURNs: TRUE or FALSE                                                                      |
    |--------------------------------------------------------------------------------------------------|*/

    RETURN nDebugLevel >= DEBUG_WARN
  }

  DEFINE_FUNCTION fnDebugMessage(INTEGER msg_level,
  CHAR msg[])
  {
    /*|--------------------------------------------------------------------------------------------------|
    | fnDebugMessage: Voices a debug message IF required by the current debug level. All system        |
    |       messages should pass through here. If the ability to dump to a file or networked logging   |
    |       service is required it can be added here.                                                  |
    |     Parameters:                                                                                  |
    |          msg_level CHAR specifying the debug level of the message                                |
    |          msg string containing the debug message                                                 |
    |     RETURNs: nothing                                                                             |
    |--------------------------------------------------------------------------------------------------|*/

    STACK_VAR LONG i,l
    STACK_VAR CHAR c
    STACK_VAR CHAR out[255]
    STACK_VAR CHAR in[255]

    IF(msg_level < DEBUG_ERROR || msg_level > DEBUG_MAX_LEVEL)
    {
      fnDebugMessage(DEBUG_ERROR, "'invalid debug level specified - ', msg")

      RETURN
    }

    IF(msg_level <= nDebugLevel)
    {

      IF(FIND_STRING(msg, "$00", 1) > 0)
      {
        in                                       = msg
        out                                      = ""
        l                                        = LENGTH_ARRAY(in)

        FOR(i = 0; i < l; i++)
        {
          c                                        = GET_BUFFER_CHAR(in)

          IF(c == "$00")
          {
            out                                      = "out,'$00'"
          }
          ELSE
          {
            out                                      = "out,c"
          }
        }
        fnIOPrintln("UPPER_STRING(fnDebugGetLevelString()),': ', out")
      }
      ELSE
      {
        fnIOPrintln("UPPER_STRING(fnDebugGetLevelString()),': ', msg")
      }
    }
  }

  DEFINE_FUNCTION fnDebugSetLevel(INTEGER x)
  {
    /*|--------------------------------------------------------------------------------------------------|
    | fnDebugSetLevel: Sets the current system debugging level FOR controlling debug message           |
    |       verbosity.                                                                                 |
    |     Parameters:                                                                                  |
    |          x INTEGER specifying the debug level to set                                             |
    |     RETURNs: nothing                                                                             |
    |--------------------------------------------------------------------------------------------------|*/

    IF(x >= DEBUG_OFF && x <= DEBUG_MAX_LEVEL)
    {
      nDebugLevel                              = x
    }
    ELSE
    {
      fnDebugMessage(DEBUG_WARN, "'Invalid debug level, defaulting to ', fnDebugGetLevelString()")
      fnDebugSetLevel(DEBUG_ERROR)
    }
  }

  DEFINE_FUNCTION fnDebugSetLevelByString(CHAR x[])
  {
    /*|--------------------------------------------------------------------------------------------------|

    | fnDebugSetLevelBySTRING: Sets the current system debugging level FOR controlling debug message   |
    |       verbosity.                                                                                 |
    |     Parameters:                                                                                  |
    |          x CHAR specifying the debug level to set                                                |
    |     RETURNs: nothing                                                                             |
    |--------------------------------------------------------------------------------------------------|*/

    STACK_VAR INTEGER idx

    FOR(idx = 1; idx <= LENGTH_ARRAY(DEBUG_LEVEL_STRINGS); idx++)
    {

      IF(LOWER_STRING(x) == LOWER_STRING(DEBUG_LEVEL_STRINGS[idx]))
      {
        fnDebugSetLevel(DEBUG_LEVEL_VALUES[idx])

        RETURN
      }
    }

    fnIOPrintln("'Invalid debug level, defaulting to ', fnDebugGetLevelString()")
    fnDebugSetLevel(DEBUG_ERROR)
  }

  DEFINE_FUNCTION fnIOPrint(CHAR x[])
  {
    /*|--------------------------------------------------------------------------------------------------|
    | fnIOPrint: Print a CHARacter array to the output stream.                                         |
    |     Parameters:                                                                                  |
    |          x string containing the data to output                                                  |
    |     RETURNs: nothing                                                                             |
    |--------------------------------------------------------------------------------------------------|*/

    fnIOWrite(x, 0, LENGTH_ARRAY(x))
  }

  DEFINE_FUNCTION fnIOPrintBanner(CHAR x[], INTEGER l, CHAR y)
  {
    /*|--------------------------------------------------------------------------------------------------|
    | fnIOPrintBanner: Prints banner to the output stream.                                             |
    |     Parameters:                                                                                  |
    |          x banner message                                                 |
    |          l length of banner                                                                      |
    |          y banner CHARacter ('-','*'...)                                                         |
    |     RETURNs: nothing                                                                             |
    |--------------------------------------------------------------------------------------------------|*/
    STACK_VAR INTEGER idx
    STACK_VAR INTEGER len
    STACK_VAR CHAR z[l]

    len                                 =	(l-LENGTH_ARRAY(x)) / 2

    SEND_STRING 0, "x,' len: ',ITOA(len),' l: ',ITOA(l)"

    fnIOPrintln(fnStringPrefixToLength('',y,l))
    fnIOPrintln(fnStringPrefixToLength('',y,l))
    fnIOPrintln(fnStringPrefixToLength('',y,l))
    fnIOPrintln(' ')

    FOR(idx = 1; idx <= len; idx++)
    {
      z                                 =	"z, ' '"
    }
    fnIOPrintln("z,x")

    SEND_STRING 0, "x,' len: ',ITOA(len),' l: ',ITOA(l),' z: [',z,'] len z: ',ITOA(LENGTH_ARRAY(z))"

    fnIOPrintln(' ')
    fnIOPrintln(fnStringPrefixToLength('',y,l))
    fnIOPrintln(fnStringPrefixToLength('',y,l))
    fnIOPrintln(fnStringPrefixToLength('',y,l))
  }

  DEFINE_FUNCTION fnIOPrintln(CHAR x[])
  {
    /*|--------------------------------------------------------------------------------------------------|
    | fnIOPrintln: Print a line to the output stream.                                                  |
    |     Parameters:                                                                                  |
    |          x string containing the data to output                                                  |
    |     RETURNs: nothing                                                                             |
    |--------------------------------------------------------------------------------------------------|*/

    fnIOWrite("x, IO_LINE_SEPERATOR", 0, LENGTH_ARRAY(x))
  }

   DEFINE_FUNCTION fnIOWrite(CHAR buf[],
    INTEGER offset,
    INTEGER len)
  {
    /*|--------------------------------------------------------------------------------------------------|
    | fnIOWrite: Write a CHARacter array to the output device.                                         |
    |     Parameters:                                                                                  |
    |          bufthe CHARacter array to WRITE                                                         |
    |          offset offset to begin writing from (offset 0 == CHARacter 1)                           |
    |          len number of CHARacters to WRITE                                                       |
    |     RETURNs: nothing                                                                             |
    |--------------------------------------------------------------------------------------------------|*/

		IF (offset <= 0)
		{
			offset = 1
		}
		
		SEND_STRING IO_OUT, MID_STRING(buf,offset, len)
		
   }

  DEFINE_FUNCTION DOUBLE fnMathIEEERemainder(DOUBLE x,
  DOUBLE y)
  {
    /*|--------------------------------------------------------------------------------------------------|
    | fnMathIEEERemainder: Computes the remainder operation on two arguments as prescribed by the      |
    |       IEEE 754 standard.                                                                         |
    |     Parameters:                                                                                  |
    |          x dividend                                                                              |
    |          y divisor                                                                               |
    |     RETURNs: DOUBLE equal to x - (y Q), where Q is the quotient of x / y fnMathRounded to the    |
    |       nearest INTEGER (if y            = 0, NaN is RETURNed                                                 |
    |--------------------------------------------------------------------------------------------------|*/

    IF(y == 0)
    {

      RETURN MATH_NaN
    }

    RETURN x - y * fnMathRound(x / y)
  }

  DEFINE_FUNCTION FLOAT fnMathBase10Logarithm(FLOAT x)
  {
    /*|--------------------------------------------------------------------------------------------------|
    | fnMathBase10Logarithm: Calculate the base 10 logarithm of the passed number.                     |
    |     Parameters:                                                                                  |
    |          x FLOAT to find the natural log of                                                      |
    |     RETURNs: FLOAT containing the passed numbers log base 10                                     |
    |--------------------------------------------------------------------------------------------------|*/

    RETURN fnMathLogarithm(x, 10)
  }

  DEFINE_FUNCTION FLOAT fnMathBinaryLogarithm(FLOAT x)
  {
    /*|--------------------------------------------------------------------------------------------------|
    | fnMathBinaryLogarithm: Calculate the binary logarithm of the passed number.                      |
    |     Parameters:                                                                                  |
    |          x FLOAT to find the natural log of                                                      |
    |     RETURNs: FLOAT containing the passed numbers log base 2                                      |
    |--------------------------------------------------------------------------------------------------|*/

    RETURN fnMathLogarithm(x, 2)
  }

  DEFINE_FUNCTION DOUBLE fnMathBuildDouble(LONG hi,
  LONG low)
  {
    /*|--------------------------------------------------------------------------------------------------|
    | fnMathBuildDouble: Build a DOUBLE using the binary info stored across two LONGs. It is assumed   |
    |       that the data is stored as per the IEEE754 standard.                                       |
    |     Parameters:                                                                                  |
    |          hi LONG containing bits 63 - 32                                                         |
    |          low LONG containing bits 31 - 0                                                         |
    |     RETURNs: DOUBLE built from the passed data                                                   |
    |--------------------------------------------------------------------------------------------------|*/

    STACK_VAR CHAR serialized[10]// For some reason the buffer
    STACK_VAR DOUBLE ret// passed to string_to_variable()

    serialized                               = "$E4, raw_be(hi), raw_be(low)"// has to have an extra trailing byte
    string_to_variable(ret, serialized, 1)

    RETURN ret
  }

  DEFINE_FUNCTION FLOAT fnMathBuildFloat(LONG x)
  {
    /*|--------------------------------------------------------------------------------------------------|
    | fnMathBuildFloat: Build a FLOAT using a IEEE754 bit pattern stored in a LONG.                    |
    |     Parameters:                                                                                  |
    |          x LONG containing the raw data                                                          |
    |     RETURNs: FLOAT built from the passed data                                                    |
    |--------------------------------------------------------------------------------------------------|*/

    STACK_VAR CHAR serialized[6]
    STACK_VAR FLOAT ret

    serialized                               = "$E3, raw_be(x)"
    string_to_variable(ret, serialized, 1)

    RETURN ret
  }

  DEFINE_FUNCTION DOUBLE fnMathCeiling(DOUBLE x)
  {
    /*|--------------------------------------------------------------------------------------------------|
    | fnMathCeiling: RETURNs the smallest (closest to negative infinity) LONG value that is not less   |
    |       than the argument and is equal to a mathematical INTEGER.                                  |
    |     Parameters:                                                                                  |
    |          x DOUBLE to fnMathRound                                                                 |
    |     RETURNs: DOUBLE containing the fnMathRounded number                                          |
    |--------------------------------------------------------------------------------------------------|*/

    RETURN -fnMathFloor(-x)
  }

  DEFINE_FUNCTION LONG fnMathDecimalToBinaryCodedDecimal(INTEGER x)
  {
    /*|--------------------------------------------------------------------------------------------------|
    | fnMathDecimalToBinaryCodedDecimal: Encode a decimal value as binary-coded decimal (BCD).         |
    |     Parameters:                                                                                  |
    |          x INTEGER to encode as BCD                                                              |
    |     RETURNs: LONG containing the BCD representation of x                                         |
    |--------------------------------------------------------------------------------------------------|*/

    STACK_VAR LONG tmp
    STACK_VAR CHAR i
    STACK_VAR CHAR j

    FOR(i                                    = 16; i; i--)
    {

      FOR(j = 0; j < 5; j++)
      {

        IF((tmp >> (4 * j) & $F) > 4)
        {

          tmp = tmp + (3 << (4 * j))
        }
      }

      tmp = tmp << 1 | (x >> (i - 1) & 1)
    }

    RETURN tmp
  }

  DEFINE_FUNCTION LONG fnMathDoubleHighToBits(DOUBLE x)
  {
    /*|--------------------------------------------------------------------------------------------------|
    | fnMathDoubleHighToBits: Load the raw data stored in bits 63 - 32 of a DOUBLE into a LONG.        |
    |     Parameters:                                                                                  |
    |          x DOUBLE to load                                                                        |
    |     RETURNs: LONG filled binary data stored in the high DWord of the DOUBLE                      |
    |--------------------------------------------------------------------------------------------------|*/

    STACK_VAR CHAR raw[8]

    raw                                      = raw_be(x)

    RETURN fnMathRawBEtoLong("raw[1], raw[2], raw[3], raw[4]")
  }

  DEFINE_FUNCTION LONG fnMathDoubleLowToBits(DOUBLE x)
  {
    /*|--------------------------------------------------------------------------------------------------|
    | fnMathDoubleLowToBits: Load the raw data stored in bits 31 - 0 of a DOUBLE into a LONG.          |
    |     Parameters:                                                                                  |
    |          x DOUBLE to load                                                                        |
    |     RETURNs: LONG filled binary data stored in the low DWord of the DOUBLE                       |
    |--------------------------------------------------------------------------------------------------|*/

    STACK_VAR CHAR raw[8]

    raw                                      = raw_be(x)

    RETURN fnMathRawBEtoLong("raw[5], raw[6], raw[7], raw[8]")
  }

  DEFINE_FUNCTION DOUBLE fnMathFastSqrt(DOUBLE x)
  {
    /*|--------------------------------------------------------------------------------------------------|
    | fnMathFastSqrt: Approximate the square root of the passed number based on the inverse square     |
    |       root algorithm in fnMathInverseSqrt(x). This is MUCH faster than fnMathSquareRoot(x)       |
    |       and recommended over fnMathSquareRoot() FOR use anywhere a precise square root is          |
    |       not required. Error is approx +/-0.17%.                                                    |
    |     Parameters:                                                                                  |
    |          x DOUBLE to find the square root of                                                     |
    |     RETURNs: DOUBLE containing an approximation of the square root                               |
    |--------------------------------------------------------------------------------------------------|*/

    RETURN x * fnMathInverseSqrt(x)
  }

  DEFINE_FUNCTION LONG fnMathFloatToBits(FLOAT x)
  {
    /*|--------------------------------------------------------------------------------------------------|
    | fnMathFloatToBits: Load a FLOAT value's IEEE 754 bit pattern into a LONG.                        |
    |     Parameters:                                                                                  |
    |          x FLOAT to load                                                                         |
    |     RETURNs: LONG filled with the IEEE 754 bit pattern of the FLOAT                              |
    |--------------------------------------------------------------------------------------------------|*/

    RETURN fnMathRawBEtoLong(raw_be(x))
  }

  DEFINE_FUNCTION DOUBLE fnMathFloor(DOUBLE x)
  {
    /*|--------------------------------------------------------------------------------------------------|
    | fnMathFloor: RETURNs the largest (closest to positive infinity) LONG value that is not greater   |
    |       than the argument and is equal to a mathematical INTEGER.                                  |
    |     Parameters:                                                                                  |
    |          x DOUBLE to fnMathRound                                                                 |
    |     RETURNs: DOUBLE containing the fnMathRounded number                                          |
    |--------------------------------------------------------------------------------------------------|*/

    STACK_VAR DOUBLE tmp
    STACK_VAR SLONG ret
    tmp                                      = abs_value(x)

    IF(fnMathIsInt(tmp))
    {

      RETURN x
    }

    IF(tmp < 1)
    {

      IF(x >= 0)
      {

        RETURN 0.0 * x
      }
      ELSE
      {

        RETURN -1.0
      }
    }

    IF(x < 0)
    {
      ret                                      = type_cast(x - 1.0)
    }
    ELSE
    {
      ret                                      = type_cast(x)
    }

    RETURN ret
  }

  DEFINE_FUNCTION DOUBLE fnMathInverseSqrt(DOUBLE x)
  {
    /*|--------------------------------------------------------------------------------------------------|
    | fnMathInverseSqrt: Approximate the inverse square root of the passed number. This method uses a  |
    |       INTEGER shift and single Newton refinement aka Quake 3 method. Original algorithm by Greg  |
    |       Walsh.                                                                                     |
    |     Parameters:                                                                                  |
    |          x DOUBLE to find the inverse square root of                                             |
    |     RETURNs: DOUBLE containing an approximation of the inverse square root                       |
    |--------------------------------------------------------------------------------------------------|*/

    STACK_VAR LONG hi
    STACK_VAR LONG low
    STACK_VAR LONG t_hi
    STACK_VAR LONG t_low
    STACK_VAR DOUBLE res
    STACK_VAR DOUBLE tmp
    tmp                                      = fnMathRShiftDouble(x)
    t_hi                                     = fnMathDoubleHighToBits(tmp)
    t_low                                    = fnMathDoubleLowToBits(tmp)
    hi                                       = $5FE6EC85 - t_hi

    IF(t_low > $E7DE30DA)
    {
      hi                                       = hi - (t_low - $E7DE30DA)
      low                                      = 0
    }
    ELSE
    {
      low                                      = $E7DE30DA - t_low
    }

    res                                      = fnMathBuildDouble(hi, low)

    RETURN res * (1.5 - 0.5 * x * res * res)
  }

  DEFINE_FUNCTION CHAR fnMathIsInfinite(DOUBLE x)
  {
    /*|--------------------------------------------------------------------------------------------------|
    | fnMathIsInfinite: Checks if a value is either positive infinity or negative infinity.            |
    |     Parameters:                                                                                  |
    |          x DOUBLE to check                                                                       |
    |     RETURNs: boolean, TRUE is x is infinite                                                      |
    |--------------------------------------------------------------------------------------------------|*/

    STACK_VAR LONG hi

    hi                                       = fnMathDoubleHighToBits(x)

    RETURN (hi & $7FF00000) >> 20 == $7FF && !(hi & $FFFFF || fnMathDoubleLowToBits(x))
  }

  DEFINE_FUNCTION CHAR fnMathIsInt(DOUBLE x)
  {
    /*|--------------------------------------------------------------------------------------------------|
    | fnMathIsInt: RETURNs TRUE if the argument has no decimal component, otherwise RETURNs FALSE.     |
    |       +/-Inf and 0 will RETURN TRUE, subnormal and NaN's will RETURN FALSE.                      |
    |     Parameters:                                                                                  |
    |          x DOUBLE to check                                                                       |
    |     RETURNs: boolean, TRUE if x is a mathematical INTEGER                                        |
    |--------------------------------------------------------------------------------------------------|*/

    STACK_VAR CHAR i
    STACK_VAR SINTEGER exp
    STACK_VAR LONG hi
    STACK_VAR LONG m
    STACK_VAR LONG mask

    IF(fnMathIsNaN(x))
    {

      RETURN FALSE
    }

    IF(x >= MATH_TWO_52)
    {

      RETURN TRUE
    }

    IF(abs_value(x) < 1.0)
    {

      RETURN (abs_value(x) == 0)
    }

    hi                                       = fnMathDoubleHighToBits(x)

    exp = type_cast((hi & $7FF00000) >> 20 - 1023)

    IF(exp > 20)
    {
      m                                        = fnMathDoubleLowToBits(x)
    }
    ELSE
    {
      m                                        = hi & $FFFFF
    }

    FOR(i = type_cast(32 + (exp > 20) * 20 - exp); i; i--)
    {

      mask = mask + 1 << (i - 1)
    }

    RETURN (m & mask == 0)
  }

  DEFINE_FUNCTION CHAR fnMathIsNaN(DOUBLE x)
  {
    /*|--------------------------------------------------------------------------------------------------|
    | fnMathIsNaN: Checks if a value is NaN.                                                           |
    |     Parameters:                                                                                  |
    |          x DOUBLE to check                                                                       |
    |     RETURNs: boolean, TRUE is x is NaN                                                           |
    |--------------------------------------------------------------------------------------------------|*/

    STACK_VAR LONG hi

    hi                                       = fnMathDoubleHighToBits(x)

    RETURN (hi & $7FF00000) >> 20 == $7FF && (hi & $FFFFF || fnMathDoubleLowToBits(x))
  }

  DEFINE_FUNCTION CHAR fnMathIsNear(DOUBLE x,
  DOUBLE y)
  {
    /*|--------------------------------------------------------------------------------------------------|
    | fnMathIsNear: Compares two numbers and RETURN TRUE if they are within MATH_PRECISION of each     |
    |       other.                                                                                     |
    |     Parameters:                                                                                  |
    |          x number to compare                                                                     |
    |          y another number to compare to x                                                        |
    |     RETURNs: boolean specifying if x and y are within MATH_PRECISION of each other               |
    |--------------------------------------------------------------------------------------------------|*/

    RETURN abs_value(x - y) <= MATH_PRECISION
  }

  DEFINE_FUNCTION CHAR fnMathIsNumeric(CHAR a[])
  {
    /*|--------------------------------------------------------------------------------------------------|
    | fnMathIsNumeric: Checks if a string value contains only a numeric value.                         |
    |     Parameters:                                                                                  |
    |          a string to check                                                                       |
    |     RETURNs: boolean, TRUE is a is numeric                                                       |
    |--------------------------------------------------------------------------------------------------|*/

    STACK_VAR INTEGER i

    FOR(i = 1; i <= LENGTH_ARRAY(a); i++)
    {

      IF(!(a[i] >= $30 && a[i] <= $39))
      {

        RETURN 0
      }
    }

    RETURN 1
  }

  DEFINE_FUNCTION FLOAT fnMathLogarithm(FLOAT x,
  FLOAT base)
  {
    /*|--------------------------------------------------------------------------------------------------|
    | fnMathLogarithm: Calculate the logarithm of the passed number in the specified base.             |
    |     Parameters:                                                                                  |
    |          x FLOAT to find the log of                                                              |
    |          base base to use                                                                        |
    |     RETURNs: FLOAT containing the passed numbers logarithm                                       |
    |--------------------------------------------------------------------------------------------------|*/

    STACK_VAR FLOAT tmp
    STACK_VAR INTEGER int
    STACK_VAR FLOAT partial
    STACK_VAR FLOAT decimal

    IF(x < 1 && base < 1)
    {

      RETURN -1.0// cannot compute
    }
    tmp                                      = x + 0.0

    WHILE(tmp < 1)
    {
      int                                      = int - 1
      tmp                                      = tmp * base
    }

    WHILE(tmp >= base)
    {
      int                                      = int + 1
      tmp                                      = tmp / base
    }

    partial                                  = 0.5
    tmp                                      = tmp * tmp

    WHILE(!fnMathIsNear(partial, 0))
    {

      IF(tmp >= base)
      {
        decimal                                  = decimal + partial
        tmp                                      = tmp / base
      }

      partial                                  = partial * 0.5
      tmp                                      = tmp * tmp
    }

    RETURN int + decimal
  }

  DEFINE_FUNCTION DOUBLE fnMathLShiftDouble(DOUBLE x)
  {
    /*|--------------------------------------------------------------------------------------------------|

    | fnMathLShiftDouble: Left shift (<<) a DOUBLE 1 bit.                                              |
    |     Parameters:                                                                                  |
    |          x DOUBLE to shift                                                                       |

    |     RETURNs:  passed value << 1                                                                  |
    |--------------------------------------------------------------------------------------------------|*/

    STACK_VAR LONG hi
    STACK_VAR LONG low

    hi                                       = fnMathDoubleHighToBits(x)
    low                                      = fnMathDoubleLowToBits(x)

    hi = (hi & $7FFFFFFF) << 1 + (low & $80000000) >> 15

    low = (low & $7FFFFFFF) << 1

    RETURN fnMathBuildDouble(hi, low)
  }

  DEFINE_FUNCTION FLOAT fnMathMapRange(FLOAT x,
  FLOAT fromMin,
  FLOAT fromMax,
  FLOAT toMin,
  FLOAT toMax)
  {
    /*|--------------------------------------------------------------------------------------------------|
    | fnMathMapRange: Map a value within a set of original bounds to its equivalent given a secondary  |
    |       set of bound.                                                                              |
    |     Parameters:                                                                                  |
    |          x FLOAT to map                                                                          |
    |          fromMin original lower bound                                                            |
    |          fomMax original upper bound                                                             |
    |          toMin lower bound to map to                                                             |
    |          toMax upper bound to map to                                                             |
    |     RETURNs: FLOAT containing x mapped to its equivalent value within he new bounds              |
    |--------------------------------------------------------------------------------------------------|*/

    RETURN (x - fromMin) * (toMax - toMin) / (fromMax - fromMin) + toMin
  }

  DEFINE_FUNCTION FLOAT fnMathNaturalLogarithm(FLOAT x)
  {
    /*|--------------------------------------------------------------------------------------------------|
    | fnMathNaturalLogarithm: Calculate the natural logarithm of the passed number.                    |
    |     Parameters:                                                                                  |
    |          x FLOAT to find the natural log of                                                      |
    |     RETURNs: FLOAT containing the passed numbers log base e                                      |
    |--------------------------------------------------------------------------------------------------|*/

    RETURN fnMathLogarithm(x, MATH_E)
  }

  DEFINE_FUNCTION FLOAT fnMathPower(FLOAT x,
  INTEGER n)
  {
    /*|--------------------------------------------------------------------------------------------------|
    | fnMathPower: Calculate x raised to the n.                                                        |
    |     Parameters:                                                                                  |
    |          x FLOAT to find the natural log of                                                      |
    |          n power to raise x to                                                                   |
    |     RETURNs: FLOAT containing the x^n                                                            |
    |--------------------------------------------------------------------------------------------------|*/

    STACK_VAR FLOAT result
    STACK_VAR FLOAT base
    STACK_VAR INTEGER exp

    result                                   = 1.0
    base                                     = x + 0.0
    exp                                      = n + 0

    WHILE(exp > 0)
    {
      IF(exp & 1)
      {
        result                                   = result * base
        exp                                      = exp - 1
      }

      base                                     = base * base
      exp                                      = type_cast(fnMathRound(exp * 0.5))
    }

    RETURN result
  }

  DEFINE_FUNCTION DOUBLE fnMathRandom()
  {
    /*|--------------------------------------------------------------------------------------------------|
    | fnMathRandom: RETURNs a DOUBLE value with a positive sign, greater than or equal to 0.0 and      |
    |       less than 1.0.                                                                             |
    |     RETURNs: pseudofnMathRandom DOUBLE greater than or equal to 0.0 and less than 1.0            |
    |--------------------------------------------------------------------------------------------------|*/

    STACK_VAR CHAR i
    STACK_VAR LONG hi
    STACK_VAR LONG low

    FOR(i                                    = 32; i; i--)
    {

      low = low + RANDOM_NUMBER(2) << (i - 1)
    }
    FOR(i                                    = 20; i; i--)
    {

      hi = hi + RANDOM_NUMBER(2) << (i - 1)
    }

    hi = hi + 1023 << 20

    RETURN fnMathBuildDouble(hi, low) - 1
  }

  DEFINE_FUNCTION LONG fnMathRawBEtoLong(CHAR x[4])
  {
    /*|--------------------------------------------------------------------------------------------------|
    | fnMathRawBEtoLong: Load 4 bytes of Big Endian data contained in a CHARacter array into a LONG.   |
    |    Note: Array position 1 should contain MSB.                                                    |
    |     Parameters:                                                                                  |
    |          x 4 byte CHARacter array containing the data to load                                    |
    |     RETURNs: LONG filled with the passed data                                                    |
    |--------------------------------------------------------------------------------------------------|*/

    RETURN x[1] << 24 + x[2] << 16 + x[3] << 8 + x[4]
  }

  DEFINE_FUNCTION LONG fnMathRawLEtoLong(CHAR x[4])
  {
    /*|--------------------------------------------------------------------------------------------------|
    | fnMathRawLEtoLong: Load 4 bytes of Little Endian data contained in a CHARacter array into a      |
    |       LONG.                                                                                      |
    |    Note: Array position 4 should contain MSB / position 1 should contain LSB                     |
    |     Parameters:                                                                                  |
    |          x 4 byte CHARacter array containing the data to load                                    |
    |     RETURNs: LONG filled with the passed data                                                    |
    |--------------------------------------------------------------------------------------------------|*/

    RETURN x[4] << 24 + x[3] << 16 + x[2] << 8 + x[1]
  }

  DEFINE_FUNCTION DOUBLE fnMathRound(DOUBLE x)
  {
    /*|--------------------------------------------------------------------------------------------------|
    | fnMathRound: Rounds a flouting point number to it's closest whole number.                        |
    |     Parameters:                                                                                  |
    |          x DOUBLE to fnMathRound                                                                 |
    |     RETURNs: DOUBLE containing the fnMathRounded number                                          |
    |--------------------------------------------------------------------------------------------------|*/

    RETURN fnMathFloor(x + 0.5)
  }

  DEFINE_FUNCTION DOUBLE fnMathRShiftDouble(DOUBLE x)
  {
    /*|--------------------------------------------------------------------------------------------------|

    | fnMathRShiftDouble: Right shift (>>) a DOUBLE 1 bit.                                             |
    |     Parameters:                                                                                  |
    |          x DOUBLE to shift                                                                       |

    |     RETURNs: passed value >> 1                                                                   |
    |--------------------------------------------------------------------------------------------------|*/

    STACK_VAR LONG hi
    STACK_VAR LONG low

    hi                                       = fnMathDoubleHighToBits(x)
    low                                      = fnMathDoubleLowToBits(x)

    low = low >> 1 + (hi & 1) << 15

    hi = hi >> 1

    RETURN fnMathBuildDouble(hi, low)
  }

  DEFINE_FUNCTION DOUBLE fnMathSquareRoot(DOUBLE x)
  {
    /*|--------------------------------------------------------------------------------------------------|
    | fnMathSquareRoot: Calculate the square root of the passed number. This function takes a log base |
    |       2 approximation then iterates a Babylonian refinement until the answer is within the       |
    |       math libraries defined precision or exceeds 1000 steps of refinement.                      |
    |     Parameters:                                                                                  |
    |          x DOUBLE to find the square root of                                                     |
    |     RETURNs: DOUBLE containing the square root                                                   |
    |--------------------------------------------------------------------------------------------------|*/

    STACK_VAR LONG hi
    STACK_VAR LONG low
    STACK_VAR DOUBLE i
    STACK_VAR DOUBLE tmp

    IF(x < 0)
    {

      RETURN MATH_NaN
    }

    IF(x == 0 ||

    x == 1 ||
    fnMathIsNaN(x) ||
    fnMathIsInfinite(x))
    {

      RETURN x
    }

    tmp                                      = fnMathRShiftDouble(x)

    hi = 1 << 29 + fnMathDoubleHighToBits(tmp) - 1 << 19
    low                                      = fnMathDoubleLowToBits(tmp)
    tmp                                      = fnMathBuildDouble(hi, low)

    WHILE(!fnMathIsNear(tmp * tmp, x) && i < 1000)
    {
      tmp                                      = 0.5 * (tmp + x / tmp)
      i++
    }

    RETURN tmp
  }

  DEFINE_FUNCTION CHAR[STRING_RETURN_SIZE_LIMIT] fnStringConcatenate(CHAR a[],
  CHAR b[])
  {
    /*|--------------------------------------------------------------------------------------------------|
    | fnStringConcatenate: Concatenates String a to String b and RETURNs the result                    |
    |--------------------------------------------------------------------------------------------------|*/

    RETURN "a,b"
  }

  DEFINE_FUNCTION INTEGER fnStringExplode(CHAR delim,
  CHAR a[],
  CHAR ret[][],
  INTEGER ret_len)
  {
    /*|--------------------------------------------------------------------------------------------------|
    | fnStringExplode: Explodes a string with a CHAR delimiter into an array of strings.               |
    |       The fnStringExploded data will be placed into ret[]. Due to NetLinx bugs, you must specify |
    |       the length of ret in ret_len if you want the RETURNed array sanitized.                     |
    |     Parameters:                                                                                  |
    |          delim delimiter to use for the exploding                                                |
    |          a string array to fnStringExplode                                                       |
    |          ret RETURNed fnStringExploded string array of string arrays                             |
    |          ret_len amount of entries in ret[][]; pass 0 if you don't care about sanitizing ret[][] |
    |     RETURNs: the amount of entries stuffed into ret[][]                                          |
    |--------------------------------------------------------------------------------------------------|*/

    RETURN fnStringExplodeQuoted(delim, a, ret, ret_len, 0)
  }

  DEFINE_FUNCTION INTEGER fnStringExplodeQuoted(CHAR delim,
  CHAR a[],
  CHAR ret[][],
  INTEGER ret_len,
  CHAR quote)
  {
    /*|--------------------------------------------------------------------------------------------------|
    | fnStringExplodeQuoted: Explodes a string with a CHAR delimiter into an array of strings. The     |
    |       fnStringExploded data will be placed into ret[]. Honours quotes; a CHARacter passed as     |
    |       quote (such asDOUBLE quotes) are treated as one segment.                                   |
    |   WARNING: Due to NetLinx bugs, you must specify the length of ret in ret_len if you want the    |
    |       RETURNed array sanitized.                                                                  |
    |     Parameters:                                                                                  |
    |          delim delimiter to use for the exploding                                                |
    |          a string array to fnStringExplode                                                       |
    |          ret RETURNed fnStringExploded string array of string arrays                             |
    |          ret_len amount of entries in ret[][]; pass 0 if you don't  care about sanitizing ret[][]|
    |          quote CHARacter to use as a quote                                                       |
    |     RETURNs: the amount of entries stuffed into ret[][]                                          |
    |--------------------------------------------------------------------------------------------------|*/

    STACK_VAR INTEGER i
    STACK_VAR INTEGER start
    STACK_VAR INTEGER end

    start                                    = 1
    i                                        = 1

    WHILE(start <= LENGTH_ARRAY(a))
    {
      IF(quote)
      {

        IF(a[start] == quote)
        {// handle quotes
          end                                      = FIND_STRING(a, "quote", start + 1)
          IF(end)
          {
            ret[i]                                   = MID_STRING(a, start + 1, (end - start) - 1)
            i++

            start                                    = end + 1
            continue
          }
        }
      }

      end                                      = FIND_STRING(a, "delim", start)// nothing ELSE stopping us?
      IF(end)
      {// then seperate by delimiter
        ret[i]                                   = MID_STRING(a, start, (end - start))
        i++

        start                                    = end + 1
      }
      ELSE
      {
        ret[i]                                   = MID_STRING(a, start, LENGTH_ARRAY(a))

        start                                    = LENGTH_ARRAY(a) + 1
      }
    }

    FOR(start = i + 1; start <= ret_len; start++)
    {
      ret[start]                               = ''
    }

    RETURN i
  }

  DEFINE_FUNCTION INTEGER fnStringFindMulti(CHAR haystack[],
  CHAR needles[][],
  INTEGER start)
  {
    /*|--------------------------------------------------------------------------------------------------|
    | fnStringFindMulti: Search through a string for a match against a list of possible sub-strings    |
    |       and RETURN the element index of the matched string                                         |
    |     Parameters:                                                                                  |
    |          haystack string to search                                                               |
    |          needles list of sub-strings to match                                                    |
    |          start array element to begin searching from                                             |
    |     RETURNs: an INTEGER containing the the element index of needles that was matched (0 if not   |
    |       found)                                                                                     |
    |--------------------------------------------------------------------------------------------------|*/

    STACK_VAR INTEGER i
    STACK_VAR INTEGER len

    len                                      = LENGTH_ARRAY(needles)

    FOR(i = start; i <= len; i++)
    {
      IF(FIND_STRING(haystack, needles[i], 1))
      {

        RETURN i
      }
    }

    RETURN 0
  }

  DEFINE_FUNCTION CHAR[STRING_RETURN_SIZE_LIMIT] fnStringRemoveStringByLength(
  CHAR a[],
  INTEGER len)
  {
    /*|--------------------------------------------------------------------------------------------------|
    | fnStringRemoveStringByLength: RETURNs the left sub-strings of a string up to the specified       |
    |       number of CHARacters.                                                                      |
    |   WARNING: this is a destructive removal - the RETURNed sub-strings will be removed from         |
    |       string 'a'.                                                                                |
    |     Parameters:                                                                                  |
    |          a string to remove the sub-string from  \\                                              |
    |          len number of CHARacters to remove                                                      |
    |     RETURNs: string containing the first 'len' CHARacters of 'a'                                 |
    |--------------------------------------------------------------------------------------------------|*/

    IF(len > STRING_RETURN_SIZE_LIMIT)
    {

      RETURN fnStringSizeError()
    }

    RETURN REMOVE_STRING(a, LEFT_STRING(a, len), 1)
  }

  DEFINE_FUNCTION CHAR[STRING_RETURN_SIZE_LIMIT] fnStringRightTrim(CHAR a[])
  {
    /*|--------------------------------------------------------------------------------------------------|
    | fnStringRightTrim: RETURNs a copy of the string with the right whitespace removed. If no         |
    |       printable CHARacters are found, an empty string will be RETURNed.                          |
    |     Parameters:                                                                                  |
    |          a string to Right Trim                                                                  |
    |     RETURNs: the string with right whitespace removed                                            |
    |--------------------------------------------------------------------------------------------------|*/

    STACK_VAR INTEGER i
    STACK_VAR INTEGER len

    len                                      = LENGTH_ARRAY(a)

    FOR(i                                    = len; i; i--)
    {

      IF(!fnStringIsWhitespace(a[i]))
      {

        IF(i > STRING_RETURN_SIZE_LIMIT)
        {

          RETURN fnStringSizeError()
        }
        ELSE
        {

          RETURN LEFT_STRING(a, i)
        }
      }
    }
  }

  DEFINE_FUNCTION CHAR[3] fnStringBoolToString(CHAR a)
  {
    /*|--------------------------------------------------------------------------------------------------|

    | fnStringBoolToSTRING: Converts a boolean value to its string equivalent of either a 'ON' or      |
    |       'OFF'.                                                                                     |
    |     Parameters:                                                                                  |
    |          a boolean value to convert                                                              |
    |     RETURNs: string equivalent (as ON/OFF)                                                       |
    |--------------------------------------------------------------------------------------------------|*/

    IF(a)
    {

      RETURN 'ON'
    }
    ELSE
    {

      RETURN 'OFF'
    }
  }

  DEFINE_FUNCTION CHAR[STRING_RETURN_SIZE_LIMIT] fnStringImplode(CHAR strings[][],
  CHAR delim[])
  {
    /*|--------------------------------------------------------------------------------------------------|
    | fnStringImplode: Concatenates elements of an array of strings into a single string with a        |
    |       delimiter string inserted between each item.                                               |
    |     Parameters:                                                                                  |
    |          strings string array to fnStringImplode                                                 |
    |          delim CHARacter string to insert between the fnStringImploded elements                  |
    |     RETURNs: the fnStringImploded string                                                         |
    |--------------------------------------------------------------------------------------------------|*/

    STACK_VAR CHAR ret[STRING_RETURN_SIZE_LIMIT + 1]
    STACK_VAR INTEGER i
    STACK_VAR INTEGER len

    len                                      = LENGTH_ARRAY(strings)
    ret                                      = strings[1]

    IF(len > 1)
    {
      FOR(i                                    = len - 1; i; i--)
      {
        ret                                      = "ret, delim, strings[(len - i) + 1]"
      }
    }

    IF(LENGTH_ARRAY(ret) > STRING_RETURN_SIZE_LIMIT)
    {

      RETURN fnStringSizeError()
    }

    RETURN ret
  }

  DEFINE_FUNCTION CHAR[STRING_RETURN_SIZE_LIMIT] fnStringIntArrayToString(
  INTEGER ints[],
  CHAR delim[])
  {
    /*|--------------------------------------------------------------------------------------------------|

    | fnStringIntArrayToSTRING: Converts an INTEGER array into a comma separated string list of its    |
    |       values.                                                                                    |
    |     Parameters:                                                                                  |
    |          ints INTEGER array of values to 'listify'                                               |
    |          delim string array to insert between entries                                            |
    |     RETURNs: string list of the values                                                           |
    |--------------------------------------------------------------------------------------------------|*/

    STACK_VAR CHAR list[STRING_RETURN_SIZE_LIMIT + 1]
    STACK_VAR INTEGER i
    STACK_VAR INTEGER len
    STACK_VAR INTEGER item

    len                                      = LENGTH_ARRAY(ints)

    list                                     = ITOA(ints[1])

    IF(len > 1)
    {
      FOR(i                                    = len - 1; i; i--)
      {
        item                                     = (len - i) + 1
        list                                     = "list, delim, ITOA(ints[item])"
      }
    }

    IF(LENGTH_ARRAY(list) > STRING_RETURN_SIZE_LIMIT)
    {

      RETURN fnStringSizeError()
    }

    RETURN list
  }

  DEFINE_FUNCTION INTEGER fnStringIsPrintableCHAR(CHAR a)
  {
    /*|--------------------------------------------------------------------------------------------------|
    | fnStringIsPrintableCHAR: Checks to see if the passed CHARacter is a printable ASCII CHARacter.   |
    |     Parameters:                                                                                  |
    |          a CHARacter to check                                                                    |
    |     RETURNs: boolean value specifying whether it is printable                                    |
    |--------------------------------------------------------------------------------------------------|*/

    RETURN a > $20 && a <= $7E
  }

  DEFINE_FUNCTION INTEGER fnStringIsPrintable(CHAR a[])
  {
    /*|--------------------------------------------------------------------------------------------------|
    | fnStringIsPrintable: Checks to see if the passed string is all printable ASCII CHARacters.       |
    |     Parameters:                                                                                  |
    |          a string to check                                                                       |
    |     RETURNs: boolean value specifying whether it is printable                                    |
    |--------------------------------------------------------------------------------------------------|*/

    STACK_VAR INTEGER i
    STACK_VAR INTEGER len

    len                                      = LENGTH_ARRAY(a)

    FOR(i = 1; i <= len; i++)
    {

      IF(!fnStringIsPrintableCHAR(a[i]))
      {

        RETURN FALSE
      }
    }

    RETURN TRUE
  }

  DEFINE_FUNCTION CHAR fnStringIsWhitespace(CHAR a)
  {
    /*|--------------------------------------------------------------------------------------------------|
    | fnStringIsWhitespace: Checks to see if the passed CHARacter is a whitespace CHARacter.           |
    |     Parameters:                                                                                  |
    |          a CHARacter to check                                                                    |
    |     RETURNs: boolean value specifying whether the CHARacter is  whitespace                       |
    |--------------------------------------------------------------------------------------------------|*/

    RETURN (a >= $09 && a <= $0D) || (a >= $1C && a <= $20)
  }

  DEFINE_FUNCTION CHAR[STRING_RETURN_SIZE_LIMIT] fnStringLeftTrim(CHAR a[])
  {
    /*|--------------------------------------------------------------------------------------------------|
    | fnStringLeftTrim: RETURNs a copy of the string with the left whitespace removed. If no printable |
    |       CHARacters are found, an empty string will be RETURNed.                                    |
    |     Parameters:                                                                                  |
    |          a string to Left Trim                                                                   |
    |     RETURNs: the original string with left whitespace removed                                    |
    |--------------------------------------------------------------------------------------------------|*/

    STACK_VAR CHAR ret[STRING_RETURN_SIZE_LIMIT + 1]
    STACK_VAR INTEGER i
    STACK_VAR INTEGER len

    len                                      = LENGTH_ARRAY(a)

    FOR(i = 1; i <= len; i++)
    {

      IF(!fnStringIsWhitespace(a[i]))
      {
        ret                                      = RIGHT_STRING(a, len - i + 1)

        IF(LENGTH_ARRAY(ret) > STRING_RETURN_SIZE_LIMIT)
        {

          RETURN fnStringSizeError()
        }
        ELSE
        {

          RETURN ret
        }
      }
    }
  }

  DEFINE_FUNCTION CHAR[STRING_RETURN_SIZE_LIMIT] fnStringCiGetBetween(CHAR a[],
  CHAR left[], CHAR right[])
  {
    /*|--------------------------------------------------------------------------------------------------|
    | fnStringCiGetBetween: Gets the first instance of a string contained within the bounds of two     |

    |       sub-strings CASE insensitive                                                               |
    |     Parameters:                                                                                  |
    |          a string to split, max size is 100 kilobytes                                            |
    |          left CHARacter sequence marking the left bound                                          |
    |          right CHARacter sequence marking the right bound                                        |
    |     RETURNs: string contained within the boundary sequences                                      |
    |--------------------------------------------------------------------------------------------------|*/

    RETURN fnStringGetBetweenEx(a, left, right, FALSE)
  }

  DEFINE_FUNCTION CHAR[10] fnStringDateInvert(CHAR a[])
  {
    /*|--------------------------------------------------------------------------------------------------|
    | fnStringDateInvert: SWITCHes the day and month fields of a date string (for converting between   |
    |       US and international standards). for example 05/28/2009 becomes 28/05/2009.                |
    |     Parameters:                                                                                  |
    |          a string representation of a date in the form xx/xx/xxxx                                |
    |     RETURNs: string representing the same date with the first two components reversed            |
    |--------------------------------------------------------------------------------------------------|*/

    STACK_VAR INTEGER idx
    STACK_VAR CHAR comp[3][4]

    FOR(idx                                  = 3; idx; idx--)
    {
      comp[idx]                                = fnStringGetListItem(a, "'/'", idx)
    }

    RETURN "comp[2], '/', comp[1], '/', comp[3]"
  }

  DEFINE_FUNCTION CHAR fnStringEndsWith(CHAR a[],
  CHAR search[])
  {
    /*|--------------------------------------------------------------------------------------------------|
    | fnStringEndsWith: Check is a string end with another string.                                     |
    |     Parameters:                                                                                  |
    |          a string to check                                                                       |
    |          sub-strings to search for                                                               |
    |     RETURNs: boolean, TRUE if 'a' ends with 'search'                                             |
    |--------------------------------------------------------------------------------------------------|*/

    RETURN RIGHT_STRING(a, LENGTH_ARRAY(search)) == search;
  }

  DEFINE_FUNCTION CHAR[STRING_RETURN_SIZE_LIMIT] fnStringGetBetween(CHAR a[],
  CHAR left[],
  CHAR right[])
  {
    /*|--------------------------------------------------------------------------------------------------|
    | fnStringGetBetween: Gets the first instance of a string contained within the bounds of two       |

    |       sub-strings CASE sensitive                                                                 |
    |     Parameters:                                                                                  |
    |          a string to split                                                                       |
    |          left CHARacter sequence marking the left bound                                          |
    |          right CHARacter sequence marking the right bound                                        |
    |     RETURNs: string contained within the boundary sequences                                      |
    |--------------------------------------------------------------------------------------------------|*/

    RETURN fnStringGetBetweenEx(a, left, right, TRUE)
  }

  DEFINE_FUNCTION CHAR[5] fnIntTRUEFALSE(INTEGER n)
  {
    IF(n)
    {

      RETURN 'TRUE'
    }

    RETURN 'FALSE'
  }

  DEFINE_FUNCTION CHAR[STRING_RETURN_SIZE_LIMIT] fnStringGetBetweenEx(CHAR a[],
  CHAR left[],
  CHAR right[],
  CHAR cs)
  {
    /*|--------------------------------------------------------------------------------------------------|
    | fnStringGetBetweenEx: Gets the first instance of a string contained within the bounds of two     |

    |       sub-strings CASE sensitive                                                                 |
    |     Parameters:                                                                                  |
    |          a string to split                                                                       |
    |          left CHARacter sequence marking the left bound                                          |
    |          right CHARacter sequence marking the right bound                                        |

    |          cs TRUE for CASE sensitive search                                                       |
    |     RETURNs: string contained within the boundary sequences                                      |
    |--------------------------------------------------------------------------------------------------|*/

    STACK_VAR INTEGER start
    STACK_VAR INTEGER end
    STACK_VAR INTEGER retlen

    IF(TRUE == cs)
    {
      start                                    = FIND_STRING(a, left, 1) + LENGTH_ARRAY(left)
      end                                      = FIND_STRING(a, right, start)
    }
    ELSE
    {
      start                                    = FIND_STRING(LOWER_STRING(a), LOWER_STRING(left), 1) + LENGTH_ARRAY(left)
      end                                      = FIND_STRING(LOWER_STRING(a), LOWER_STRING(right), start)
    }

    retlen                                   = end - start

    IF(retlen > STRING_RETURN_SIZE_LIMIT)
    {

      RETURN fnStringSizeError()
    }

    RETURN MID_STRING(a, start, retlen)
  }

  DEFINE_FUNCTION CHAR[STRING_RETURN_SIZE_LIMIT] fnStringGetKey(CHAR a[],
  CHAR delim[])
  {
    /*|--------------------------------------------------------------------------------------------------|
    | fnStringGetKey: Gets the key from a single key/value pair string with the specified delimiter.   |
    |     Parameters:                                                                                  |
    |          a string containing a key/value pair                                                    |
    |          delim string which divides the key and value                                            |
    |     RETURNs: string containing the key component                                                 |
    |--------------------------------------------------------------------------------------------------|*/

    STACK_VAR INTEGER pos
    STACK_VAR INTEGER retlen

    pos                                      = FIND_STRING(a, delim, 1)

    IF(pos)
    {
      retlen                                   = pos - 1
    }
    ELSE
    {
      retlen                                   = LENGTH_ARRAY(a)
    }

    IF(retlen > STRING_RETURN_SIZE_LIMIT)
    {

      RETURN fnStringSizeError()
    }

    RETURN LEFT_STRING(a, retlen)
  }

  DEFINE_FUNCTION CHAR[STRING_RETURN_SIZE_LIMIT] fnStringGetListItem(CHAR a[],
  CHAR delim[],
  INTEGER item)
  {
    /*|--------------------------------------------------------------------------------------------------|
    | fnStringGetListItem: Gets an item from a string list. This can be used to grab word n within a   |
    |       string by passing 'space' as the delimiter.                                                |
    |     Parameters:                                                                                  |
    |          a string to split                                                                       |
    |          delim CHARacter string which divides the list entries                                   |
    |          item item number to RETURN                                                              |
    |     RETURNs: string array the requested list item                                                |
    |--------------------------------------------------------------------------------------------------|*/

    STACK_VAR INTEGER ret
    STACK_VAR INTEGER i
    STACK_VAR INTEGER start
    STACK_VAR INTEGER end

    FOR(i = 1; i <= item; i++)
    {
      start                                    = end + 1
      end                                      = FIND_STRING(a, delim, start)
    }

    IF(!end)
    {
      end                                      = LENGTH_ARRAY(a) + 1
    }

    ret                                      = end - start

    IF(ret > STRING_RETURN_SIZE_LIMIT)
    {

      RETURN fnStringSizeError()
    }

    RETURN MID_STRING(a, start, ret)
  }

  DEFINE_FUNCTION CHAR[STRING_RETURN_SIZE_LIMIT] fnStringGetValue(CHAR a[],
  CHAR delim[])
  {
    /*|--------------------------------------------------------------------------------------------------|
    | fnStringGetValue: Gets the value from a key/value pair string with the specified delimiter.      |
    |     Parameters:                                                                                  |
    |          a string containing a key/value pair                                                    |
    |          delim string which divides the key and value                                            |
    |     RETURNs: string containing the value component                                               |
    |--------------------------------------------------------------------------------------------------|*/

    STACK_VAR INTEGER pos
    STACK_VAR INTEGER retlen

    pos                                      = FIND_STRING(a, delim, 1)

    retlen                                   = LENGTH_ARRAY(a) - (pos + LENGTH_ARRAY(delim) - 1)

    IF(retlen > STRING_RETURN_SIZE_LIMIT)
    {

      RETURN fnStringSizeError()
    }

    RETURN RIGHT_STRING(a, retlen)
  }

  DEFINE_FUNCTION INTEGER fnStringIsEqualsIgnoreCase(CHAR c1[],
  CHAR c2[])
  {

    RETURN (UPPER_STRING(c1) == UPPER_STRING(c2))
  }

  DEFINE_FUNCTION CHAR[STRING_RETURN_SIZE_LIMIT] fnStringPrefixToLength(
  CHAR a[], CHAR value, INTEGER len)
  {
    /*|--------------------------------------------------------------------------------------------------|
    | fnStringPrefixToLength: RETURNs a string prefixed with a specified value, up to a specified      |
    |       length.  If the string is the same size or is larger than the specified length, RETURNs    |
    |       the original string.                                                                       |
    |     Parameters:                                                                                  |
    |          a string to prefix                                                                      |
    |          value value to prefix on the string                                                     |
    |          len requested length of the string                                                      |
    |     RETURNs: string prefixed to length len with value                                            |
    |--------------------------------------------------------------------------------------------------|*/

    STACK_VAR CHAR ret[STRING_RETURN_SIZE_LIMIT]
    STACK_VAR INTEGER i

    IF(len > STRING_RETURN_SIZE_LIMIT ||

    LENGTH_ARRAY(a) > STRING_RETURN_SIZE_LIMIT)
    {

      RETURN fnStringSizeError()
    }

    IF(LENGTH_ARRAY(a) < len)
    {

      FOR(i = LENGTH_ARRAY(a); i < len; i++)
      {
        ret                                      = "value, ret"
      }
    }

    RETURN "ret, a"
  }

  DEFINE_FUNCTION CHAR[STRING_RETURN_SIZE_LIMIT] fnStringReplace(CHAR a[],
  CHAR search[], CHAR replace[])
  {
    /*|--------------------------------------------------------------------------------------------------|
    | fnStringReplace: Replace all occurrences of a sub-strings with another string.                   |
    |     Parameters:                                                                                  |
    |          a string to search                                                                      |
    |          search sub-strings to replace                                                           |
    |          replace replacement sub-string                                                          |
    |     RETURNs: 'a' with all occurrences of 'search' replaced by the contents of 'replace'          |
    |--------------------------------------------------------------------------------------------------|*/

    STACK_VAR INTEGER start
    STACK_VAR INTEGER end
    STACK_VAR CHAR ret[STRING_RETURN_SIZE_LIMIT]

    IF(LENGTH_ARRAY(a) > STRING_RETURN_SIZE_LIMIT)
    {

      RETURN fnStringSizeError()
    }

    start                                    = 1
    end                                      = FIND_STRING(a, search, start)

    WHILE(end)
    {
      ret                                      = "ret, MID_STRING(a, start, end - start), replace"
      start                                    = end + LENGTH_ARRAY(search)
      end                                      = FIND_STRING(a, search, start)
    }

    ret                                      = "ret, RIGHT_STRING(a, LENGTH_ARRAY(a) - start + 1)"

    RETURN ret
  }

  DEFINE_FUNCTION CHAR[STRING_RETURN_SIZE_LIMIT] fnStringReverse(CHAR a[])
  {
    /*|--------------------------------------------------------------------------------------------------|
    | fnStringReverse: Reverse a string.                                                               |
    |     Parameters:                                                                                  |
    |          a string to reverse                                                                     |
    |     RETURNs: the contents of 'a' with the CHARacter order reversed                               |
    |--------------------------------------------------------------------------------------------------|*/

    STACK_VAR INTEGER i
    STACK_VAR INTEGER len
    STACK_VAR CHAR ret[STRING_RETURN_SIZE_LIMIT]

    len                                      = LENGTH_ARRAY(a)

    IF(len > STRING_RETURN_SIZE_LIMIT)
    {

      RETURN fnStringSizeError()
    }

    FOR(i                                    = len; i; i--)
    {
      ret[(len - i) + 1]                       = a[i];
    }

    SET_LENGTH_ARRAY(ret, len);

    RETURN ret
  }

  DEFINE_FUNCTION CHAR[1] fnStringSizeError()
  {
    /*|--------------------------------------------------------------------------------------------------|
    | fnStringSizeError: Callback triggered when a function within this string processing library      |
    |       attempts to process anything that will result in a RETURN size greater than that defined   |
    |       by STRING_RETURN_SIZE_LIMIT.                                                               |
    |  Anything RETURNed by this will be used as the RETURN of the function that caused the error.     |
    |     RETURNs: An error string.                                                                    |
    |--------------------------------------------------------------------------------------------------|*/

    fnIOPrintln("'Maximum RETURN size too small in String.axi'")

    RETURN ''
  }

  DEFINE_FUNCTION CHAR fnStringStartsWith(CHAR a[],
  CHAR search[])
  {
    /*|--------------------------------------------------------------------------------------------------|
    | fnStringStartsWith Check is a string starts with another string.                                 |
    |     Parameters:                                                                                  |
    |          a string to check                                                                       |
    |          sub-strings to search for                                                               |
    |     RETURNs: boolean, TRUE if 'a' begins with 'search'}                                          |
    |--------------------------------------------------------------------------------------------------|*/

    RETURN LEFT_STRING(a, LENGTH_ARRAY(search)) == search;
  }

  DEFINE_FUNCTION CHAR[STRING_RETURN_SIZE_LIMIT] fnStringSuffixToLength(
  CHAR a[],
  CHAR value,
  INTEGER len)
  {
    /*|--------------------------------------------------------------------------------------------------|
    | fnStringSuffixToLength: RETURNs a string suffixed with a specified value, up to a specified      |
    |       length. If the string is the same size or is larger than the specified length, RETURNs     |
    |       the original string.                                                                       |
    |     Parameters:                                                                                  |
    |          a string to suffix                                                                      |
    |          value value to suffix on the string                                                     |
    |          len requested length of the string                                                      |
    |     RETURNs: string suffixed to length len with value                                            |
    |--------------------------------------------------------------------------------------------------|*/

    STACK_VAR CHAR ret[STRING_RETURN_SIZE_LIMIT]
    STACK_VAR INTEGER i

    IF(len > STRING_RETURN_SIZE_LIMIT ||

    LENGTH_ARRAY(a) > STRING_RETURN_SIZE_LIMIT)
    {

      RETURN fnStringSizeError()
    }

    IF(LENGTH_ARRAY(a) < len)
    {

      FOR(i = LENGTH_ARRAY(a); i < len; i++)
      {
        ret                                      = "value, ret"
      }
    }

    RETURN "a, ret"
  }

  DEFINE_FUNCTION CHAR fnStringToBool(CHAR a[])
  {
    /*|--------------------------------------------------------------------------------------------------|
    | fnStringToBool: Converts common string representations of boolean values into their boolean      |
    |       value equivalents.                                                                         |
    |     Parameters:                                                                                  |
    |          a string representing a boolean value                                                   |
    |     RETURNs: boolean value equivalent                                                            |
    |--------------------------------------------------------------------------------------------------|*/

    STACK_VAR CHAR tmp[8]

    tmp                                      = LOWER_STRING(fnStringLeftTrim(a))

    IF(tmp == 'on' || tmp == 'TRUE' || tmp == 'yes'  || tmp == 'y' || tmp == '1')
    {

      RETURN TRUE
    }
    ELSE
    {

      RETURN FALSE
    }
  }

  DEFINE_FUNCTION CHAR[STRING_RETURN_SIZE_LIMIT] fnStringTruncate(CHAR a[],
  INTEGER len)
  {
    /*|--------------------------------------------------------------------------------------------------|
    | fnStringTruncate: RETURNs a string truncated to a specific length. If the string is less than    |
    |       the length specified the original string is RETURNed. If it is truncated an ellipsis will  |
    |       be appended.                                                                               |
    |     Parameters:                                                                                  |
    |          a string to truncate                                                                    |
    |          len requested length of the string                                                      |
    |     RETURNs: string truncated to a maximum len CHARacters                                        |
    |--------------------------------------------------------------------------------------------------|*/

    RETURN fnStringTruncateEx(a, "$85", len)
  }

  DEFINE_FUNCTION CHAR[STRING_RETURN_SIZE_LIMIT] fnStringTruncateEx(
  CHAR a[],
  CHAR value[],
  INTEGER len)
  {
    /*|--------------------------------------------------------------------------------------------------|
    | fnStringTruncateEx: RETURNs a string truncated to a specific length. If the string is less than  |
    |       the length specified the original string is RETURN. If it is truncated to contents of      |
    |       value is appended to the truncated string.                                                 |
    |     Parameters:                                                                                  |
    |          a string to truncate                                                                    |
    |          value value to suffix on the string if truncated                                        |
    |          len requested length of the string                                                      |
    |     RETURNs: string truncated to a maximum len CHARacters                                        |
    |--------------------------------------------------------------------------------------------------|*/

    IF(len > STRING_RETURN_SIZE_LIMIT ||

    LENGTH_ARRAY(a) > STRING_RETURN_SIZE_LIMIT)
    {

      RETURN fnStringSizeError()
    }

    IF(LENGTH_ARRAY(a) > len)
    {

      RETURN "LEFT_STRING(a, len - LENGTH_ARRAY(value)), value"
    }
    ELSE
    {

      RETURN a
    }
  }

  DEFINE_FUNCTION CHAR[STRING_RETURN_SIZE_LIMIT] fnStringUcfirst(CHAR a[])
  {
    /*|--------------------------------------------------------------------------------------------------|
    | fnStringUcfirst: RETURNs a copy of a string with the first alpha CHARacter capitalized. Non      |

    |       alpha CHARacters are not modified. Pass a LOWER_STRING()'d string to lowerCASE all         |
    |       other CHARacters.                                                                          |
    |     Parameters:                                                                                  |
    |          a string to capitalize first CHARacters of                                              |
    |     RETURNs: capitalized string                                                                  |
    |--------------------------------------------------------------------------------------------------|*/

    IF(LENGTH_ARRAY(a) > STRING_RETURN_SIZE_LIMIT)
    {

      RETURN fnStringSizeError()
    }

    IF(a[1] >= $61 && a[1] <= $7A)
    {

      RETURN "a[1] - $20, MID_STRING(a, 2, STRING_RETURN_SIZE_LIMIT)"
    }

    RETURN a
  }

  DEFINE_FUNCTION CHAR[STRING_RETURN_SIZE_LIMIT] fnStringUcwords(CHAR a[])
  {
    /*|--------------------------------------------------------------------------------------------------|
    | fnStringUcwords: RETURNs a copy of a string with the first alpha CHARacter in each word          |
    |       capitalized. Non alpha CHARacters are not modified. Pass a LOWER_STRING()'d string to      |

    |       lower CASE all other CHARacters.                                                           |
    |     Parameters:                                                                                  |
    |          a string to capitalize first CHARacters of                                              |
    |     RETURNs: capitalized string                                                                  |
    |--------------------------------------------------------------------------------------------------|*/

    STACK_VAR CHAR ret[STRING_RETURN_SIZE_LIMIT]
    STACK_VAR INTEGER i

    IF(LENGTH_ARRAY(a) > STRING_RETURN_SIZE_LIMIT)
    {

      RETURN fnStringSizeError()
    }

    ret                                      = a

    FOR(i = 1; i < LENGTH_ARRAY(ret); i++)
    {
      IF(fnStringIsWhitespace(ret[i]))
      {

        IF(ret[i + 1] >= $61 && ret[i + 1] <= $7a)
        {
          ret[i + 1]                               = ret[i + 1] - $20
        }
      }
    }

    RETURN ret
  }

  DEFINE_FUNCTION CHAR[STRING_RETURN_SIZE_LIMIT] fnStripCHARsRight(CHAR a[],
  INTEGER count)
  {
    /*|--------------------------------------------------------------------------------------------------|
    | fnStripCHARsRight: Remove CHARacters from the end of the string.                                 |
    |     Parameters:                                                                                  |
    |          a input string                                                                          |
    |          count number of CHARacters to remove                                                    |
    |     RETURNs: the contents of 'a' with the CHARacters removed                                     |
    |--------------------------------------------------------------------------------------------------|*/

    RETURN LEFT_STRING(a, LENGTH_ARRAY(a) - count)
  }

  DEFINE_FUNCTION CHAR[STRING_RETURN_SIZE_LIMIT] fnStringSubstr(CHAR a[],
  INTEGER start,
  INTEGER count)
  {
    /*|--------------------------------------------------------------------------------------------------|
    | fnStringSubstr: Wrapper method for MID_STRING to bring inline with other programming languages.  |
    |     Parameters:                                                                                  |
    |          a input string                                                                          |
    |          start start location of the substrings                                                  |
    |          count number of CHARacters to extract                                                   |
    |     RETURNs: MID_STRING(a, start, count)                                                         |
    |--------------------------------------------------------------------------------------------------|*/

    RETURN MID_STRING(a, start, count);
  }

  DEFINE_FUNCTION CHAR[STRING_RETURN_SIZE_LIMIT] fnStringSubstring(CHAR a[],
  INTEGER start,
  INTEGER end)
  {
    /*|--------------------------------------------------------------------------------------------------|

    | fnStringSubSTRING: Alternative to fnStringSubstr which allows an end location to be specified    |
    |       instead of a count                                                                         |
    |     Parameters:                                                                                  |
    |          a input string                                                                          |
    |          start start location of the sub-strings                                                 |
    |          end end location of the sub-strings                                                     |
    |     RETURNs: fnStringSubstr(a, start, end-start+1)                                               |
    |--------------------------------------------------------------------------------------------------|*/

    RETURN fnStringSubstr(a, start, end-start+1);
  }

  DEFINE_FUNCTION CHAR[STRING_RETURN_SIZE_LIMIT] fnStringSubstringEx(CHAR a[],
  INTEGER start)
  {
    /*|--------------------------------------------------------------------------------------------------|
    | fnStringSubstringEx: RETURNs a substring beginning at specified location to end of string        |
    |     Parameters:                                                                                  |
    |          a input string                                                                          |
    |          start start location of the sub-strings                                                 |
    |     RETURNs: fnStringSubstr(a, start, end-start+1)                                               |
    |--------------------------------------------------------------------------------------------------|*/

    RETURN fnStringSubstring(a, start, LENGTH_ARRAY(a));
  }

  DEFINE_FUNCTION CHAR[STRING_RETURN_SIZE_LIMIT] fnStringTrim(CHAR a[])
  {
    /*|--------------------------------------------------------------------------------------------------|
    | fnStringTrim: RETURNs a copy of the string with the whitespace removed. If no printable          |
    |       CHARacters are found, an empty string will be RETURNed.                                    |
    |     Parameters:                                                                                  |
    |          a string to fnStringLeftTrim                                                            |
    |     RETURNs: the original string with whitespace removed                                         |
    |--------------------------------------------------------------------------------------------------|*/

    RETURN fnStringLeftTrim(fnStringRightTrim(a))
  }

  DEFINE_FUNCTION CHAR[STRING_RETURN_SIZE_LIMIT] fnStringUrlEncode(CHAR a[])
  {
    /*|--------------------------------------------------------------------------------------------------|
    | fnStringUrlEncode: RETURNs a url-encoded string according to RFC 1736 / RFC 2732.                |
    |     Parameters:                                                                                  |
    |          a string to fnStringUrlEncode                                                           |
    |     RETURNs: string fnStringUrlEncoded                                                           |
    |--------------------------------------------------------------------------------------------------|*/

    STACK_VAR CHAR ret[STRING_RETURN_SIZE_LIMIT + 1]
    STACK_VAR INTEGER i

    FOR(i = 1; i <= LENGTH_ARRAY(a); i++)
    {

      IF((a[i] >= $30 && a[i] <= $39) ||// numerics

      (a[i] >= $41 && a[i] <= $5a) ||// uppercase

      (a[i] >= $61 && a[i] <= $7a) ||// lowercase

      a[i] == '$' || a[i] == '-' || a[i] == '_' ||

      a[i] == '.' || a[i] == '+' || a[i] == '!' ||

      a[i] == '*' || a[i] == $27 || a[i] == '(' ||

      a[i] == ')' || a[i] == ',' || a[i] == '[' || a[i] == ']')
      {
        ret                                      = "ret, a[i]"
      }
      ELSE
      {
        ret                                      = "ret, '%', fnStringPrefixToLength(itohex(a[i]), '0', 2)"
      }
    }

    IF(LENGTH_ARRAY(ret) > STRING_RETURN_SIZE_LIMIT)
    {

      RETURN fnStringSizeError()
    }

    RETURN ret
  }

  DEFINE_FUNCTION fnTPEnableButton (DEV dvTP,
  CHAR addressRange[])
  {
    /*|-----------------------------------------------------------------------------|
    |                            fnTPEnableButton                                 |
    |                                                                             |
    | Purpose: Enable buttons with a set variable text range                    |
    | Params: dvTP - the touch panel device                                    |
    |       : addressRange - button address or range                           |
    |            Address codes of buttons to affect. A '.' between addresses      |
    |            includes the range, and an '&' between addresses includes each   |
    |            address                                                          |
    | RETURN: none                                                             |
    |-----------------------------------------------------------------------------|*/

    SEND_COMMAND dvTP,"'^ENA-',addressRange,',1'"
  }

  DEFINE_FUNCTION fnTPDisableButton (DEV dvTP,
  CHAR addressRange[])
  {
    /*|-----------------------------------------------------------------------------|
    |                            fnTPDisableButton                                |
    |                                                                             |
    | Purpose: Disable buttons with a set variable text range                   |
    | Params: dvTP - the touch panel device                                    |
    |       : addressRange - button address or range                           |
    |            Address codes of buttons to affect. A '.' between addresses      |
    |            includes the range, and an '&' between addresses includes each   |
    |            address                                                          |
    | RETURN: none                                                             |
    |-----------------------------------------------------------------------------|*/

    SEND_COMMAND dvTP,"'^ENA-',addressRange,',0'"
  }

  DEFINE_FUNCTION fnTPHideAllPopupsOnPage (DEV dvTP,
  CHAR page[])
  {
    /*|-----------------------------------------------------------------------------|
    |                           fnTPHideAllPopupsOnPage                           |
    |                                                                             |
    | Purpose: Close all popups on a specified page. If the page name is empty, |
    | the current page is used.                                                   |
    | Params: dvTP - the touch panel device                                    |
    |            page - the name of page close all popups                         |
    | RETURN: none                                                             |
    |-----------------------------------------------------------------------------|*/

    SEND_COMMAND dvTP,"'@PPA-',page"
  }

  DEFINE_FUNCTION fnTPHideAllPopups (DEV dvTP)
  {
    /*|-----------------------------------------------------------------------------|
    |                            fnTPHideAllPopups                                |
    |                                                                             |
    | Purpose: Close all popups on all pages.                                   |
    | Params: dvTP - the touch panel device                                    |
    | RETURN: none                                                             |
    |-----------------------------------------------------------------------------|*/

    SEND_COMMAND dvTP,"'@PPX'"
  }

  DEFINE_FUNCTION fnTPHideButton (DEV dvTP,
  CHAR addressRange[])
  {
    SEND_COMMAND dvTP,"'^SHO-',addressRange,',0'"
  }

  DEFINE_FUNCTION fnTPHidePopup (DEV dvTP,
  CHAR popupPage[])
  {
    /*|-----------------------------------------------------------------------------|
    |                              fnTPHidePopup                                  |
    |                                                                             |
    | Purpose: Deactivate a specific popup page on the current page. If the     |
    | popup page is part of a group, the whole group is deactivated.              |
    | Params: dvTP - the touch panel device                                    |
    |            popupPage - the name of popup page to deactivate                 |
    | RETURN: none                                                             |
    |-----------------------------------------------------------------------------|*/

    SEND_COMMAND dvTP,"'@PPF-',popupPage"
  }

  DEFINE_FUNCTION fnTPSetButtonText (DEV dvTP,
  CHAR addressRange[],
  CHAR btnStates[],
  CHAR text[])
  {
    /*|-----------------------------------------------------------------------------|
    |                            fnTPSetButtonText                                |
    |                                                                             |
    | Purpose: Set button state text command.                                   |
    | Params: dvTP - the touch panel device                                    |
    |       : addressRange - button address or range                           |
    |            Address codes of buttons to affect. A '.' between addresses      |
    |            includes the range, and an '&' between addresses includes each   |
    |            address                                                          |
    |       : btnStates - 1 - 256 for multi-state buttons                      |
    |            0                           = All states                                                   |
    |            General buttons, 1          = Off state and 2 = On state                  |
    |            Can be combined using &, ie.. 1&2&3                              |
    |       : text - new text as ASCII CHARacters                              |
    | RETURN: none                                                             |
    |-----------------------------------------------------------------------------|*/

  SEND_COMMAND dvTP,"fnTPTextCommand(dvTP),addressRange,',',btnStates,',',text"
  }

  DEFINE_FUNCTION fnTPSetButtonTextAllStates (DEV dvTP,
  CHAR addressRange[],
  CHAR text[])
  {
    /*|-----------------------------------------------------------------------------|
    |                       fnTPSetButtonTextAllStates                            |
    |                                                                             |
    | Purpose: Set button state text command for all button states              |
    | Params: dvTP - the touch panel device                                    |
    |       : addressRange - button address or range                           |
    |            Address codes of buttons to affect. A '.' between addresses      |
    |            includes the range, and an '&' between addresses includes each   |
    |            address                                                          |
    |       : text - new text as ASCII CHARacters                              |
    | RETURN: none                                                             |
    |-----------------------------------------------------------------------------|*/

    SEND_COMMAND dvTP,"fnTPTextCommand(dvTP),addressRange,',0,',text"
  }

  DEFINE_FUNCTION INTEGER fnTPisG5(DEV dvTP)
  {
    /*|-----------------------------------------------------------------------------|
    |                                   fnTPisG5                                  |
    |                                                                             |
    | Purpose: Is this a G5 panel?                                              |
    | Params: dvTP - the touch panel device                                    |
    | RETURN: TRUE or FALSE                                                    |
    |-----------------------------------------------------------------------------|*/

    RETURN ((DEVICE_ID(dvTP) > 404 ) AND (DEVICE_ID(dvTP) < 418 )) // G5
  }

  DEFINE_FUNCTION INTEGER fnTPisG4(DEV dvTP)
  {
    /*|-----------------------------------------------------------------------------|
    |                                   fnTPisG4                                  |
    |                                                                             |
    | Purpose: Is this a G4 panel?                                              |
    | Params: dvTP - the touch panel device                                    |
    | RETURN: TRUE or FALSE                                                    |
    |-----------------------------------------------------------------------------|*/

    RETURN !fnTPisG5(dvTP)
  }

  DEFINE_FUNCTION CHAR[5] fnTPTextCommand(DEV dvTP)
  {
    /*|-----------------------------------------------------------------------------|
    |                               fnTPTextCommand                               |
    |                                                                             |
    | Purpose: RETURN the TP command based upon panel type (G4 vs G5)           |
    | Params: dvTP - the touch panel device                                    |
    | RETURN: G5 - ^UTF-, G4 - ^TXT-                                           |
    |-----------------------------------------------------------------------------|*/
    IF( fnTPisG5(dvTP))
    {

      RETURN "'^UTF-'"
    }

    RETURN "'^TXT-'"

  }

  DEFINE_FUNCTION fnTPShowButton (DEV dvTP,
  CHAR addressRange[])
  {
    /*|-----------------------------------------------------------------------------|
    |                                fnTPShowButton                               |
    |                                                                             |
    | Purpose: Show request button(s) in address range                          |
    | Params: dvTP - the touch panel device                                    |
    |       : addressRange - button address or range                           |
    | RETURN: none                                                             |
    |-----------------------------------------------------------------------------|*/
    SEND_COMMAND dvTP,"'^SHO-',addressRange,',1'"
  }

  DEFINE_FUNCTION fnTPShowPopup (DEV dvTP,
  CHAR popupPage[])
  {
    /*|-----------------------------------------------------------------------------|
    |                                fnTPShowPopup                                |
    |                                                                             |
    | Purpose: Activate a specific popup page to launch on the current page. If |
    | the popup page is already on, do not re-draw it.                            |
    | Params: dvTP - the touch panel device                                    |
    |            popupPage - the name of popup page to activate                   |
    | RETURN: none                                                             |
    |-----------------------------------------------------------------------------|*/

    SEND_COMMAND dvTP,"'@PPN-',popupPage"
  }

  DEFINE_FUNCTION INTEGER fnToggleState(INTEGER state)
  {
    /*|-----------------------------------------------------------------------------|
    |                                fnToggleState                                |
    |                                                                             |
    | Purpose: Toggle state                                                     |
    | Params: state - 1 or 0, TRUE or FALSE                                    |
    | RETURN: !state                                                           |
    |-----------------------------------------------------------------------------|*/

    RETURN !state
  }

  DEFINE_FUNCTION INTEGER fnTPToggleChannel(DEV dvTP,
  INTEGER channel)
  {
    /*|-----------------------------------------------------------------------------|
    |                              fnTPToggleChannel                              |
    |                                                                             |
    | Purpose: Toggle channel ON or OFF                                         |
    | Params: dvTP - the touch panel device                                    |
    |            channel - channel to toggle                                      |
    | RETURN: none                                                             |
    |-----------------------------------------------------------------------------|*/
    IF([dvTP,channel])
    {
      OFF[dvTP,channel]
    }
    ELSE
    {
      ON[dvTP,channel]
    }
  }

DEFINE_START

  {
    MATH_NaN                                 = fnMathBuildDouble($7FFFFFFF, $FFFFFFFF)
    MATH_POSITIVE_INFINITY                   = fnMathBuildDouble($7FF00000, $00000000)
    MATH_NEGATIVE_INFINITY                   = fnMathBuildDouble($FFF00000, $00000000)

    MATH_TWO_52 = 1 << 52
  }

  (***********************************************************)
  (*                  THE EVENTS GO BELOW                    *)
  (***********************************************************)

DEFINE_EVENT

	DATA_EVENT[devDebugCommand]
  {
    COMMAND:
    {
      STACK_VAR CHAR    cCmd[DUET_MAX_CMD_LEN]
      STACK_VAR CHAR    cHeader[DUET_MAX_HDR_LEN]
      STACK_VAR CHAR    cValue[DUET_MAX_HDR_LEN]

      cCmd                                     = DATA.TEXT
      cHeader                                  = DuetParseCmdHeader(cCmd)
      cValue                                   = DuetParseCmdParam(cCmd)

      SWITCH (UPPER_STRING(cHeader))
      {
        CASE 'DEBUG':
        {
          IF(fnMathIsNumeric(cValue))
          {
            fnDebugSetLevel(ATOI(cValue))
          }

          ELSE IF(LENGTH_ARRAY(cValue)>1)
          {
            fnDebugSetLevelByString(cValue)
          }
        }

        CASE '?DEBUG':
        {
          fnIOPrintln("'current debug level ',fnDebugGetLevelString()")
        }
      }
    }
  }
	
	DEFINE_FUNCTION CHAR[20] DPSTOA (dev dvIn)
	{
		RETURN "ITOA(dvIn.number),':',ITOA(dvIn.port),':',ITOA(dvIn.system)"
	}

  #END_IF  // __HELPER_LIBRARIES__

  (*****************************************************************)
  (*                       END OF PROGRAM                          *)
  (*                                                               *)
  (*         !!!  DO NOT PUT ANY CODE BELOW THIS COMMENT  !!!      *)
  (*                                                               *)
  (*****************************************************************)

