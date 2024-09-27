@Echo Off

Rem ######################################################################
Rem #                                                                    #
Rem # Just add a "Rem" Command in front of the previous Command-Line,    #
Rem # in order to enable the debugging                                   #
Rem # by echoing each Command-Line of this Batch-File.                   #
Rem # Now, the echoing is disabled.                                      #
Rem #                                                                    #
Rem # Setting the local variables up.                                    #
Rem #                                                                    #
Rem ######################################################################

Set CommandLinePreProcessor=Cmd.Exe

Set DigitizationFolder=Digitization
Set DigitizationBase=%HomeDrive%^
%HomePath%^
%DigitizationFolder%\

Set ExplorerExecutableFileName=Explorer.Exe
Set ExplorerExecutableFilePath=%SystemRoot%^
\%ExplorerExecutableFileName%

Set WindowsPowerShell=\System32\WindowsPowerShell\v1.0\
Set PowerShellBase=%SystemRoot%^
%WindowsPowerShell%

Set PowerShellExecutableFileName=PowerShell.Exe
Set PowerShellExecutableFilePath=%PowerShellBase%^
%PowerShellExecutableFileName%
Set PowerShellComponent=GitHub\Shell-Scripting\
Set PowerShellScriptFileName=Change_Desktop_Icons.PS1
Set PowerShellScriptDetails=%PowerShellComponent%^
%PowerShellScriptFileName%
Set PowerShellScript=%DigitizationBase%^
%PowerShellScriptDetails%
Set EchoPowerShellCommand=^^^& {Set-ExecutionPolicy -ExecutionPolicy
Set EchoPowerShellCommandAppendice=RemoteSigned -Scope CurrentUser}
Set PowerShellCommand=^& {Set-ExecutionPolicy -ExecutionPolicy
Set PowerShellCommandAppendice=RemoteSigned -Scope CurrentUser}

Set DesktopIconsFolder=Desktop_Icons
Set DesktopName=\Desktop
Set DesktopBase=%folder_redir_path%^
%DesktopName%

Set WaitingTime=600
Set MappedDrive=M:

Set DownloadsPath=C:\Users\<user_name>\Downloads
Set DownloadsDrive=L:

Rem ######################################################################
Rem #                                                                    #
Rem # Substituting the base of the desktop with the "M:" Mapped Drive.   #
Rem #                                                                    #
Rem ######################################################################
Echo *********************************************************************
Echo *                                                                   *
Echo * Substituting the base of the desktop with the "M:" Mapped Drive.  *
Echo *                                                                   *
Echo * Subst %MappedDrive%                                                         ^^*
Echo * %DesktopBase%
Echo *                                                                   *
Echo *********************************************************************
Echo.
Subst %MappedDrive%                                                      ^
%DesktopBase%
Echo.

Rem ######################################################################
Rem #                                                                    #
Rem # Substituting the downloads path with the "L:" Mapped Drive.        #
Rem #                                                                    #
Rem ######################################################################
Echo *********************************************************************
Echo *                                                                   *
Echo * Substituting the downloads path with the "L:" Mapped Drive.       *
Echo *                                                                   *
Echo * Subst %DownloadsDrive%                                                         ^^*
Echo *       %DownloadsPath%                                  *
Echo *                                                                   *
Echo *********************************************************************
Echo.
Subst %DownloadsDrive%                                                   ^
%DownloadsPath%
Echo.

Set DesktopBase=%MappedDrive%\
Set DesktopIconsBase=%DesktopBase%^
%DesktopIconsFolder%\

Set TotalCommanderTitle=Total-Commander 64-Bit
Set TotalCommanderFolder=Total_Commander
Set TotalCommanderBase=%DesktopIconsBase%^
%TotalCommanderFolder%\
Set TotalCommanderExecutableFileName=TotalCmd64.Exe
Set TotalCommanderExecutableFilePath=%TotalCommanderBase%^
%TotalCommanderExecutableFileName%
Set TotalCommanderInitializerFileName=WinCmd.Ini
Set TotalCommanderInitializerFilePath=%HomeDrive%^
%HomePath%^
%TotalCommanderInitializerFileName%

