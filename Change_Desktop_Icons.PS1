# How to test:
#
# 1. Rename the My Computer Desktop Icon to "Fifi".
# 2. Remove the My Computer Desktop Icon from the Desktop View.
# 3. Run this snippet.
# 4. Observe how the My Computer Desktop Icon is produced on the Desktop View,
#    with the name "Tele-Ordinator" and with a very emotional Desktop Icon.

# Allow the execution of snippets.

Set-ExecutionPolicy               `
    -ExecutionPolicy RemoteSigned `
    -Scope           CurrentUser

# Produce the My Computer Desktop Icon on the Desktop View.

# HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel\
# {20D04FE0-3AEA-1069-A2D8-08002B30309D}
# 0 = show
# 1 = hide

$Path = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel"

$Name = "{20D04FE0-3AEA-1069-A2D8-08002B30309D}"

$Exist = "Get-ItemProperty -Path $Path -Name $Name"

if ($Exist)
{
    Set-ItemProperty     `
        -Path  $Path     `
        -Name  $Name     `
        -Value 0
}
Else
{
    New-ItemProperty     `
        -Path  $Path     `
        -Name  $Name     `
        -Value 0
}

# Rename the My Computer Desktop Icon.

# Changes the My Computer desktop icon name from "This PC" to "Tele-Ordinator".

$My_Computer = 17

$Shell = New-Object -COMObject Shell.Application

$NSComputer = $Shell.Namespace($My_Computer)

$NSComputer.Self.Name = "Tele-Ordinator"

# Change the My Computer Desktop Icon.

$RegPath_MyComputer =                                                                                                                         `
    'Registry::HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}\DefaultIcon'

$RegPath_Network =                                                                                                                            `
    'Registry::HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\CLSID\{F02C1A0D-BE21-4350-88B0-7367FC96EF3C}\DefaultIcon'

$Icon_MyComputer =                                                           `
    'Y:\Digitization\Icons\Robsonbillponte-Happy-Holidays-Pictures.Ico'

$Icon_Network =                                                              `
    'Y:\Digitization\Icons\Aha-Soft-Free-Global-Security-Global-Network.Ico'

if (!(Test-Path -Path $RegPath_MyComputer))
{
    $null = New-Item                        `
                -Path   $RegPath_MyComputer `
                -Force
}

if (!(Test-Path -Path $RegPath_Network))
{
    $null = New-Item                     `
                -Path   $RegPath_Network `
                -Force
}

Set-ItemProperty               `
    -Path  $RegPath_MyComputer `
    -Name  '(Default)'         `
    -Value $Icon_MyComputer    `
    -Type  ExpandString        `
    -Force

Set-ItemProperty               `
    -Path  $RegPath_Network    `
    -Name  '(Default)'         `
    -Value $Icon_Network       `
    -Type  ExpandString        `
    -Force

# Refresh the Desktop View.

# Refresh Desktop Ability.

$Definition = @'

    [System.Runtime.InteropServices.DllImport("Shell32.dll")]

    private static extern int SHChangeNotify(
          int    eventId
        , int    flags
        , IntPtr item1
        , IntPtr item2);

    public static void Refresh()
    {
        SHChangeNotify(
          0x8000000
        , 0x1000
        , IntPtr.Zero
        , IntPtr.Zero);
    }
'@

Add-Type                          `
    -MemberDefinition $Definition `
    -Namespace        WinAPI      `
    -Name             Explorer

# Refresh the Desktop View.
[WinAPI.Explorer]::Refresh()
