@Rem  Just add a "Rem" command in front of the next line for debugging purposes.
@Echo Off

@Rem Setting the local variables up.
Set PowerShellBase="%SystemRoot%\System32\WindowsPowerShell\v1.0\"
Set PowerShellExecutable="%PowerShellBase%\PowerShell.Exe"
Set PowerShellScript="Y:\Digitization\GitHub\Shell-Scripting\Change_Desktop_Icons.PS1"

Set TotalCommanderTitle="Total-Commander 64-Bit"
Set TotalCommanderBase="\\ISXPFV01.hd00.unicreditgroup.eu\us_qv2_dem_user_data_pool_nra$\EE65037.HD00\Desktop\Total_Commander"
Set TotalCommanderExecutable="%TotalCommanderBase%\TotalCmd64.Exe"
Set TotalCommanderInitializer="%TotalCommanderBase%\New_Ini_Location\wincmd.ini"

Set NotepadPPTitle="Notepad++"
Set NotepadPPBase="Y:\Digitization\Various"
Set NotepadPPExecutable="C:\Program Files (x86)\Eu\NPP\Notepad++.Exe"

Set OutlookTitle="Outlook"
Set OutlookExecutable="C:\Program Files (x86)\Microsoft Office\Root\Office16\Outlook.Exe"

Set SkypeTitle="Skype"
Set SkypeExecutable="C:\Program Files (x86)\Microsoft Office\Root\Office16\Lync.Exe"

Set GoogleChromeTitle="GoogleChrome"
Set GoogleChromeBase="C:\Program Files (x86)\Google\Chrome\Application"
Set GoogleChromeExecutable="C:\Program Files (x86)\Google\Chrome\Application\Chrome.Exe"

Set FirefoxTitle="Firefox"
Set FirefoxBase="\\M00pw009.hd00.unicreditgroup.eu\ee65037$\EE6503~1.HOM\Digitization\Programs\Mozilla_Firefox"
Set FirefoxExecutable="\\M00pw009.hd00.unicreditgroup.eu\ee65037$\EE65037.HOME\Digitization\Programs\Mozilla_Firefox\Firefox.Exe"

Set InternetExplorerTitle="Internet Explorer"
Set InternetExplorerBase=%HOMEDRIVE%%HOMEPATH%
Set InternetExplorerExecutable="C:\Program Files\Internet Explorer\IExplore.Exe"

@Rem Changing the current directory to the local base installation of PowerShell.
ChDir %PowerShellBase%

@Rem Enabling the execution of local scripts on this machine.
%PowerShellExecutable% -Command "& {Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser}"

@Rem Executing the script that changes some desktop icons.
%PowerShellExecutable% %PowerShellScript%

@Rem Restarting the "Windows Explorer" Process *should* display the newer Control Panel Desktop Icon.
@Rem It *should*, but it does not.
@Rem TaskKill /F /IM Explorer.Exe
@Rem Start %SystemRoot%\Explorer.Exe

@Rem Starting the "Total-Commander" 64-Bit Static Software Application.
Start %TotalCommanderTitle% /D %TotalCommanderBase% /Max %TotalCommanderExecutable% /i=%TotalCommanderInitializer%

@Rem Starting the "Notepad++" Static Software Application.
Start %NotepadPPTitle% /D %NotepadPPBase% /Min %NotepadPPExecutable% -systemtray

@Rem Starting the "Microsoft 365 Outlook" Static Software Application.
Start %OutlookTitle% /Min %OutlookExecutable%

@Rem Starting the "Microsoft 365 Skype for Business" Static Software Application.
Start %SkypeTitle% /Min %SkypeExecutable%

@Rem Starting the "Google Chrome" Web-Browser.
Start %GoogleChromeTitle% /D %GoogleChromeBase% /Min %GoogleChromeExecutable%

@Rem Starting the "Firefox" Web-Browser.
Start %FirefoxTitle% /D %FirefoxBase% /Min %FirefoxExecutable%

@Rem Starting the "Internet Explorer" Web-Browser.
Start %InternetExplorerTitle% /D %InternetExplorerBase% /Min %InternetExplorerExecutable%

@Rem Overwriting the "Outlook" Desktop Icon over the Start-Up Folder.
Move /Y \\ISXPFV01.hd00.unicreditgroup.eu\us_qv2_dem_user_data_pool_nra$\EE65037.HD00\Desktop\Outlook.lnk \\ISXPFV01.hd00.unicreditgroup.eu\us_qv2_dem_user_data_pool_nra$\EE65037.HD00\Desktop\Start-Up\

@Rem Just remove the "Rem" command in front of the next line for debugging purposes.
@Rem Pause

