- [] Can't open files in LF.
- [] Use torify
- [] Bind Ctrl+a, BackSpace to Ctrl+k.
- [] Manage tor via services(aliases)
- [] Environtment variables not seen after setting.(You should poweroff computer to see it.)
- [Done] configure ~/.gitconfig
- [Done] Disable Ctrl+alt+arrow keys.
- [Done] make lite-xl as default editor
- [Done] set keybinding to close current window.
  - Alt + F4 is enough.
- [Done] disable win key:
  Run gpedit.msc and go to: UserConfiguration > Administrative Templates > Windows Components > File Explorer
  And "Enable" this item: "Turn off windows Key hotkeys"
- [Done] How to Export/Import env?
  Export:
  `SET >> allvariables.txt`

  Import:
  `C:\> for /F %A in (allvariables.txt) do SET %A`

- [Done] disalbe F1:
  Copy this into a file and run it as administrator:
  ```
  @echo off
  
  REM Run this file as Administrator
  
  taskkill /f /im HelpPane.exe
  takeown /f c:\windows\HelpPane.exe
  icacls c:\windows\HelpPane.exe /deny Everyone:(X)
  ```
- [Done] disable Ctrl+Alt+down and Ctrl+Alt+up:
  Right click on "Intel Hd Graphics" in system tray. Graphic opitons > HotKeys > Disable.

- [Done] How remove pinned items from QuickAccess?
  Just click on QuickAcces button in file explorer to open it. And then right click on every item that you want to unpin.

- [Done] How to Change Win + E Shortcut Target in Windows 10/11?
  https://www.winhelponline.com/blog/winkey-e-shortcut-target-change/

- [Done] Some pinned items like network locations won't delete from QuickAccess. How remove theme?
  Just put another quickaccess link in QuickAcces folder. Select both of them and unpin them.

- [Done] Hide "All rights reserved" message in CMD:
  This is sort-of possible, but there may be consequences. cmd.exe looks at two registry values (type REG_SZ or REG_EXPAND_SZ) when starting up:

  `HKEY_LOCAL_MACHINE\Software\Microsoft\Command Processor\AutoRun`
  `HKEY_CURRENT_USER\Software\Microsoft\Command Processor\AutoRun`
  Simply put cls in one of them and cmd.exe will automatically wipe the copyright notice, still leaving an empty line unfortunately.
  
  Whether this could interfere with running batch files somehow, I don’t know. You’ll have to try. Fortunately, the change is easily reversible.
  Source: https://superuser.com/questions/1723381/hide-all-rights-reserved-message-in-cmd-in-terminal
- [?] Set keybinding to open regedit window.
- [?] Alt-F4 not working to close windows.(use alt+q instead!)
- [?] Set default apps and extensions like mimeapps in linux via powershell.
- [Canceled] Sort choco package by latest install date
