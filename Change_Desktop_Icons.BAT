@Echo Off
Rem Just add a "Rem" Command in front of the previous Command-Line,
Rem in order to enable the debugging
Rem by echoing each Command-Line of this Batch-File.

Rem Setting the local variables up.
Set DigitizationFolder=Digitization
Set DigitizationBase=%HomeDrive%%HomePath%%DigitizationFolder%\

Set ExplorerExecutableFileName=Explorer.Exe
Set ExplorerExecutableFilePath=%SystemRoot%\%ExplorerExecutableFileName%

Set PowerShellBase=%SystemRoot%\System32\WindowsPowerShell\v1.0\
Set PowerShellExecutableFileName=PowerShell.Exe
Set PowerShellExecutableFilePath=%PowerShellBase%%PowerShellExecutableFileName%
Set PowerShellScript=%DigitizationBase%GitHub\Shell-Scripting\Change_Desktop_Icons.PS1
Set PowerShellCommand=^& {Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser}

Set DesktopIconsFolder=Desktop_Icons
Set DesktopBase=%folder_redir_path%\Desktop
Set MappedDrive=M:

Rem Substituting the base of the desktop with the "M:" Mapped Drive.
Subst %MappedDrive% %DesktopBase%

Set DesktopBase=%MappedDrive%\
Set DesktopIconsBase=%DesktopBase%%DesktopIconsFolder%\

Set TotalCommanderTitle=Total-Commander 64-Bit
Set TotalCommanderFolder=Total_Commander
Set TotalCommanderBase=%DesktopIconsBase%%TotalCommanderFolder%\
Set TotalCommanderExecutableFileName=TotalCmd64.Exe
Set TotalCommanderExecutableFilePath=%TotalCommanderBase%%TotalCommanderExecutableFileName%
Set TotalCommanderInitializerFileName=WinCmd.Ini
Set TotalCommanderInitializerFilePath=%HomeDrive%%HomePath%%TotalCommanderInitializerFileName%

Set NotePadPPTitle=Notepad++
Set NotePadPPWorkingFolderName=Various
Set NotePadPPWorkingFolderPath=%DigitizationBase%%NotePadPPWorkingFolderName%
Set NotePadPPExecutableBaseFolderPath=%ProgramFiles(x86)%\Eu\NPP\
Set NotePadPPExecutableFileName=Notepad++.Exe
Set NotePadPPExecutableFilePath=%NotePadPPExecutableBaseFolderPath%%NotepadPPExecutableFileName%

Set Microsoft365Base=%ProgramFiles(x86)%\Microsoft Office\Root\Office16\

Set OutLookTitle=OutLook
Set OutLookExecutableFileName=OutLook.Exe
Set OutLookExecutableFilePath=%Microsoft365Base%%OutLookExecutableFileName%
Set OutLookShortcutFileName=OutLook.Lnk
Set OutLookShortcutFilePath=%DesktopBase%%OutLookShortcutFileName%

Set SkypeTitle=Skype
Set SkypeExecutableFileName=Lync.Exe
Set SkypeExecutableFilePath=%Microsoft365Base%%SkypeExecutableFileName%

Set GoogleChromeTitle=Google-Chrome
Set GoogleChromeBase=%ProgramFiles(x86)%\Google\Chrome\Application\
Set GoogleChromeExecutableFileName=Chrome.Exe
Set GoogleChromeExecutableFilePath=%GoogleChromeBase%%GoogleChromeExecutableFileName%

Set FireFoxTitle=FireFox
Set FireFoxBase=%DigitizationBase%Programs\Mozilla_FireFox\
Set FireFoxExecutableFileName=FireFox.Exe
Set FireFoxExecutableFilePath=%FirefoxBase%%FireFoxExecutableFileName%

Set InternetExplorerTitle=Internet Explorer
Set InternetExplorerBase=%ProgramFiles%\Internet Explorer\
Set InternetExplorerExecutableFileName=IExplore.Exe
Set InternetExplorerExecutableFilePath=%InternetExplorerBase%%InternetExplorerExecutableFileName%
Set InternetExplorerShortcutFileName=Internet Explorer.lnk
Set InternetExplorerShortcutFilePath=%DesktopBase%%InternetExplorerShortcutFileName%

