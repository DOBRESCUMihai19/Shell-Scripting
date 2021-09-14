##########################################################################
#                                                                        #
# Main Functionalities:                                                  #
#                                                                        #
# 1. Produces the "My Computer" Desktop Icon on the Desktop View.        #
# 2. Changes the "My Computer" Name to "Virtual_Desktop_Infrastructure". #
# 3. Changes the "My Computer" Desktop Icon and a few more.              #
# 4. Changes the Sounds Scheme to "No Sounds".                           #
# 5. Removes the "Search" Icon from the Task-Bar.                        #
# 6. Disables the notifications (not working yet).                       #
#                                                                        #
# Variables.                                                             #
#                                                                        #
# Registry Paths.                                                        #
#                                                                        #
##########################################################################

$RegPath_NewStartPanel =                                                 `
    'Registry::HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\'            `
  + 'CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel'

$RegPath_MyComputer =                                                    `
    'Registry::HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\'            `
  + 'CurrentVersion\Explorer\CLSID\'                                     `
  + '{20D04FE0-3AEA-1069-A2D8-08002B30309D}\DefaultIcon'

$RegPath_Network =                                                       `
    'Registry::HKEY_CURRENT_USER\Software\Microsoft\Windows\'            `
  + 'CurrentVersion\Explorer\CLSID\'                                     `
  + '{F02C1A0D-BE21-4350-88B0-7367FC96EF3C}\DefaultIcon'

$RegPath_Control_Panel =                                                 `
    'Registry::HKEY_CURRENT_USER\Software\Microsoft\Windows\'            `
  + 'CurrentVersion\Explorer\CLSID\'                                     `
  + '{26EE0668-A00A-44D7-9371-BEB064C98683}\DefaultIcon'

$RegPath_Recycle_Bin =                                                   `
    'Registry::HKEY_CURRENT_USER\Software\Microsoft\Windows\'            `
  + 'CurrentVersion\Explorer\CLSID\'                                     `
  + '{645FF040-5081-101B-9F08-00AA002F954E}\DefaultIcon'

$RegPath_Windows_Explorer =                                              `
    'Registry::HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\'   `
  + 'Explorer'

$RegPath_PushNotifications =                                             `
    'Registry::HKEY_CURRENT_USER\Software\Microsoft\Windows\'            `
  + 'CurrentVersion\PushNotifications'

$RegPath_SearchBoxTaskbarMode =                                          `
    'Registry::HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\'            `
  + 'CurrentVersion\Search\'

$RegPath_SoundSchemes =                                                  `
    'Registry::HKEY_CURRENT_USER\AppEvents\Schemes'

$RegPath_SoundSchemesApps =                                              `
    'Registry::HKEY_CURRENT_USER\AppEvents\Schemes\Apps'

##########################################################################
#                                                                        #
# Icon Paths.                                                            #
#                                                                        #
##########################################################################

$Icon_MyComputer =                                                       `
    'Y:\Digitization\Icons\Robsonbillponte-Happy-Holidays-Pictures.ICO'

$Icon_Network =                                                          `
    'Y:\Digitization\Icons\'                                             `
  + 'Aha-Soft-Free-Global-Security-Global-Network.ICO'

$Icon_Control_Panel =                                                    `
    'Y:\Digitization\Icons\Aroche-Delta-Control-Panel.ICO'

$Icon_Recycle_Bin_Empty =                                                `
  'Y:\Digitization\Icons\Iconshock-Vista-General-Trash.ICO'

$Icon_Recycle_Bin_Full =                                                 `
    'Y:\Digitization\Icons\Custo-Man-Christmas-Trash.ICO'

##########################################################################
#                                                                        #
# Names.                                                                 #
#                                                                        #
##########################################################################

$DisableNotificationCenter_Name =                                        `
    'DisableNotificationCenter'

$ToastEnabled_Name =                                                     `
    'ToastEnabled'

$NewStartPanel_Name =                                                    `
    '{20D04FE0-3AEA-1069-A2D8-08002B30309D}'

$Computer_Name =                                                         `
    'Virtual_Desktop_Infrastructure'

$Default_Name =                                                          `
    '(Default)'

$Empty_Name =                                                            `
    'empty'

$Full_Name =                                                             `
    'full'

$SearchBoxTaskbarMode_Name =
    'SearchBoxTaskbarMode'

$Exist =                                                                 `
    "Get-ItemProperty -Path $RegPath_NewStartPanel"                      `
  + "-Name $NewStartPanel_Name"

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

$KeyName_SoundSchemes       = '(Default)'