Set NotePadPPTitle=Notepad++
Set NotePadPPWorkingFolderName=Various
Set NotePadPPWorkingFolderPath=%DigitizationBase%^
%NotePadPPWorkingFolderName%
Set NotePadPPDetails=\Eu\NPP\
Set NotePadPPExecutableBaseFolderPath=%ProgramFiles(x86)%^
%NotePadPPDetails%
Set NotePadPPExecutableFileName=Notepad++.Exe
Set NotePadPPExecutableFilePath=%NotePadPPExecutableBaseFolderPath%^
%NotepadPPExecutableFileName%

Set Microsoft365Details=\Microsoft Office\Root\Office16\
Set Microsoft365Base=%ProgramFiles(x86)%^
%Microsoft365Details%

Set OutLookTitle=OutLook
Set OutLookExecutableFileName=OutLook.Exe
Set OutLookExecutableFilePath=%Microsoft365Base%^
%OutLookExecutableFileName%
Set OutLookShortcutFileName=OutLook.Lnk
Set OutLookShortcutFilePath=%DesktopBase%^
%OutLookShortcutFileName%

Set SkypeTitle=Skype
Set SkypeExecutableFileName=Lync.Exe
Set SkypeExecutableFilePath=%Microsoft365Base%^
%SkypeExecutableFileName%

Set GoogleChromeTitle=Google-Chrome
Set GoogleChromeDetails=\Google\Chrome\Application\
Set GoogleChromeBase=%ProgramFiles(x86)%^
%GoogleChromeDetails%
Set GoogleChromeExecutableFileName=Chrome.Exe
Set GoogleChromeExecutableFilePath=%GoogleChromeBase%^
%GoogleChromeExecutableFileName%

Set FireFoxTitle=FireFox
Set FireFoxDetails=Programs\Mozilla_FireFox\
Set FireFoxBase=%DigitizationBase%^
%FireFoxDetails%
Set FireFoxExecutableFileName=FireFox.Exe
Set FireFoxExecutableFilePath=%FirefoxBase%^
%FireFoxExecutableFileName%

Set InternetExplorerTitle=Internet Explorer
Set InternetExplorerDetails=\Internet Explorer\
Set InternetExplorerBase=%ProgramFiles%^
%InternetExplorerDetails%
Set InternetExplorerExecutableFileName=IExplore.Exe
Set InternetExplorerExecutableFilePath=%InternetExplorerBase%^
%InternetExplorerExecutableFileName%
Set InternetExplorerShortcutFileName=Internet Explorer.lnk
Set InternetExplorerShortcutFilePath=%DesktopBase%^
%InternetExplorerShortcutFileName%

Set SocialMediaDetails=Kits\Social-Media\
Set SocialMediaBase=%DigitizationBase%^
%SocialMediaDetails%

Set WhatIsUpTitle=What Is Up?
Set WhatIsUpDetails=WhatsApp\
Set WhatIsUpBase=%SocialMediaBase%^
%WhatIsUpDetails%
Set WhatIsUpExecutableFileName=WhatsAppSetup.Exe
Set WhatIsUpExecutableFilePath=%WhatIsUpBase%^
%WhatIsUpExecutableFileName%
Set WhatIsUpShortcutFileName=WhatsApp.lnk
Set WhatIsUpShortcutFilePath=%DesktopBase%^
%WhatIsUpShortcutFileName%

Set TelegramTitle=Telegram
Set TelegramDetails=Telegram\
Set TelegramBase=%SocialMediaBase%^
%TelegramDetails%
Set TelegramExecutableFileName=tsetup-x64.2.7.4.exe
Set TelegramExecutableFilePath=%TelegramBase%^
%TelegramExecutableFileName%
Set TelegramShortcutFileName=Telegram.lnk
Set TelegramShortcutFilePath=%DesktopBase%^
%TelegramShortcutFileName%

