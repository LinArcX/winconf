- [Done] disable win key:
  Run gpedit.msc and go to: UserConfiguration > Administrative Templates > Windows Components > File Explorer
  And "Enable" this item: "Turn off windows Key hotkeys"

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

- [] make notepad++ as default editor
