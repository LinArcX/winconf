# PowerShell
Powershell is a shell, scripting language that has a package manager.

## Less
You should install `pscx` package:

`Find-Package pscx | Install-Package -Force -AllowClobber`

## List of all installed packages
`Get-AppxPackage | Select Name, PackageFullName`

## Remove foo
`Get-AppxPackage *foo* | Remove-AppxPackage`

Tip: Some apps like microsoft-edge or cortana can't uninstall from your system and throw this error:
> Remove-AppxPackage: Deployment failed with HRESULT: 0x80073CFA, Removal failed. Please contact your software vendor. (0x80073CFA)
error 0x80070032: AppX Deployment Remove operation on package Microsoft.MicrosoftEdge_44.18362.267.0_neutral__8wekyb3d8bbwe from: C:\Windows\SystemApps\Microsoft.MicrosoftEdge_8wekyb3d8bbwe failed.
This app is part of Windows and cannot be uninstalled on a per-user basis.
An administrator can attempt to remove the app from the computer using Turn Windows Features on or off. However, it may not be possible to uninstall the app.                                                                          NOTE: For additional information, look for [ActivityId] e1738bb4-9178-0007-c48f-73e17891d601 in the Event Log or use the command line Get-AppPackageLog -ActivityID e1738bb4-9178-0007-c48f-73e17891d601

The workaround:
http://woshub.com/remove-appxpackage-0x80073cfa-removal-failed/

## Create per-user config file for powershell
`New-Item $profile -Type File -Force`

It will create a file called `Microsoft.PowerShell_profile.ps1` here:

`C:\Users\<user-name>\Documents\PowerShell`

You can open it like this: `nvim $profile`

## Create new alias
`new-alias grep findstr`

## Add new variable to environment variables list
`$env:Path += ";C:\tools\neovim\Neovim\bin"`

## Refresh environment variables without close terminal
`refreshenv`

## Move file to a directory
`Move-Item -Path <source-file> -Destination <dest-directory>`