Set TeamsTitle=Teams
Set TeamsBase=C:\Program Files (x86)\Microsoft\Teams\current\
Set TeamsExecutableFileName=Teams.exe
Set TeamsExecutableFilePath=%TeamsBase%^
%TeamsExecutableFileName%

Set GreenShotTitle=Green-Shot
Set GreenShotDetails=Greenshot\
Set GreenShotBase=%DesktopIconsBase%^
%GreenShotDetails%
Set GreenShotExecutableFileName=Greenshot.exe
Set GreenShotExecutableFilePath=%GreenShotBase%^
%GreenShotExecutableFileName%

Set NotificationsPath=^
"HKCU\Software\Microsoft\Windows\CurrentVersion\PushNotifications"
Set NotificationsValue=ToastEnabled
Set NotificationsType=REG_DWORD
Set NotificationsNumber=0

Rem ######################################################################
Rem #                                                                    #
Rem # Starting the "Total-Commander" 64-Bit Static Software Application. #
Rem #                                                                    #
Rem ######################################################################

Echo *********************************************************************
Echo *                                                                   *
Echo * Starting the "Total-Commander" Static-Software-Application.       *
Echo *                                                                   *
Echo *********************************************************************
Echo.
Echo Start      "%TotalCommanderTitle%"                                 ^^
Echo       /D   %TotalCommanderBase%                        ^^
Echo       /Min %TotalCommanderExecutableFilePath%          ^^
Echo       /i=%TotalCommanderInitializerFilePath%
Echo.
Echo.
Start      "%TotalCommanderTitle%"                                       ^
      /D   %TotalCommanderBase%                                          ^
      /Min %TotalCommanderExecutableFilePath%                            ^
      /i=%TotalCommanderInitializerFilePath%
Echo.

Rem ######################################################################
Rem #                                                                    #
Rem # Starting the "Notepad++" Static-Software-Application.              #
Rem #                                                                    #
Rem # "Notepad++" has to be sometimes manually restarted,                #
Rem # when it is waiting in the "Not responding" state.                  #
Rem #                                                                    #
Rem # And, sometimes, its restarting does not produce                    #
Rem # any kind of improvement.                                           #
Rem #                                                                    #
Rem ######################################################################

Echo *********************************************************************
Echo *                                                                   *
Echo * Starting the "Notepad++" Static-Software-Application.             *
Echo *                                                                   *
Echo *********************************************************************
Echo.
Echo Start      "%NotepadPPTitle%"                                              ^^
Echo       /D   %NotePadPPWorkingFolderPath%                                  ^^
Echo       /Min "%NotepadPPExecutableFilePath%"            ^^
Echo       -systemtray
Echo.
Start      "%NotepadPPTitle%"                                            ^
      /D   %NotePadPPWorkingFolderPath%                                  ^
      /Min "%NotepadPPExecutableFilePath%"                               ^
      -systemtray
Echo.

Rem ######################################################################
Rem #                                                                    #
Rem # Starting the "Microsoft 365 OutLook" Static-Software-Application.  #
Rem #                                                                    #
Rem ######################################################################

Echo *********************************************************************
Echo *                                                                   *
Echo * Starting the "Microsoft 365 OutLook" Static-Software-Application. *
Echo *                                                                   *
Echo *********************************************************************
Echo.
Echo Start      "%OutLookTitle%"                                                ^^
Echo       /Min                                                          ^^
Echo "%OutLookExecutableFilePath%"
Echo.
Start      "%OutLookTitle%"                                              ^
           /Min                                                          ^
           "%OutLookExecutableFilePath%"
Echo.

Rem ######################################################################
Rem #                                                                    #
Rem # Starting the "Microsoft 365 Skype for Business"                    #
Rem # Static-Software-Application.                                       #
Rem #                                                                    #
Rem ######################################################################