Set SocialMediaBase=%DigitizationBase%Kits\Social-Media\

Set WhatIsUpTitle=What Is Up?
Set WhatIsUpBase=%SocialMediaBase%WhatsApp\
Set WhatIsUpExecutableFileName=WhatsAppSetup.Exe
Set WhatIsUpExecutableFilePath=%WhatIsUpBase%%WhatIsUpExecutableFileName%
Set WhatIsUpShortcutFileName=WhatsApp.lnk
Set WhatIsUpShortcutFilePath=%DesktopBase%%WhatIsUpShortcutFileName%

Set TelegramTitle=Telegram
Set TelegramBase=%SocialMediaBase%Telegram\
Set TelegramExecutableFileName=tsetup-x64.2.7.4.exe
Set TelegramExecutableFilePath=%TelegramBase%%TelegramExecutableFileName%
Set TelegramShortcutFileName=Telegram.lnk
Set TelegramShortcutFilePath=%DesktopBase%%TelegramShortcutFileName%

Set GreenshotTitle=Green-Shot
Set GreenshotBase=%DesktopIconsBase%Greenshot\
Set GreenshotExecutableFileName=Greenshot.exe
Set GreenshotExecutableFilePath=%GreenshotBase%%GreenshotExecutableFileName%

Rem Changing the current directory to the local base installation of PowerShell.
Echo **************************************************************************
Echo *                                                                        *
Echo * Changing the current local directory to the "PowerShell" installation. *
Echo *                                                                        *
Echo **************************************************************************
Echo.
Echo ChDir %PowerShellBase%
Echo.
ChDir %PowerShellBase%
Echo.

Rem Enabling the execution of local scripts on this machine.
Echo **************************************************************************
Echo *                                                                        *
Echo * Activating the Shell-Scripting on this machine.                        *
Echo *                                                                        *
Echo **************************************************************************
Echo.
Echo %PowerShellExecutableFilePath% -Command "%PowerShellCommand%"
Echo.
%PowerShellExecutableFilePath% -Command "%PowerShellCommand%"
Echo.

Rem Executing the script that changes some desktop icons.
Echo **************************************************************************
Echo *                                                                        *
Echo * Skinning the desktop icons.                                            *
Echo *                                                                        *
Echo **************************************************************************
Echo.
Echo %PowerShellExecutableFilePath% %PowerShellScript%
Echo.
%PowerShellExecutableFilePath% %PowerShellScript%
Echo.

Rem Starting the "Total-Commander" 64-Bit Static Software Application.
Echo **************************************************************************
Echo *                                                                        *
Echo * Starting the "Total-Commander" Static Software Application.            *
Echo *                                                                        *
Echo **************************************************************************
Echo.
Echo Start "%TotalCommanderTitle%" /D %TotalCommanderBase% /Min %TotalCommanderExecutableFilePath% /i=%TotalCommanderInitializerFilePath%
Echo.
Start "%TotalCommanderTitle%" /D %TotalCommanderBase% /Min %TotalCommanderExecutableFilePath% /i=%TotalCommanderInitializerFilePath%
Echo.

Rem Starting the "Notepad++" Static Software Application.
Echo **************************************************************************
Echo *                                                                        *
Echo * Starting the "Notepad++" Static Software Application.                  *
Echo *                                                                        *
Echo **************************************************************************
Echo.
Echo Start "%NotepadPPTitle%" /D %NotePadPPWorkingFolderPath% /Min "%NotepadPPExecutableFilePath%" -systemtray
Echo.
Start "%NotepadPPTitle%" /D %NotePadPPWorkingFolderPath% /Min "%NotepadPPExecutableFilePath%" -systemtray
Echo.

Rem Starting the "Microsoft 365 OutLook" Static Software Application.
Echo **************************************************************************
Echo *                                                                        *
Echo * Starting the "Microsoft 365 OutLook" Static Software Application.      *
Echo *                                                                        *
Echo **************************************************************************
Echo.
Echo Start "%OutLookTitle%" /Min "%OutLookExecutableFilePath%"
Echo.
Start "%OutLookTitle%" /Min "%OutLookExecutableFilePath%"
Echo.

