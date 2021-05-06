@Echo Off
Rem Just add a "Rem" command in front of the previous line for debugging purposes.

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
Set DesktopBase=%folder_redir_path%\Desktop\
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

Set WhatIsUpTitle=What Is Up?
Set WhatIsUpBase=%DesktopIconsBase%
Set WhatIsUpExecutableFileName=WhatsAppSetup.Exe
Set WhatIsUpExecutableFilePath=%WhatIsUpBase%%WhatIsUpExecutableFileName%

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

Rem Restarting the "Windows Explorer" Process *should* display the newer Control Panel Desktop Icon.
Rem It *should*, but it does not.
Rem TaskKill /F /IM %ExplorerFileName%
Rem Start %ExplorerExecutableFilePath%

Rem Starting the "Total-Commander" 64-Bit Static Software Application.
Echo **************************************************************************
Echo *                                                                        *
Echo * Starting the "Total-Commander" Static Software Application.            *
Echo *                                                                        *
Echo **************************************************************************
Echo.
Echo Start "%TotalCommanderTitle%" /D %TotalCommanderBase% /Max %TotalCommanderExecutableFilePath% /i=%TotalCommanderInitializerFilePath%
Echo.
Start "%TotalCommanderTitle%" /D %TotalCommanderBase% /Max %TotalCommanderExecutableFilePath% /i=%TotalCommanderInitializerFilePath%
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
Rem "OutLook" is not working right now.
Rem Just modify the following two Source Lines of Code when it starts working again.
Echo "OutLook" is not working right now. We are not starting it.
Rem Start "%OutLookTitle%" /Min "%OutLookExecutableFilePath%"
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
Echo Start "%WhatIsUpTitle%" /D %WhatIsUpBase% /Max %WhatIsUpExecutableFilePath%
Echo.
Start "%WhatIsUpTitle%" /D %WhatIsUpBase% /Max %WhatIsUpExecutableFilePath%
Echo.

Rem Overwriting the "OutLook" Desktop Icon over the Start-Up Folder.
Echo **************************************************************************
Echo *                                                                        *
Echo * Moving the "OutLook" Desktop Icon where it belongs.                    *
Echo *                                                                        *
Echo **************************************************************************
Echo.
Echo Move /Y "%OutLookShortcutFilePath%" "%DesktopIconsBase%"
Echo.
Move /Y "%OutLookShortcutFilePath%" "%DesktopIconsBase%"
Echo.

Rem Just add a "Rem" command in front of the next "Pause" command line,
Rem for debugging purposes.
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