Echo *********************************************************************
Echo *                                                                   *
Echo * Starting the "Microsoft 365 Skype for Business"                   *
Echo * Static-Software-Application.                                      *
Echo *                                                                   *
Echo *********************************************************************
Echo.
Echo Start      "%SkypeTitle%"                                                  ^^
Echo       /Min                                                          ^^
Echo      "%SkypeExecutableFilePath%"
Echo.
Start      "%SkypeTitle%"                                                ^
           /Min                                                          ^
           "%SkypeExecutableFilePath%"
Echo.

Rem ######################################################################
Rem #                                                                    #
Rem # Starting the "Google-Chrome" Web-Browser.                          #
Rem #                                                                    #
Rem ######################################################################

Echo *********************************************************************
Echo *                                                                   *
Echo * Starting the "Google-Chrome" Web-Browser.                         *
Echo *                                                                   *
Echo *********************************************************************
Echo.
Echo Start      "%GoogleChromeTitle%"                                          ^^
Echo       /D   "%GoogleChromeBase%"      ^^
Echo       /Min                                                          ^^
Echo       "%GoogleChromeExecutableFilePath%"
Echo.
Start      "%GoogleChromeTitle%"                                         ^
      /D   "%GoogleChromeBase%"                                          ^
      /Min                                                               ^
      "%GoogleChromeExecutableFilePath%"
Echo.

Rem ######################################################################
Rem #                                                                    #
Rem # Starting the "FireFox" Web-Browser.                                #
Rem #                                                                    #
Rem ######################################################################

Echo *********************************************************************
Echo *                                                                   *
Echo * Starting the "FireFox" Web-Browser.                               *
Echo *                                                                   *
Echo *********************************************************************
Echo.
Echo Start      "%FireFoxTitle%"                                                ^^
Echo       /D   %FireFoxBase%                ^^
Echo       /Min "%FireFoxExecutableFilePath%"
Echo.
Start      "%FireFoxTitle%"                                              ^
      /D   %FireFoxBase%                                                 ^
      /Min "%FireFoxExecutableFilePath%"
Echo.

Rem ######################################################################
Rem #                                                                    #
Rem # Starting the "Internet Explorer" Web-Browser.                      #
Rem #                                                                    #
Rem ######################################################################

Echo *********************************************************************
Echo *                                                                   *
Echo * Starting the "Internet Explorer" Web-Browser.                     *
Echo *                                                                   *
Echo *********************************************************************
Echo.
Echo Start      "%InternetExplorerTitle%"                                      ^^
Echo       /D   "%InternetExplorerBase%"                    ^^
Echo       /Min "%InternetExplorerExecutableFilePath%"
Echo.
Start      "%InternetExplorerTitle%"                                     ^
      /D   "%InternetExplorerBase%"                                      ^
      /Min "%InternetExplorerExecutableFilePath%"
Echo.

Rem ######################################################################
Rem #                                                                    #
Rem # Starting the "What Is Up?" Social-Media-Network Client.            #
Rem #                                                                    #
Rem ######################################################################

Echo *********************************************************************
Echo *                                                                   *
Echo * Starting the "What Is Up?" Social-Media-Network Client.           *
Echo *                                                                   *
Echo *********************************************************************
Echo.
Echo Start      "%WhatIsUpTitle%"                                            ^^
Echo       /D   %WhatIsUpBase%              ^^
Echo       /Min                                                          ^^
Echo          %WhatIsUpExecutableFilePath%
Echo.
Start      "%WhatIsUpTitle%"                                             ^
      /D   %WhatIsUpBase%                                                ^
      /Min                                                               ^
      %WhatIsUpExecutableFilePath%
Echo.

Rem ######################################################################
Rem #                                                                    #
Rem # Starting the "Telegram" Social-Media-Network Client.               #
Rem #                                                                    #
Rem ######################################################################

