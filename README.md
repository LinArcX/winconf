# philosophy
I try to follow these ideas as much as i can:
- using free/open source software.
- using terminal-based applications.
- using msys2 for development base and scoop for installing any other packages.
- avoid using software from microsoft like vscode, terminal, etc.. use more free alternative or compile linux versions with msys2.

## for future
- i don't want to rely on supply chain. building software directly the pc is the best/safest way.(so i will ditch scoop in future)
- it's better to replace c/c++ software with rust.
- In some cases it's better to use GUI applications.(like web-browsers)

# prerequisites
As i said, i use msys2 for development.(it has pacman and a wide varity of software)
for installing any other software, i use scoop package manger.

to see list of all software, please refer to:
- msys64\bootstrap.txt
- scoop.md

## other software that maybe usefull
- scoop
- wezterm [https://wezfurlong.org/wezterm/] - replacement of tmux
- 7zip unar winrar zstd tar gsudo fzf
- uget youtube-dl curl dog
  fd grep bat llvm neovim openssh scc ripgrep ugrep jq
  zeal doxygen dos2unix cppcheck cscope delta diffutils gdb
  drmemory

## Optional
- broot
- fzf-bash
- fzf-bash-completion

## Packages that may not available
- opencppcoverage
- bzip3

### Wait for a release
- gf
- xxd

### Linux only
- bvi
- splint
- exa
- sc-im
- atool
- colordiff
- colorgcc
- ascii
- enca
- translate-shell
- cpuid
- net-tools
- cgdb
- tzutils
- zathura

# Windows Basics
- User home directory or user profile(`%USERPROFILE%`) is located: `C:\Users\<username>`
  - You can Switch to it by: `~`
- Switch to the root of current drive: `/` or `cd /`
- Switch to application directory: `cd %AppData%`.
  - In powershell: `cd $env:APPDATA`
- To power-off the computer: `shutdown /p` 
  - In powershell: `Stop-Computer`
- To restart the computer: `shutdown /r`
  - In powershell: `Restart-Computer`
- Default config folder (equivalent to `~/.config` in __*nix-based__ os) is located: `C:\Users\linarcx\AppData\Local`
  - You can switch to it by: `cd %LOCALAPPDATA%`
  - In powershell: `cd $env:LOCALAPPDATA`
- To start an application at start-up, you should put it's shortcut here:

   `C:\Users\<username>\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup`

    Instead of browsing with file explorer, you can hit: `Win+R` and type: `shell:startup`

## SymLinks, HardLinks, ShortCuts
- Create symlinks:
  - `new-item -itemtype SymbolicLink -path <path to location> -name <the name> -value <path to target>`

  For example:
  - `New-Item -ItemType SymbolicLink -Path "C:\Users\linarcx\AppData\Local\nvim" -Name "init.lnk" -Value "init.vim"`

- Create HardLinks:
  - `New-Item -itemtype HardLink -path $env:LOCALAPPDATA\nvim\ -name plugins.vim -value C:\winny\.config\.nvim\plugins.vim`

Tip: To manage your dot-files, always use __SymbolicLink__.

## Other
- Clears the command history:
  `Alt + F7`
- Break out of the subprompt or terminate execution:
  `Ctrl + C`
- Delete all the characters in the line after the cursor:
  `Ctrl + End`
- Move left or right one word at a time:
  `Ctrl + Left Arrow || Ctrl + Right Arrow`
- Pause/resume the display of output:
  `Ctrl + S`
- Clear the current line:
  `Esc`
- Moves the cursor one character to the right on the command line:
  `F1`

    At the end of the line, inserts one character from the text of your last command.
- Creates a new command line by copying your last command line up to the character you type:
  `F2`
- Completes the command line with the content from your last command line, starting from the current cursor position to the end of the line:
  `F3`
- Deletes characters from your current command line, starting from the current cursor position up to the character you type:
  `F4`
- Scans backward through your command history:
  `F5`
- Similar to get-history. Displays a pop-up window with your command history and allows you to select a command:
  `F7`

    Use the arrow keys to scroll through the list. Press Enter to select a command to run, or press the Right arrow to place the text on the command line.
- Uses text you’ve entered to scan backward through your command history for commands that match the text you’ve typed so far on the command line:
  `F8`
- Runs a specific numbered command from your command history. Command numbers are listed when you press F7 or get-history:
  `F9`
- Gets the first/last command in the command history:
  `Page Up / Page Down`
- If QuickEdit is disabled, displays an editing shortcut menu with Mark, Copy, Paste, Select All, Scroll, and Find options:
  `Right-click`

    To copy the screen buffer to the Clipboard, right-click, choose Select, and then press Enter.
- Press the Tab key or press Shift+Tab to access the tab expansion function, which include folder or filename autocompletion:
  `Tab / Shift+Tab`

# Shortcuts
- Close current window:
  `Alt + F4`
- Open Settings app:
  `Windows key + I`
- Open File Explorer:
  `Windows key + E`
- Display and hide the desktop:
  `Windows key + D`
- Minimize all windows:
  `Windows key + M`
- Restore minimized windows on the desktop:
  `Windows key + Shift + M`
- Lock device:
  `Windows key + L`
- Open the Windows Ink Workspace:
  `Windows key + W`
- Zoom in using the magnifier:
  `Windows key + Plus (+)`
- Zoom out using the magnifier:
  `Windows key + Minus (-)`
- Exit magnifier:
  `Windows key + Esc`
- Quick Link menu:
  `Windows key + X`
- Open default PowerShell:
  `Windows key + X + a`
- Capture full screenshot in the "Screenshots" folder:
  `Windows key + PrtScn`
- Capture part of the screen with Snip & Sketch:
  `Windows key + Shift + S`
- Open emoji panel:
  `Windows key + Period (.) or semicolon (;)`
- Snap app or window left:
  `Windows key + Left arrow key`
- Snap app or window right:
  `Windows key + Right arrow key`
- Open Clipboard bin:
  `Windows key + V`
- Open Action center:
  `Windows key + A`
- Open Task View:
  `Windows key + Tab`
- Create a virtual desktop:
  `Windows key + Ctrl + D`
- Close active virtual desktop:
  `Windows key + Ctrl + F4`
- Switch to the virtual desktop on the right:
  `Windows key + Ctrl + Right arrow`
- Switch to the virtual desktop on the left:
  `Windows key + Ctrl + Left arrow`
- Open Task Manager:
  `Ctrl + Shift + Esc`
- View open apps:
  `Ctrl + Alt + Tab`

# Run commands
- Open the Windows 10 drive:
  `\`
- Open the Home folder of the current user:
  `.`
- Open the Users folder:
  `..`

# References
- https://www.maketecheasier.com/20-run-commands-windows/
- https://www.windowscentral.com/best-windows-10-keyboard-shortcuts
- https://github.com/git-for-windows/git/wiki/Symbolic-Links#allowing-non-administrators-to-create-symbolic-links
