@Rem  Just add a "Rem" command in front of the next line for debugging purposes.
@Echo Off

Rem Setting the local variables up.
Set PowerShellBase="%SystemRoot%\System32\WindowsPowerShell\v1.0\"
Set PowerShellExecutable="%PowerShellBase%\PowerShell.Exe"
Set PowerShellScript="Y:\Digitization\Powershell\The_My_Computer_Desktop_Icon\Change_Desktop_Icons.PS1"

Rem Changing the current directory to the local base installation of PowerShell.
ChDir %PowerShellBase%

Rem Enabling the execution of local scripts on this machine.
%PowerShellExecutable% -Command "& {Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser}"

Rem Executing the script that changes some desktop icons.
%PowerShellExecutable% %PowerShellScript%

@Rem  Just remove the "Rem" command in front of the next line for debugging purposes.
Rem Pause
