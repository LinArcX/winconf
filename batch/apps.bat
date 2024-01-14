@echo off

set apps=brave,lite xl,speedcrunch,anki,zeal,qbittorrent,uget,tor browser,clavier+,screencast,^
powershell(pwsh),cmd,paint,regedit,^
dependencies,window detective,^
system properties,system information,system configuration,control panel,programs and features,services,network adapters,date and time,^
performance monitor,resource monitor,remote desktop,component services,event viewer,computer managment,group policy editor(gpedit.msc),malicious software removal tool

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
  if "%%s"=="screencast" ( "D:\workspace\other\winconf\batch\screencast.bat" )

  if "%%s"=="powershell(pwsh)" ( start pwsh )
  if "%%s"=="cmd" ( start %%s )
  if "%%s"=="paint" ( start mspaint )
  if "%%s"=="regedit" ( regedit )

  if "%%s"=="dependencies" ( "C:\Users\saeed\scoop\apps\dependencies\current\DependenciesGui.exe" )
  if "%%s"=="window detective" ( "C:\Program Files (x86)\Window Detective\Window Detective.exe" )

  if "%%s"=="system properties" ( start sysdm.cpl )
  if "%%s"=="system information" ( start msinfo32 )
  if "%%s"=="system configuration" ( start msconfig ) 
  if "%%s"=="control panel" ( start control )
  if "%%s"=="programs and features" ( start appwiz.cpl )
  if "%%s"=="services" ( start services.msc )
  if "%%s"=="network adapters" ( start ncpa.cpl )
  if "%%s"=="date and time" ( start timedate.cpl ) 

  if "%%s"=="resource monitor" ( start resmon)
  if "%%s"=="performance monitor" ( start perfmon.msc)
  if "%%s"=="remote desktop" ( start mstsc)
  if "%%s"=="component services" ( start dcomcnfg)
  if "%%s"=="event viewer" ( start eventvwr.msc)
  if "%%s"=="computer managment" ( start compmgmt.msc)
  if "%%s"=="group policy editor(gpedit.msc)" ( gpedit.msc )
  if "%%s"=="malicious software removal tool" ( start mrt )
)
del "%temp%\apps.txt"

REM - "powercfg.cpl": Power Options.
REM - "netplwiz": Advanced User Accounts window.
REM - "devmgmt.msc": Windows Device Manager.
REM - "firewall.cpl": Windows Firewall.
REM - "lusrmgr.msc": Local Users and Groups Manager.
REM - "main.cpl": Adjust your mouse settings.
