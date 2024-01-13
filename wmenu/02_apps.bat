@echo off

set apps=Brave;SystemProperties;Powershell(pwsh);File Manager;Notepad++;Anki;TorBrowser;Zeal;Calculator(speedcrunch);QBitTorrent;Uget(Download Manager);DependencyWalker;ProcessExplorer;WindowDetective;RegEdit;LocalGroupPolicyEditor(gpedit.msc);Notepad;Paint;Cmd;Clavier+;RecycleBin;ProgramsAndFeatures;DateTime;ComputerManagment;
start /B wmenu.exe -element-delimiter ";" -elements "%apps%" -prompt "Apps: " -fontName "FiraCode Nerd Font Mono" -fontSize 8 -caseInsensitive -lineNumber 8 | more > %temp%/apps.txt

for /f "tokens=*" %%s in (%temp%\apps.txt) do (
  IF "%%s"=="Brave" (
	"C:\Users\saeed\AppData\Local\BraveSoftware\Brave-Browser\Application\brave.exe"
  ) ELSE IF "%%s"=="SystemProperties" (
	start sysdm.cpl
  ) ELSE IF "%%s"=="Powershell(pwsh)" (
	start pwsh
  ) ELSE IF "%%s"=="File Manager" (
	start explorer
  ) ELSE IF "%%s"=="Notepad++" (
	start %%s
  ) ELSE IF "%%s"=="Anki" (
	"C:\Program Files\Anki\anki.exe"
  ) ELSE IF "%%s"=="TorBrowser" (
	"D:\software\02_windows\Tor Browser\Browser\firefox.exe"
  ) ELSE IF "%%s"=="Zeal" (
	"C:\Program Files\Zeal\zeal.exe"
  ) ELSE IF "%%s"=="Calculator(speedcrunch)" (
	"C:\Program Files (x86)\SpeedCrunch\speedcrunch.exe"
  ) ELSE IF "%%s"=="QBitTorrent" (
	"C:\Program Files\qBittorrent\qbittorrent.exe"
  ) ELSE IF "%%s"=="Uget(Download Manager)" (
	"C:\ProgramData\chocolatey\bin\uget.exe"
  ) ELSE IF "%%s"=="DependencyWalker" (
	"C:\ProgramData\chocolatey\lib\dependencywalker\content\depends.exe"
  ) ELSE IF "%%s"=="ProcessExplorer" (
	"C:\ProgramData\chocolatey\lib\procexp\tools\procexp64.exe"
  ) ELSE IF "%%s"=="WindowDetective" (
	"C:\Program Files (x86)\Window Detective\Window Detective.exe"
  ) ELSE IF "%%s"=="RegEdit" (
	regedit
  ) ELSE IF "%%s"=="LocalGroupPolicyEditor(gpedit.msc)" (
	gpedit.msc
  ) ELSE IF "%%s"=="Notepad" (
	start %%s
  ) ELSE IF "%%s"=="Paint" (
	start mspaint
  ) ELSE IF "%%s"=="Cmd" (
	start %%s
  ) ELSE IF "%%s"=="Clavier+" (
	start C:\Users\saeed\AppData\Local\Clavier+\Clavier.exe
  ) ELSE IF "%%s"=="RecycleBin" (
	start shell:RecycleBinFolder
  ) ELSE IF "%%s"=="ProgramsAndFeatures" (
	start appwiz.cpl
  ) ELSE IF "%%s"=="DateTime" (
	start timedate.cpl
  ) ELSE IF "%%s"=="ComputerManagment" (
	start compmgmt.msc
  ) ELSE IF "%%s"=="ProgramsAndFeatures" (
	start appwiz.cpl
  ) ELSE (
	REM default case...
  )
)

del "%temp%\apps.txt"