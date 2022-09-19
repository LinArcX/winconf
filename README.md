#TOD
[] compile dmenu with cygwin.
[] compile lf with cygwin.
[] compile nvim with cygwin.

# Windows Basics
- Default user directory: `C:\Users\<user-name>`
- Switch to it: `cd ~` or `cd`
- Switch to root of current drive: `cd /`
- `cd %AppData%` just work in cmd. In powershell, you should use: `cd $env:APPDATA`
- To power-off the computer: `shutdown /p` or Stop-Computer
- To restart the computer: `shutdown /r` or Restart-Computer
- Default config folder (equivalent to `~/.config` in __*nix-based__ os):

    `C:\Users\linarcx\AppData\Local`
- Switch to it:

    `cd $env:LOCALAPPDATA`
- To start an application at start-up, you should put it's shortcut here:

    `C:\Users\linarcx\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup`

    To do that, hit: `Win+R` and type: `shell:startup`

## SymLinks, HardLinks, ShortCuts
- Create symlinks:

    `new-item -itemtype SymbolicLink -path <path to location> -name <the name> -value <path to target>`

    For example:

    `New-Item -ItemType SymbolicLink -Path "C:\Users\linarcx\AppData\Local\nvim" -Name "init.lnk" -Value "init.vim"`

- Create HardLinks:
    `New-Item -itemtype HardLink -path $env:LOCALAPPDATA\nvim\ -name plugins.vim -value C:\winny\.config\.nvim\plugins.vim`

Tip: To manage your dot-files, always use __SymbolicLink_.

## Services
Search for a service:
`Get-Service  | grep Event`

Start Service:
`Start-Service EventLog`

# Configuring Special Software
## Chocolatey
As of version 0.9.8.24, binaries, libraries and Chocolatey components will install:

`C:\ProgramData\chocolatey`

* Environment Variable `%ProgramData%` by default.

## Tor
- Download Tor-Expert-Bundle:
https://www.torproject.org/dist/torbrowser/10.0/tor-win32-0.4.3.6.zip

- Unzip it, and install as as service:

    `C:\Tor\tor.exe --service install`

- To check if the service with the settings file starts (it does not contain errors), you can use this command:

    `C:\Tor\tor.exe -f "C:\Tor\torrc"`

- Now install the Tor service, which will read the settings from the C:\Tor\torrc file:

    `C:\Tor\tor.exe --service install -options -f "C:\Tor\torrc"`

* Remember that you must specify options after the -options flag, otherwise they will be ignored.
- To start and stop the service, use the following commands:
    ```
    C:\Tor\tor.exe --service start
    C:\Tor\tor.exe --service stop
    ```

- To remove the service:
    ```
    C:\Tor\tor.exe --service stop
    C:\Tor\tor.exe --service remove
    ```

* Note that you must first stop the service and then delete it.
* By default, the Tor service listens on port 9050.
    So you can check whether it is started by a command that shows if port 9050 is listened:
    `netstat -aon | findstr ":9050"`

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

