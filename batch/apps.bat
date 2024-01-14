@echo off

set apps=brave,lite xl,speedcrunch,anki,zeal,qbittorrent,uget,tor browser,clavier+,^
powershell(pwsh),cmd,paint,regedit,^
dependencies,window detective,^
control panel,system properties,programs and features,services,computer managment,group policy editor(gpedit.msc),date and time,malicious software removal tool

start /B wmenu.exe -elements "%apps%" -prompt "Apps: " -fontName "Cascadia Code PL" -fontSize 9 -caseInsensitive -lineNumber 10 | more > %temp%/apps.txt

for /f "tokens=*" %%s in (%temp%\apps.txt) do (
  if "%%s"=="brave" ( "C:\Users\saeed\scoop\apps\brave\current\brave.exe" )
  if "%%s"=="lite xl" ( "C:\Users\saeed\scoop\apps\lite-xl\current\lite-xl.exe" )
  if "%%s"=="speedcrunch" ( "C:\Users\saeed\scoop\apps\speedcrunch\current\speedcrunch.exe" )
  if "%%s"=="anki" ( "C:\Users\saeed\scoop\apps\anki\current\anki.exe" )
  if "%%s"=="zeal" ( "C:\Users\saeed\scoop\apps\zeal\current\zeal.exe" )
  if "%%s"=="qbittorrent" ( "C:\Users\saeed\scoop\apps\qbittorrent\current\qbittorrent.exe" )
  if "%%s"=="uget" ( "C:\Users\saeed\scoop\apps\uget\current\bin\uget.exe" )
  if "%%s"=="tor browser" ( "E:\software\02_windows\tor\Tor Browser\Browser\firefox.exe" )
  if "%%s"=="clavier+" ( "C:\Users\saeed\scoop\apps\clavier-plus\current\Clavier.exe" )

  if "%%s"=="powershell(pwsh)" ( start pwsh )
  if "%%s"=="cmd" ( start %%s )
  if "%%s"=="paint" ( start mspaint )
  if "%%s"=="regedit" ( regedit )

  if "%%s"=="dependencies" ( "C:\Users\saeed\scoop\apps\dependencies\current\DependenciesGui.exe" )
  if "%%s"=="window detective" ( "C:\Program Files (x86)\Window Detective\Window Detective.exe" )

  if "%%s"=="control panel" ( start control )
  if "%%s"=="system properties" ( start sysdm.cpl )
  if "%%s"=="programs and features" ( start appwiz.cpl )
  if "%%s"=="services" ( start services.msc )
  if "%%s"=="computer managment" ( start compmgmt.msc)
  if "%%s"=="group policy editor(gpedit.msc)" ( gpedit.msc )
  if "%%s"=="date and time" ( start timedate.cpl ) 
  if "%%s"=="malicious software removal tool" ( start mrt )
)
del "%temp%\apps.txt"

REM - "ncpa.cpl": Access all your Network Adapters.
REM - "devmgmt.msc": Windows Device Manager.
REM - "resmon": Open Resource Monitor.
REM - "firewall.cpl": Windows Firewall.
REM - "dcomcnfg": Component Services.
REM - "eventvwr.msc": Windows Event Viewer.
REM - "lusrmgr.msc": Local Users and Groups Manager.
REM - "main.cpl": Adjust your mouse settings.
REM - "msconfig": Open System Configuration.
REM - "msinfo32": Access System Information.
REM - "mstsc": Open Remote Desktop.
REM - "netplwiz": Advanced User Accounts window.
REM - "perfmon.msc": Performance monitor.
REM - "powercfg.cpl": Power Options.
