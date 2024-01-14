# Philosophy
I tend to follow these ideas as much as i can:
- Using Free/Open source software.
- Using Terminal-based applications.
- Not using emulated software like: cygwin or msys2.
- Avoid using software from microsoft like vscode, terminal, etc.. use more free alternative.
- Using software that are written with native windows technologies like win32. c/c++/rust applications are the best.
- In some cases it's better to use GUI applications.(like web-browsers)

# Prerequisites
- cmd
- wmenu [https://github.com/LinArcX/wmenu]
- scoop
  gsudo lf uutils-coreutils 7zip alacritty brave flameshot mpv nomacs okular ffmpeg speedcrunch unar winrar youtube-dl mediainfo mpg123 anki
  clavier-plus clink clink-completions clink-flex-prompt
  git fd grep llvm neovim lite-xl fzf dependencies openssh regdllview scc ripgrep ugrep bottom(btm) jq tar

## Optional
- broot
- QBitTorrent
- OBS Studio
- fzf-bash
- fzf-bash-completion
- wezterm [https://wezfurlong.org/wezterm/] - replacement of tmux

## Packages that may not available
- amber
- exa
- eva
- bat?
- rsync
- translate-shell
- net-tools
- tzutils
- sc-im
- zathura
- arc
- ascii
- atool
- bc
- bvi
- bzip3
- cgdb
- cloc
- colordiff
- colorgcc
- cppcheck
- coreutils
- cpuid
- cscope
- ctags
- ctris
- curl
- diffstat
- diffutils
- dog
- dos2unix
- doxygen
- duff
- enca
- gdb
- gcc-core
- gcc-g++
- xxd
- p7zip
- zip
- unzip
- xz
- zstd
- bash

# Windows Basics
- User home directory or user profile(%USERPROFILE%) is located: `C:\Users\<username>`
  You can Switch to it by: `~`
- Switch to root of current drive: `/` or `cd /`
- Switch to application directory: `cd %AppData%`.
  In powershell: `cd $env:APPDATA`
- To power-off the computer: `shutdown /p` 
  In powershell: Stop-Computer
- To restart the computer: `shutdown /r`
  In powershell: Restart-Computer
- Default config folder (equivalent to `~/.config` in __*nix-based__ os) is located: `C:\Users\linarcx\AppData\Local`
  You can switch to it by: `cd %LOCALAPPDATA%`
  In powershell: `cd $env:LOCALAPPDATA`
- To start an application at start-up, you should put it's shortcut here:
   `C:\Users\<username>\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup`
    Instead of browsing with file explorer, you can hit: `Win+R` and type: `shell:startup`

## SymLinks, HardLinks, ShortCuts
- Create symlinks:
    `new-item -itemtype SymbolicLink -path <path to location> -name <the name> -value <path to target>`
    For example:
    `New-Item -ItemType SymbolicLink -Path "C:\Users\linarcx\AppData\Local\nvim" -Name "init.lnk" -Value "init.vim"`

- Create HardLinks:
    `New-Item -itemtype HardLink -path $env:LOCALAPPDATA\nvim\ -name plugins.vim -value C:\winny\.config\.nvim\plugins.vim`

Tip: To manage your dot-files, always use __SymbolicLink_.

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

# References
- https://www.thetopsites.net/article/54098567.shtml
- https://miloserdov.org/?p=1839
- https://github.com/git-for-windows/git/wiki/Symbolic-Links#allowing-non-administrators-to-create-symbolic-links
- https://superuser.com/questions/327401/is-there-a-windows-command-line-with-smart-bash-like-autocompletions-command-h/327422
- https://ss64.com/ps/syntax-env.html
- https://medium.com/@vhanla/agnoster-like-theme-for-powershell-95d257ba9ba8
- https://www.windowscentral.com/best-windows-10-keyboard-shortcuts
- https://www.maketecheasier.com/20-run-commands-windows/