$SetValue_SoundSchemes      = '.None'

$Declaration_SoundSchemes   = "`nSetting Sound Schemes to 'No Sound'."

$Declaration_FolderCreation = "Creating Folder."

$Declaration_Existence      = "The Registry Key Already Exists."

$Declaration_Change         = "Changing Key Value."

$Declaration_Change_Success = "The Registry Key Value Changed Successfully."

$Declaration_KeyCreation    = "Creating Registry Key."

$Declaration_KeySuccess     = "The Registry Key Created Successfully."

$Name_Current               = ".Current"

$Name_Default               = "(Default)"

$Name_Empty                 = ""

##########################################################################
#                                                                        #
# Numbers.                                                               #
#                                                                        #
##########################################################################

$Zero        =  0

$One         =  1

$My_Computer = 17

##########################################################################
#                                                                        #
# Source Code.                                                           #
#                                                                        #
# Renames the My Computer Desktop Icon.                                  #
#                                                                        #
# Changes the My Computer Desktop Icon Name                              #
# from "This PC"                                                         #
# to "Virtual_Desktop_Infrastructure".                                   #
#                                                                        #
##########################################################################

$Shell                = New-Object -COMObject Shell.Application

$NSComputer           = $Shell.Namespace($My_Computer)

$NSComputer.Self.Name = $Computer_Name

##########################################################################
#                                                                        #
# Change the My Computer Desktop Icon,                                   #
#        the Network Desktop Icon,                                       #
#        the Control Panel Icon                                          #
#    and the Recycle Bin Icons.                                          #
#                                                                        #
# New-Item's.                                                            #
#                                                                        #
##########################################################################

If (!(Test-Path -Path $RegPath_MyComputer))
{
    $null = New-Item                                                     `
                -Path   $RegPath_MyComputer                              `
                -Force
}

If (!(Test-Path -Path $RegPath_Network))
{
    $null = New-Item                                                     `
                -Path   $RegPath_Network                                 `
                -Force
}

If (!(Test-Path -Path $RegPath_Control_Panel))
{
    $null = New-Item                                                     `
                -Path   $RegPath_Control_Panel                           `
                -Force
}

If (!(Test-Path -Path $RegPath_Recycle_Bin))
{
    $null = New-Item                                                     `
                -Path   $RegPath_Recycle_Bin                             `
                -Force
}

##########################################################################
#                                                                        #
# Set-ItemProperty's and New-ItemProperty's.                             #
#                                                                        #
# Produce the My Computer Desktop Icon on the Desktop View.              #
#                                                                        #
# HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer   #
# \HideDesktopIcons\NewStartPanel\                                       #
# {20D04FE0-3AEA-1069-A2D8-08002B30309D}                                 #
# 0 = show                                                               #
# 1 = hide                                                               #
#                                                                        #
##########################################################################

If ($Exist)
{
    Set-ItemProperty                                                     `
        -Path  $RegPath_NewStartPanel                                    `
        -Name  $NewStartPanel_Name                                       `
        -Value $Zero
}
Else
{
    New-ItemProperty                                                     `
        -Path  $RegPath_NewStartPanel                                    `
        -Name  $NewStartPanel_Name                                       `
        -Value $Zero
}

Set-ItemProperty                                                         `
    -Path  $RegPath_MyComputer                                           `
    -Name  $Default_Name                                                 `
    -Value $Icon_MyComputer                                              `
    -Type  ExpandString                                                  `
    -Force

Set-ItemProperty                                                         `
    -Path  $RegPath_Network                                              `
    -Name  $Default_Name                                                 `
    -Value $Icon_Network                                                 `
    -Type  ExpandString                                                  `
    -Force

Set-ItemProperty                                                         `
    -Path  $RegPath_Control_Panel                                        `
    -Name  $Default_Name                                                 `
    -Value $Icon_Control_Panel                                           `
    -Type  ExpandString                                                  `
    -Force

Set-ItemProperty                                                         `
    -Path  $RegPath_Recycle_Bin                                          `
    -Name  $Default_Name                                                 `
    -Value $Icon_Recycle_Bin_Empty                                       `
    -Type  ExpandString                                                  `
    -Force

Set-ItemProperty                                                         `
    -Path  $RegPath_Recycle_Bin                                          `
    -Name  $Empty_Name                                                   `
    -Value $Icon_Recycle_Bin_Empty                                       `
    -Type  ExpandString                                                  `
    -Force

Set-ItemProperty                                                         `
    -Path  $RegPath_Recycle_Bin                                          `
    -Name  $Full_Name                                                    `
    -Value $Icon_Recycle_Bin_Full                                        `
    -Type  ExpandString                                                  `
    -Force