## Other
- `Alt + F7`: Clears the command history.
- `Ctrl + C`: Break out of the subprompt or terminate execution.
- `Ctrl + End` : Delete all the characters in the line after the cursor.
- `Ctrl + Left Arrow || Ctrl + Right Arrow` : Move left or right one word at a time.
- `Ctrl + S: Pause||resume the display of output.
- `Esc`: Clear the current line.
- `F1`: Moves the cursor one character to the right on the command line.
    At the end of the line, inserts one character from the text of your last command.
- `F2`: Creates a new command line by copying your last command line up to the character you type.
- `F3`: Completes the command line with the content from your last command line, starting from the current cursor position to the end of the line.
- `F4`: Deletes characters from your current command line, starting from the current cursor position up to the character you type.
- `F5`: Scans backward through your command history.
- `F7`: Similar to get-history. Displays a pop-up window with your command history and allows you to select a command.
    Use the arrow keys to scroll through the list. Press Enter to select a command to run, or press the Right arrow to place the text on the command line.
- `F8`: Uses text you’ve entered to scan backward through your command history for commands that match the text you’ve typed so far on the command line.
- `F9`: Runs a specific numbered command from your command history. Command numbers are listed when you press F7 or get-history.
- `Page Up / Page Down`: Gets the first/last command in the command history.
- `Right-click`: If QuickEdit is disabled, displays an editing shortcut menu with Mark, Copy, Paste, Select All, Scroll, and Find options.
    To copy the screen buffer to the Clipboard, right-click, choose Select, and then press Enter.
- `Tab / Shift+Tab`: Press the Tab key or press Shift+Tab to access the tab expansion function, which include folder or filename autocompletion.

# Development
## Setup git
First install openssh:
`gsudo choco install openssh`

Then generate a rsa key:
`ssh-keygen -t rsa -b 2048 -C "email@example.com"`

It'll create two files: __id_rsa__ and __id_rsa.pub__.
Open id_rsa.pub and copy it's content into your git account in ssh part.

https://docs.gitlab.com/ee/ssh/

## C/C++ Development without VisualStudio
First install these base packages via chocolatey:

```
visualstudio-installer
visualstudio2019community
visualstudio2019buildtools
visualstudio2019-workload-vctools
```

Above packages will install these indiviaul components on your machine:
- C++ 2019 Redistributable update
- C++ CMake tools for windows
- MSVC v142 - VS 2019 C++ x86/64 build tools(v14.27)
- C++ AddressSanitizer
- Testing tools core features - Build Tools
- C++ Build Tools core features
- Windows 10 SDK(10.0.18362.0)
- Windows Universal C Runtime
Tip: You can check them in indivual components tab in visual-studio-installer.

For Command-line development:
`windows-sdk-10.1`

Above package will install these indivisual components on your machine:
- .NET Framework 4.6.1 targeting pack
- .NET Framework 4.8 SDK

For Native-Desktop development:
`visualstudio2019-workload-nativedesktop`

Packages directory:
`C:\ProgramData\Microsoft\VisualStudio\Packages`

Shared components, tools, sdk:
`C:\Program Files (x86)\Microsoft Visual Studio\Shared`

Build Tools:
`C:\Program Files (x86)\Microsoft Visual Studio\2019\BuildTools`

# Alternatives
- htop
- ranger
- dmenu
- tmux

# Should be in windows
- zathura
- translate-shell

# TODO
## Neovim Issue
- Icons doesn't appear.

## Windows
- Set default apps and extensions like mimeapps in linux via powershell.
- Alt-F4 not working to close windows.(use alt+q instead!)
- Disable Ctrl+alt+arrow keys.
- Bind Ctrl+a, BackSpace to Ctrl+k.
- Set startup apps here: `C:\Users\saeed\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup` via powershell.
- Manage tor via services(aliases)
- Set Environtment variables from powershell.
- Environtment variables not seen after setting.(You should poweroff computer to see it.)
- Use torify
- Sort choco package by latest install date
- Set keybinding to open regedit, window

# Windows shortcuts
Windows key + I 	Open Settings app.
Windows key + E 	Open File Explorer.
Windows key + D 	Display and hide the desktop.
Windows key + M 	Minimize all windows.
Windows key + Shift + M Restore minimized windows on the desktop.
Windows key + L 	Lock device.
Windows key + W 	Open the Windows Ink Workspace.
Windows key + Plus (+) 	Zoom in using the magnifier.
Windows key + Minus (-) 	Zoom out using the magnifier.
Windows key + Esc 	Exit magnifier.
Windows key + X 	Quick Link menu.
Windows key + X + a Open default PowerShell.
Windows key + PrtScn 	Capture full screenshot in the "Screenshots" folder.
Windows key + Shift + S 	Capture part of the screen with Snip & Sketch.
Windows key + Period (.) or semicolon (;) 	Open emoji panel.
Windows key + Left arrow key 	Snap app or window left.
Windows key + Right arrow key 	Snap app or window right.
Windows key + V 	Open Clipboard bin.
Windows key + A 	Open Action center.

Windows key + Tab 	Open Task View.
Windows key + Ctrl + D 	Create a virtual desktop.
Windows key + Ctrl + F4 	Close active virtual desktop.
Windows key + Ctrl + Right arrow 	Switch to the virtual desktop on the right.
Windows key + Ctrl + Left arrow 	Switch to the virtual desktop on the left.

Ctrl + Shift + Esc 	Open Task Manager.
Ctrl + Alt + Tab 	View open apps.

# Run commands
- "\": Open the Windows 10 drive.
- ".": Open the Home folder of the current user.
- "..": Open the Users folder.
- "appwiz.cpl": Open Programs and Features.
- "compmgmt.msc": The Computer Management app.
- "control": Open Control Panel.
- "dcomcnfg": Component Services.
- "devmgmt.msc": Windows Device Manager.
- "eventvwr.msc": Windows Event Viewer.
- "firewall.cpl": Windows Firewall.
- "gpedit.msc": Group Policy Editor in Windows.
- "resmon": Open Resource Monitor.
- "lusrmgr.msc": Local Users and Groups Manager.
- "main.cpl": Adjust your mouse settings.
- "mrt": Malicious software removal tool.
- "msconfig": Open System Configuration.
- "msinfo32": Access System Information.
- "mstsc": Open Remote Desktop.
- "ncpa.cpl": Access all your Network Adapters.
- "netplwiz": Advanced User Accounts window.
- "regedit": Registry Editor.
- "perfmon.msc": Performance monitor.
- "powercfg.cpl": Power Options.
- "services.msc": Open services window.
- "shell:startup": Open startup folder.
- "shell:RecycleBinFolder": Open RecycleBin.
- "sysdm.cp": System Properties window.
- "timedate.cpl": Date and Time Properties Properties.

# WSL
1. Open start menu and search for: `windows features, open Turn Windows features On or Off`.
2. Find __Windows Subsystem for Linux__, click to turn it on.
3. After a restart, you could now open your windows command line and input `bash`, then hit __enter__.

    3.1. You may see something like this:

    > bash
        Windows Subsystem for Linux has no installed distributions.
        Distributions can be installed by visiting the Microsoft Store:
        https://aka.ms/wslstore

    Don't worry! you should just install a distro!(via windows store or via chocolatey.)

4. Then you need to configure your default user and password to the system. This is just for this built-in Ubuntu, not Windows
5. Install wsl2(don't use wls, it's terrible!), and other distributions like arch via chocolatey.
```
gsudo choco install wsl2 wsl-archlinux
```

# Export/Import env
Export:

`SET >> allvariables.txt`

Import:

`C:\> for /F %A in (allvariables.txt) do SET %A`

# References
- https://www.thetopsites.net/article/54098567.shtml
- https://miloserdov.org/?p=1839
- https://github.com/git-for-windows/git/wiki/Symbolic-Links#allowing-non-administrators-to-create-symbolic-links
- https://superuser.com/questions/327401/is-there-a-windows-command-line-with-smart-bash-like-autocompletions-command-h/327422
- https://ss64.com/ps/syntax-env.html
- https://medium.com/@vhanla/agnoster-like-theme-for-powershell-95d257ba9ba8
- https://www.windowscentral.com/best-windows-10-keyboard-shortcuts
- https://www.maketecheasier.com/20-run-commands-windows/