Echo *********************************************************************
Echo *                                                                   *
Echo * Starting the "Telegram" Social-Media-Network Client.              *
Echo *                                                                   *
Echo *********************************************************************
Echo.
Echo Start      "%TelegramTitle%"                                               ^^
Echo       /D   %TelegramBase%              ^^
Echo       /Min                                                          ^^
Echo       %TelegramExecutableFilePath%
Echo.
Start      "%TelegramTitle%"                                             ^
      /D   %TelegramBase%                                                ^
      /Min                                                               ^
      %TelegramExecutableFilePath%
Echo.

Rem ######################################################################
Rem #                                                                    #
Rem # Starting the "Teams" Social-Media-Network Client.                  #
Rem #                                                                    #
Rem ######################################################################

Echo *********************************************************************
Echo *                                                                   *
Echo * Starting the "Teams" Social-Media-Network Client.                 *
Echo *                                                                   *
Echo *********************************************************************
Echo.
Echo Start %CommandLinePreProcessor%                                                       ^^
Echo /C ^^("%TeamsExecutableFilePath%"     ^^
Echo ^^^>NUL 2^^^>^^^&1^^)
Echo.
Start %CommandLinePreProcessor%                                          ^
      /C ^("%TeamsExecutableFilePath%"                                   ^
      ^>NUL 2^>^&1^)
Echo.

Rem ######################################################################
Rem #                                                                    #
Rem # Starting the "Green-Shot" Screen-Shooter.                          #
Rem #                                                                    #
Rem ######################################################################

Echo *********************************************************************
Echo *                                                                   *
Echo * Starting the "Green-Shot" Screen-Shooter.                         *
Echo *                                                                   *
Echo *********************************************************************
Echo.
Echo Start      "%GreenShotTitle%"                                             ^^
Echo       /D   %GreenShotBase%                              ^^
Echo       /Min %GreenShotExecutableFilePath%
Echo.
Start      "%GreenShotTitle%"                                            ^
      /D   %GreenShotBase%                                               ^
      /Min %GreenShotExecutableFilePath%
Echo.

Rem ######################################################################
Rem #                                                                    #
Rem # Overwriting the "OutLook" Desktop-Icon                             #
Rem # over the Desktop-Icons Folder.                                     #
Rem #                                                                    #
Rem ######################################################################

Echo *********************************************************************
Echo *                                                                   *
Echo * Moving the "OutLook" Desktop-Icon in the Desktop-Icons Folder.    *
Echo *                                                                   *
Echo *********************************************************************
Echo.
Echo Move /Y                                                             ^^
Echo      "%OutLookShortcutFilePath%"                                               ^^
Echo      "%DesktopIconsBase%"
Echo.
Move /Y                                                                  ^
     "%OutLookShortcutFilePath%"                                         ^
     "%DesktopIconsBase%"
Echo.

Rem ######################################################################
Rem #                                                                    #
Rem # Overwriting the "Internet Explorer" Desktop-Icon                   #
Rem #                                                                    #
Rem # over the Desktop-Icons Folder.                                     #
Rem #                                                                    #
Rem ######################################################################

Echo *********************************************************************
Echo *                                                                   *
Echo * Moving the "Internet Explorer" Desktop-Icon                       *
Echo * in the Desktop-Icons Folder.                                      *
Echo *                                                                   *
Echo *********************************************************************
Echo.
Echo Move /Y                                                             ^^
Echo      "%InternetExplorerShortcutFilePath%"                                     ^^
Echo      "%DesktopIconsBase%"
Echo.
Move /Y                                                                  ^
     "%InternetExplorerShortcutFilePath%"                                ^
     "%DesktopIconsBase%"
Echo.

Rem ######################################################################
Rem #                                                                    #
Rem # Giving the user ten minutes in order to set up                     #
Rem # the "What Is Up?" Program.                                         #
Rem #                                                                    #
Rem ######################################################################