##########################################################################
#                                                                        #
# The following "Set-ItemProperty" Command-Let is producing              #
# the "Requested registry access is not allowed." Error-Message.         #
#                                                                        #
# We do not have Administrative-Privileges                               #
# inside the Virtual-Desktop-Infrastructure.                             #
#                                                                        #
##########################################################################

##########################################################################
#                                                                        #
# Set-ItemProperty                                                      `#
#     -Path  $RegPath_Windows_Explorer                                  `#
#     -Name  $DisableNotificationCenter_Name                            `#
#     -Value $One                                                       `#
#     -Type  DWord                                                      `#
#     -Force                                                             #
#                                                                        #
##########################################################################

##########################################################################
#                                                                        #
# The following "Set-ItemProperty" Command-Let is working,               #
# but it does not produce any kind of effects.                           #
#                                                                        #
##########################################################################

Set-ItemProperty                                                         `
    -Path  $RegPath_PushNotifications                                    `
    -Name  $ToastEnabled_Name                                            `
    -Value $Zero                                                         `
    -Type  DWord                                                         `
    -Force

Set-ItemProperty                                                         `
    -Path  $RegPath_SearchBoxTaskbarMode                                 `
    -Name  $SearchBoxTaskbarMode_Name                                    `
    -Value $Zero                                                         `
    -Type  DWord                                                         `
    -Force

##########################################################################
#                                                                        #
# Set Sound Schemes to no sound.                                         #
#                                                                        #
##########################################################################

Write-Host $Declaration_SoundSchemes                                     `
           -ForeGroundColor Gray

$TestPath = Test-Path $RegPath_SoundSchemes

If (-Not($TestPath -Eq $True))
{
    Write-Host $Declaration_FolderCreation                               `
               -ForeGroundColor Gray

    New-Item $RegPath_SoundSchemes                                       `
             -Force
}

If (Get-ItemProperty -Path $RegPath_SoundSchemes                         `
                     -Name $KeyName_SoundSchemes                         `
                     -EA   SilentlyContinue)
{
    $KeyValue = (Get-ItemProperty                                        `
                    -Path $RegPath_SoundSchemes).$KeyName_SoundSchemes

    If ($KeyValue -Eq $SetValue_SoundSchemes)
    {
 
        Write-Host $Declaration_Existence                                `
                   -ForeGroundColor Green
    }
    Else
    {
         Write-Host $Declaration_Change                                  `
                    -ForeGroundColor Gray
  
         # Set 'No Sound' Schemes.
         New-ItemProperty -Path  $RegPath_SoundSchemes                   `
                          -Name  $KeyName_SoundSchemes                   `
                          -Value $SetValue_SoundSchemes                  `
                          -Force

         # Apply 'No Sound' Schemes.
         Get-ChildItem    -Path  $RegPath_SoundSchemesApps               `
                        | Get-ChildItem                                  `
                        | Get-ChildItem                                  `
                        | Where-Object                                   `
                          { $_.PSChildName -Eq    $Name_Current }        `
                        | Set-ItemProperty -Name  $Name_Default          `
                                           -Value $Name_Empty
 
         Write-Host $Declaration_Change_Success                          `
                    -ForeGroundColor Green
    }
}
Else
{
    Write-Host $Declaration_KeyCreation                                  `
               -ForeGroundColor Gray

    New-ItemProperty -Path  $RegPath_SoundSchemes                        `
                     -Name  $KeyName_SoundSchemes                        `
                     -Value $SetValue_SoundSchemes                       `
                     -Force

    Get-ChildItem    -Path  $RegPath_SoundSchemesApps                    `
                     | Get-ChildItem                                     `
                     | Get-ChildItem                                     `
                     | Where-Object { $_.PSChildName -Eq $Name_Current } `
                     | Set-ItemProperty -Name  $Name_Default             `
                                        -Value $Name_Empty

    Write-Host $Declaration_KeySuccess                                   `
               -ForeGroundColor Green
}

##########################################################################
#                                                                        #
# Refresh the Desktop View.                                              #
#                                                                        #
# We are enforcing the Refresh Procedure.                                #
# However, the Control Panel Desktop Icon does not want to change itself #
# into the new image.                                                    #
#                                                                        #
##########################################################################

Add-Type                                                                 `
    -MemberDefinition $Definition                                        `
    -Namespace        WinAPI                                             `
    -Name             Explorer

[WinAPI.Explorer]::Refresh()
