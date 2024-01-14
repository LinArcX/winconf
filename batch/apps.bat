@echo off

set apps=brave;system properties;powershell(pwsh);file manager;lite xl;anki;qbittorrent;zeal;speedcrunch;tor browser;uget;dependencies;window detective;regedit;group policy editor(gpedit.msc);paint;cmd;clavier+;recycle bin;programs and features;date and time;computer managment;
start /B wmenu.exe -element-delimiter ";" -elements "%apps%" -prompt "Apps: " -fontName "Cascadia Code PL" -fontSize 9 -caseInsensitive -lineNumber 8 | more > %temp%/apps.txt

REM ProcessExplorer;
REM ELSE IF "%%s"=="ProcessExplorer" (
REM "C:\ProgramData\chocolatey\lib\procexp\tools\procexp64.exe"
REM )

REM - "control": Open Control Panel.
REM - "dcomcnfg": Component Services.
REM - "devmgmt.msc": Windows Device Manager.
REM - "eventvwr.msc": Windows Event Viewer.
REM - "firewall.cpl": Windows Firewall.
REM - "resmon": Open Resource Monitor.
REM - "lusrmgr.msc": Local Users and Groups Manager.
REM - "main.cpl": Adjust your mouse settings.
REM - "mrt": Malicious software removal tool.
REM - "msconfig": Open System Configuration.
REM - "msinfo32": Access System Information.
REM - "mstsc": Open Remote Desktop.
REM - "ncpa.cpl": Access all your Network Adapters.
REM - "netplwiz": Advanced User Accounts window.
REM - "perfmon.msc": Performance monitor.
REM - "powercfg.cpl": Power Options.
REM - "services.msc": Open services window.
REM - "shell:startup": Open startup folder.


for /f "tokens=*" %%s in (%temp%\apps.txt) do (
  IF "%%s"=="brave" (
    "C:\Users\saeed\scoop\apps\brave\current\brave.exe"
  ) ELSE IF "%%s"=="system properties" (
	  start sysdm.cpl
  ) ELSE IF "%%s"=="powershell(pwsh)" (
	  start pwsh
  ) ELSE IF "%%s"=="file manager" (
	  start explorer
  ) ELSE IF "%%s"=="lite xl" (
    "C:\Users\saeed\scoop\apps\lite-xl\current\lite-xl.exe"
  ) ELSE IF "%%s"=="anki" (
    "C:\Users\saeed\scoop\apps\anki\current\anki.exe"
  ) ELSE IF "%%s"=="tor browser" (
    "E:\software\02_windows\tor\Tor Browser\Browser\firefox.exe"
  ) ELSE IF "%%s"=="zeal" (
    "C:\Users\saeed\scoop\apps\zeal\current\zeal.exe"
  ) ELSE IF "%%s"=="speedcrunch" (
    "C:\Users\saeed\scoop\apps\speedcrunch\current\speedcrunch.exe"
  ) ELSE IF "%%s"=="qbittorrent" (
    "C:\Users\saeed\scoop\apps\qbittorrent\current\qbittorrent.exe"
  ) ELSE IF "%%s"=="uget" (
    "C:\Users\saeed\scoop\apps\uget\current\bin\uget.exe"
  ) ELSE IF "%%s"=="dependencies" (
    "C:\Users\saeed\scoop\apps\dependencies\current\DependenciesGui.exe"
  ) ELSE IF "%%s"=="window detective" (
	  "C:\Program Files (x86)\Window Detective\Window Detective.exe"
  ) ELSE IF "%%s"=="regedit" (
	  regedit
  ) ELSE IF "%%s"=="group policy editor(gpedit.msc)" (
	  gpedit.msc
  ) ELSE IF "%%s"=="paint" (
	  start mspaint
  ) ELSE IF "%%s"=="cmd" (
	  start %%s
  ) ELSE IF "%%s"=="clavier+" (
    "C:\Users\saeed\scoop\apps\clavier-plus\current\Clavier.exe"
  ) ELSE IF "%%s"=="recycle bin" (
	  start shell:RecycleBinFolder
  ) ELSE IF "%%s"=="programs and features" (
	  start appwiz.cpl
  ) ELSE IF "%%s"=="date and time" (
	  start timedate.cpl
  ) ELSE IF "%%s"=="computer managment" (
	  start compmgmt.msc
  ) ELSE (
	  REM default case...
  )
)

del "%temp%\apps.txt"