Echo *********************************************************************
Echo *                                                                   *
Echo * Waiting for ten minutes, without being able to skip               *
Echo * the waiting time.                                                 *
Echo *                                                                   *
Echo *********************************************************************
Echo.
Echo TimeOut %WaitingTime%                                                         ^^
Echo         /NoBreak
Echo.
TimeOut %WaitingTime%                                                ^
        /NoBreak
Echo.

Rem ######################################################################
Rem #                                                                    #
Rem # Overwriting the "What Is Up?" Desktop-Icon                         #
Rem # over the Desktop-Icons Folder.                                     #
Rem #                                                                    #
Rem ######################################################################

Echo *********************************************************************
Echo *                                                                   *
Echo * Moving the "What Is Up?" Desktop-Icon                             *
Echo * in the Desktop-Icons Folder.                                      *
Echo *                                                                   *
Echo *********************************************************************
Echo.
Echo Move /Y                                                             ^^
Echo      "%WhatIsUpShortcutFilePath%"                                              ^^
Echo      "%DesktopIconsBase%"
Echo.
Move /Y                                                              ^
     "%WhatIsUpShortcutFilePath%"                                    ^
     "%DesktopIconsBase%"
Echo.

Rem ######################################################################
Rem #                                                                    #
Rem # Overwriting the "Telegram" Desktop-Icon                            #
Rem # over the Desktop-Icons Folder.                                     #
Rem #                                                                    #
Rem ######################################################################

Echo *********************************************************************
Echo *                                                                   *
Echo * Moving the "Telegram" Desktop-Icon in the Desktop-Icons Folder.   *
Echo *                                                                   *
Echo *********************************************************************
Echo.
Echo Move /Y                                                             ^^
Echo      "%TelegramShortcutFilePath%"                                              ^^
Echo      "%DesktopIconsBase%"
Echo.
Move /Y                                                                  ^
     "%TelegramShortcutFilePath%"                                        ^
     "%DesktopIconsBase%"
Echo.

Rem ######################################################################
Rem #                                                                    #
Rem # Restarting the "Microsoft" "Windows Explorer" Process              #
Rem # *should* display the newer Control-Panel Desktop-Icon.             #
Rem #                                                                    #
Rem # It *should*, but it does not, for the moment.                      #
Rem #                                                                    #
Rem # Killing the "Microsoft" "Windows Explorer"                         #
Rem # Static-Software-Application.                                       #
Rem #                                                                    #
Rem ######################################################################

Rem Echo *****************************************************************
Rem Echo *                                                               *
Rem Echo * Killing the "Microsoft" "Windows Explorer"                    *
Rem Echo * Static-Software-Application.                                  *
Rem Echo *                                                               *
Rem Echo *****************************************************************
Rem Echo.
Rem Echo TaskKill /F                                                    ^^
Rem Echo          /IM                                                   ^^
Rem Echo          %ExplorerExecutableFileName%
Rem Echo.
Rem TaskKill /F                                                          ^
Rem          /IM                                                         ^
Rem          %ExplorerExecutableFileName%
Rem Echo.

Rem ######################################################################
Rem #                                                                    #
Rem # Restarting the "Microsoft" "Windows Explorer"                      #
Rem # Static-Software-Application.                                       #
Rem #                                                                    #
Rem ######################################################################

Rem Echo *****************************************************************
Rem Echo *                                                               *
Rem Echo * Restarting the "Microsoft" "Windows Explorer"                 *
Rem Echo * Static-Software-Application.                                  *
Rem Echo *                                                               *
Rem Echo *****************************************************************
Rem Echo.
Rem Echo Start %ExplorerExecutableFilePath%
Rem Echo.
Rem Start %ExplorerExecutableFilePath%
Rem Echo.