Rem Starting the "Microsoft 365 Skype for Business" Static Software Application.
Echo **************************************************************************
Echo *                                                                        *
Echo * Starting the "Microsoft 365 Skype for Business"                        *
Echo * Static Software Application.                                           *
Echo *                                                                        *
Echo **************************************************************************
Echo.
Echo Start "%SkypeTitle%" /Min "%SkypeExecutableFilePath%"
Echo.
Start "%SkypeTitle%" /Min "%SkypeExecutableFilePath%"
Echo.

Rem Starting the "Google-Chrome" Web-Browser.
Echo **************************************************************************
Echo *                                                                        *
Echo * Starting the "Google-Chrome" Web-Browser.                              *
Echo *                                                                        *
Echo **************************************************************************
Echo.
Echo Start "%GoogleChromeTitle%" /D "%GoogleChromeBase%" /Min "%GoogleChromeExecutableFilePath%"
Echo.
Start "%GoogleChromeTitle%" /D "%GoogleChromeBase%" /Min "%GoogleChromeExecutableFilePath%"
Echo.

Rem Starting the "FireFox" Web-Browser.
Echo **************************************************************************
Echo *                                                                        *
Echo * Starting the "FireFox" Web-Browser.                                    *
Echo *                                                                        *
Echo **************************************************************************
Echo.
Echo Start "%FireFoxTitle%" /D %FireFoxBase% /Min "%FireFoxExecutableFilePath%"
Echo.
Start "%FireFoxTitle%" /D %FireFoxBase% /Min "%FireFoxExecutableFilePath%"
Echo.

Rem Starting the "Internet Explorer" Web-Browser.
Echo **************************************************************************
Echo *                                                                        *
Echo * Starting the "Internet Explorer" Web-Browser.                          *
Echo *                                                                        *
Echo **************************************************************************
Echo.
Echo Start "%InternetExplorerTitle%" /D "%InternetExplorerBase%" /Min "%InternetExplorerExecutableFilePath%"
Echo.
Start "%InternetExplorerTitle%" /D "%InternetExplorerBase%" /Min "%InternetExplorerExecutableFilePath%"
Echo.

Rem Starting the "What Is Up?" Social-Media Network Client.
Echo **************************************************************************
Echo *                                                                        *
Echo * Starting the "What Is Up?" Social-Media Network Client.                *
Echo *                                                                        *
Echo **************************************************************************
Echo.
Echo Start "%WhatIsUpTitle%" /D %WhatIsUpBase% /Min %WhatIsUpExecutableFilePath%
Echo.
Start "%WhatIsUpTitle%" /D %WhatIsUpBase% /Min %WhatIsUpExecutableFilePath%
Echo.

Rem Starting the "Telegram" Social-Media Network Client.
Echo **************************************************************************
Echo *                                                                        *
Echo * Starting the "Telegram" Social-Media Network Client.                   *
Echo *                                                                        *
Echo **************************************************************************
Echo.
Echo Start "%TelegramTitle%" /D %TelegramBase% /Min %TelegramExecutableFilePath%
Echo.
Start "%TelegramTitle%" /D %TelegramBase% /Min %TelegramExecutableFilePath%
Echo.

Rem Starting the "Green-Shot" Screen-Shooter.
Echo **************************************************************************
Echo *                                                                        *
Echo * Starting the "Green-Shot" Screen-Shooter.                              *
Echo *                                                                        *
Echo **************************************************************************
Echo.
Echo Start "%GreenshotTitle%" /D %GreenshotBase% /Min %GreenshotExecutableFilePath%
Echo.
Start "%GreenshotTitle%" /D %GreenshotBase% /Min %GreenshotExecutableFilePath%
Echo.

Rem Overwriting the "OutLook" Desktop Icon over the Desktop Icons Folder.
Echo **************************************************************************
Echo *                                                                        *
Echo * Moving the "OutLook" Desktop Icon in the Desktop Icons Folder.         *
Echo *                                                                        *
Echo **************************************************************************
Echo.
Echo Move /Y "%OutLookShortcutFilePath%" "%DesktopIconsBase%"
Echo.
Move /Y "%OutLookShortcutFilePath%" "%DesktopIconsBase%"
Echo.

