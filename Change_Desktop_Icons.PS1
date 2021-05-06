# How to test:
#
# 1. Rename the My Computer Desktop Icon to "Fifi".
# 2. Remove the My Computer Desktop Icon from the Desktop View.
# 3. Run this snippet.
# 4. Observe how the My Computer Desktop Icon is produced on the Desktop View,
#    with the name "V.D.I." and with a very beautiful Desktop Icon.

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

# Changes the My Computer desktop icon name from "This PC" to "V.D.I.".

$My_Computer = 17

$Shell = New-Object -COMObject Shell.Application

$NSComputer = $Shell.Namespace($My_Computer)

$NSComputer.Self.Name = "V.D.I."

# Change the My Computer Desktop Icon, the Network Desktop Icon, the Control Panel Icon and the Recycle Bin Icons.

$RegPath_MyComputer =                                                                                                                         `
    'Registry::HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}\DefaultIcon'

$RegPath_Network =                                                                                                                            `
    'Registry::HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\CLSID\{F02C1A0D-BE21-4350-88B0-7367FC96EF3C}\DefaultIcon'

$RegPath_Control_Panel =                                                                                                                      `
    'Registry::HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\CLSID\{26EE0668-A00A-44D7-9371-BEB064C98683}\DefaultIcon'

$RegPath_Recycle_Bin =                                                                                                                        `
    'Registry::HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\CLSID\{645FF040-5081-101B-9F08-00AA002F954E}\DefaultIcon'

$Icon_MyComputer =                                                           `
    'Y:\Digitization\Icons\Robsonbillponte-Happy-Holidays-Pictures.ICO'

$Icon_Network =                                                              `
    'Y:\Digitization\Icons\Aha-Soft-Free-Global-Security-Global-Network.ICO'

$Icon_Control_Panel =                                                        `
    'Y:\Digitization\Icons\Aroche-Delta-Control-Panel.ICO'

$Icon_Recycle_Bin_Empty =                                                    `
    'Y:\Digitization\Icons\Iconshock-Vista-General-Trash.ICO'

$Icon_Recycle_Bin_Full =                                                     `
    'Y:\Digitization\Icons\Custo-Man-Christmas-Trash.ICO'

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

if (!(Test-Path -Path $RegPath_Control_Panel))
{
    $null = New-Item                           `
                -Path   $RegPath_Control_Panel `
                -Force
}

if (!(Test-Path -Path $RegPath_Recycle_Bin))
{
    $null = New-Item                           `
                -Path   $RegPath_Recycle_Bin   `
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

Set-ItemProperty                  `
    -Path  $RegPath_Control_Panel `
    -Name  '(Default)'            `
    -Value $Icon_Control_Panel    `
    -Type  ExpandString           `
    -Force

Set-ItemProperty                      `
    -Path  $RegPath_Recycle_Bin       `
    -Name  '(Default)'                `
    -Value $Icon_Recycle_Bin_Empty    `
    -Type  ExpandString               `
    -Force

Set-ItemProperty                      `
    -Path  $RegPath_Recycle_Bin       `
    -Name  'empty'                    `
    -Value $Icon_Recycle_Bin_Empty    `
    -Type  ExpandString               `
    -Force

Set-ItemProperty                      `
    -Path  $RegPath_Recycle_Bin       `
    -Name  'full'                     `
    -Value $Icon_Recycle_Bin_Full     `
    -Type  ExpandString               `
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

# Reinforcing again the Refresh Procedure.
# However, the Control Panel Desktop Icon does not want to change itself to the new image.
[WinAPI.Explorer]::Refresh()