Rem ######################################################################
Rem #                                                                    #
Rem # Not only that we cannot see the "Control-Panel" repainted          #
Rem # with its new Desktop-Icon after the restart                        #
Rem # of the "Microsoft" "Windows-Explorer"                              #
Rem # Static-Software-Application, but we also cannot see                #
Rem # the "Notepad++" Little Icon in the System-Tray after the restart.  #
Rem #                                                                    #
Rem ######################################################################

Rem ######################################################################
Rem #                                                                    #
Rem # Attempting to disable the notifications.                           #
Rem # This is done both from PowerShell and from Batch.                  #
Rem # Still, it is not working.                                          #
Rem #                                                                    #
Rem # Reg Add                                                         ^^ #
Rem #            %NotificationsPath%                                  ^^ #
Rem #         /v %NotificationsValue%                                 ^^ #
Rem #         /t %NotificationsType%                                  ^^ #
Rem #         /d %NotificationsNumber%                                ^^ #
Rem #         /f                                                         #
Rem #                                                                    #
Rem ######################################################################
Echo *********************************************************************
Echo *                                                                   *
Echo * Disabling the notifications.                                      *
Echo *                                                                   *
Echo * Reg Add                                                          ^^*
Echo *%NotificationsPath%^^*
Echo *       /v %NotificationsValue%                                            ^^*
Echo *       /t %NotificationsType%                                               ^^*
Echo *       /d %NotificationsNumber%                                                       ^^*
Echo *       /f                                                          *
Echo *                                                                   *
Echo *********************************************************************

Reg Add                                                                  ^
           %NotificationsPath%                                           ^
        /v %NotificationsValue%                                          ^
        /t %NotificationsType%                                           ^
        /d %NotificationsNumber%                                         ^
        /f

Rem ######################################################################
Rem #                                                                    #
Rem # Changing the current directory to the local base installation      #
Rem # of PowerShell.                                                     #
Rem #                                                                    #
Rem ######################################################################

Echo *********************************************************************
Echo *                                                                   *
Echo * Changing the current local directory to the "PowerShell"          *
Echo * installation.                                                     *
Echo *                                                                   *
Echo *********************************************************************
Echo.
Echo ChDir %PowerShellBase%
Echo.
ChDir %PowerShellBase%
Echo.

Rem ######################################################################
Rem #                                                                    #
Rem # Enabling the execution of local scripts on this machine.           #
Rem #                                                                    #
Rem ######################################################################

Echo *********************************************************************
Echo *                                                                   *
Echo * Activating the Shell-Scripting on this machine.                   *
Echo *                                                                   *
Echo *********************************************************************
Echo.
Echo %PowerShellExecutableFilePath%           ^^
Echo -Command                                                            ^^
Echo %EchoPowerShellCommand%                             ^^
Echo %EchoPowerShellCommandAppendice%
Echo.
%PowerShellExecutableFilePath%                                           ^
-Command                                                                 ^
%PowerShellCommand%                                                      ^
%PowerShellCommandAppendice%
Echo.

Rem ######################################################################
Rem #                                                                    #
Rem # Executing the script that changes some desktop icons.              #
Rem #                                                                    #
Rem ######################################################################

Echo *********************************************************************
Echo *                                                                   *
Echo * Skinning the desktop icons.                                       *
Echo *                                                                   *
Echo *********************************************************************
Echo.
Echo %PowerShellExecutableFilePath%           ^^
Echo %PowerShellScript%
Echo.
%PowerShellExecutableFilePath%                                           ^
%PowerShellScript%
Echo.

Rem ######################################################################
Rem #                                                                    #
Rem # Just add a "Rem" Command in front of the next                      #
Rem # "Pause" Command-Line, in order to lose the Textual-Out-Put         #
Rem # of this Batch-File and to speed up the Starting-Process.           #
Rem #                                                                    #
Rem ######################################################################

Echo *********************************************************************
Echo *                                                                   *
Echo * Pausing in order to get the Software-Results.                     *
Echo *                                                                   *
Echo *********************************************************************
Echo.
Echo Pause
Echo.
Pause
Echo.