Rem Overwriting the "Internet Explorer" Desktop Icon
Rem over the Desktop Icons Folder.
Echo **************************************************************************
Echo *                                                                        *
Echo * Moving the "Internet Explorer" Desktop Icon                            *
Echo * in the Desktop Icons Folder.                                           *
Echo *                                                                        *
Echo **************************************************************************
Echo.
Echo Move /Y "%InternetExplorerShortcutFilePath%" "%DesktopIconsBase%"
Echo.
Move /Y "%InternetExplorerShortcutFilePath%" "%DesktopIconsBase%"
Echo.

Rem Giving the user two minutes in order to set up the "What Is Up?" Program.
Echo **************************************************************************
Echo *                                                                        *
Echo * Waiting for ten minutes, without being able to skip the waiting time.  *
Echo *                                                                        *
Echo **************************************************************************
Echo.
Echo TimeOut 600 /NoBreak
Echo.
TimeOut 600 /NoBreak
Echo.

Rem Overwriting the "What Is Up?" Desktop Icon over the Desktop Icons Folder.
Echo **************************************************************************
Echo *                                                                        *
Echo * Moving the "What Is Up?" Desktop Icon in the Desktop Icons Folder.     *
Echo *                                                                        *
Echo **************************************************************************
Echo.
Echo Move /Y "%WhatIsUpShortcutFilePath%" "%DesktopIconsBase%"
Echo.
Move /Y "%WhatIsUpShortcutFilePath%" "%DesktopIconsBase%"
Echo.

Rem Overwriting the "Telegram" Desktop Icon over the Desktop Icons Folder.
Echo **************************************************************************
Echo *                                                                        *
Echo * Moving the "Telegram" Desktop Icon in the Desktop Icons Folder.        *
Echo *                                                                        *
Echo **************************************************************************
Echo.
Echo Move /Y "%TelegramShortcutFilePath%" "%DesktopIconsBase%"
Echo.
Move /Y "%TelegramShortcutFilePath%" "%DesktopIconsBase%"
Echo.

Rem Restarting the "Microsoft" "Windows Explorer" Process
Rem *should* display the newer Control Panel Desktop Icon.
Rem It *should*, but it does not, for the moment.
Rem Echo **************************************************************************
Rem Echo *                                                                        *
Rem Echo * Killing the "Microsoft" "Windows Explorer" Static Software Application.*
Rem Echo *                                                                        *
Rem Echo **************************************************************************
Rem Echo.
Rem Echo TaskKill /F /IM %ExplorerExecutableFileName%
Rem Echo.
Rem TaskKill /F /IM %ExplorerExecutableFileName%
Rem Echo.

Rem Restarting the "Microsoft" "Windows Explorer" Static Software Application.
Rem Echo **************************************************************************
Rem Echo *                                                                        *
Rem Echo * Restarting the "Microsoft" "Windows Explorer"                          *
Rem Echo * Static Software Application.                                           *
Rem Echo *                                                                        *
Rem Echo **************************************************************************
Rem Echo.
Rem Echo Start %ExplorerExecutableFilePath%
Rem Echo.
Rem Start %ExplorerExecutableFilePath%
Rem Echo.

Rem Not only that we cannot see the "Control Panel" repainted with its new
Rem Desktop Icon after the restart of the "Microsoft" "Windows Explorer"
Rem Static Software Application, but also we cannot see the "Notepad++"
Rem Little Icon in the System Tray after its restart.

Rem Just add a "Rem" Command in front of the next "Pause" Command-Line,
Rem in order to lose the Textual Out-Put of this Batch-File
Rem and to speed up the starting process.
Echo **************************************************************************
Echo *                                                                        *
Echo * Pausing in order to get the Software Results.                          *
Echo *                                                                        *
Echo **************************************************************************
Echo.
Echo Pause
Echo.
Pause
Echo.

Rem "Notepad++" has to be sometimes manually restarted, when it is
Rem waiting in the "Not responding" state.

