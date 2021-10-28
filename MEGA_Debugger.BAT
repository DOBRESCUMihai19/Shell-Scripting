@Echo Off

Rem ######################################################################
Rem #                                                                    #
Rem # Just add a "Rem" command in front of the previous command line,    #
Rem # in order to enable the debugging                                   #
Rem # by echoing each command line of this batch file.                   #
Rem # Now, the echoing is disabled.                                      #
Rem #                                                                    #
Rem # Setting the local variables up.                                    #
Rem #                                                                    #
Rem ######################################################################

Rem ######################################################################
Rem #                                                                    #
Rem # This batch file should be started like this:                       #
Rem #                                                                    #
Rem # MEGA_Debugger.BAT                                              ^   #
Rem # -DebugLevel  VERBOSE                                           ^   #
Rem # -LogFile     "C:\Users\DOBRE\OneDrive\Documents                ^   #
Rem #              \MEGA\Google Drive\Personal\1_-_IT_and_Telecom    ^   #
Rem #              \3_-_Firms\1_-_UniCredit\3_-_UniCredit_Services\  ^   #
Rem #              Digitization\Shell-Scripting\MEGA_Debugger\       ^   #
Rem #              MEGA_Debugger.LogFile.TXT"                        ^   #
Rem # -SupportMail MailForLogs@MEGA.NZ                                   #
Rem #                                                                    #
Rem ######################################################################

Rem ######################################################################
Rem #                                                                    #
Rem # The following "Set" commands set a value such as:                  #
Rem #                                                                    #
Rem # C:\Users\dobre\AppData\Local\MEGAsync\MEGAsync.exe                 #
Rem #                                                                    #
Rem ######################################################################

Set UsersFolder=C:\Users\

Set MEGAsyncExecutableBasePathLastPart=^
\AppData\Local\MEGAsync\

Set MEGAsyncExecutableBasePath=%UsersFolder%^
%USERNAME%^
%MEGAsyncExecutableBasePathLastPart%

Set MEGAsyncExecutableFileName=MEGAsync.exe

Set MEGAsyncExecutableFullPath=%MEGAsyncExecutableBasePath%^
%MEGAsyncExecutableFileName%

Rem ######################################################################
Rem #                                                                    #
Rem # The following "Set" command sets a value such as:                  #
Rem #                                                                    #
Rem # VERBOSE                                                            #
Rem #                                                                    #
Rem ######################################################################

Set MEGAsyncDebugLevel=%1

Rem ######################################################################
Rem #                                                                    #
Rem # The following "Set" command sets a value such as:                  #
Rem #                                                                    #
Rem # C:\Users\DOBRE\OneDrive\Documents\MEGA\Google Drive\               #
Rem # Personal\1_-_IT_and_Telecom\3_-_Firms\1_-_UniCredit\               #
Rem # 3_-_UniCredit_Services\Digitization\Shell-Scripting\               #
Rem # MEGA_Debugger\MEGA_Debugger.LogFile.TXT                            #
Rem #                                                                    #
Rem ######################################################################

Set MEGAsyncDebugLogFile=%2

Rem ######################################################################
Rem #                                                                    #
Rem # The following "Set" command sets a value such as:                  #
Rem #                                                                    #
Rem # MailForLogs@MEGA.NZ                                                #
Rem #                                                                    #
Rem ######################################################################

Set MEGAsyncSupportMail=%3

Rem ######################################################################
Rem #                                                                    #
Rem # The following "Set" command sets this value:                       #
Rem #                                                                    #
Rem # MEGA.NZ                                                            #
Rem #                                                                    #
Rem ######################################################################

Set MEGAsyncTitle=MEGA.NZ

Rem ######################################################################
Rem #                                                                    #
Rem # Starting the "MEGA.NZ" 64-Bit static software application.         #
Rem #                                                                    #
Rem ######################################################################

Echo *********************************************************************
Echo *                                                                   *
Echo * Starting the "MEGA.NZ" 64-Bit static software application.        *
Echo *                                                                   *
Echo *********************************************************************
Echo.
Echo Start             "%MEGAsyncTitle%"                                ^^
Echo       /D          %MEGAsyncExecutableBasePath%                     ^^
Echo       /Max                                                         ^^
Echo                   %MEGAsyncExecutableFullPath%                     ^^
Echo      -DebugLevel  %MEGAsyncDebugLevel%                             ^^
Echo      -LogFile     %MEGAsyncDebugLogFile%                           ^^
Echo      -SupportMail %MEGAsyncSupportMail%
Echo.
Echo.

Start             "%MEGAsyncTitle%"                                      ^
      /D          %MEGAsyncExecutableBasePath%                           ^
      /Max                                                               ^
                  %MEGAsyncExecutableFullPath%                           ^
     -DebugLevel  %MEGAsyncDebugLevel%                                   ^
     -LogFile     %MEGAsyncDebugLogFile%                                 ^
     -SupportMail %MEGAsyncSupportMail%

Echo.

Rem ######################################################################
Rem #                                                                    #
Rem # Just add a "Rem" command in front of the next                      #
Rem # "Pause" command line, in order to lose the textual output          #
Rem # of this batch file and to speed up the starting process.           #
Rem #                                                                    #
Rem ######################################################################

Echo *********************************************************************
Echo *                                                                   *
Echo * Pausing in order to get the software results.                     *
Echo *                                                                   *
Echo *********************************************************************
Echo.
Echo Pause
Echo.
Pause
Echo.

