@echo off

set apps=Brave(browser);Powershell(shell);File Manager(gui);Visual Studio 2019;Emacs(runemacs);Notepad++;Anki;Calculator(speedcrunch);QBitTorrent;Uget(Download Manager);AnyDesk(remote desktop);ChocoCleaner;CmakeGui;DependencyWalker;ProcessExplorer;WindowDetective;Notepad;Paint;Cmd;Clavier+;RecycleBin;
start /B wmenu.exe --elements "%apps%" | more > %temp%/apps.txt

for /f "tokens=*" %%s in (%temp%\apps.txt) do (
  IF "%%s"=="Brave(browser)" (
	"C:\Users\saeed\AppData\Local\BraveSoftware\Brave-Browser\Application\brave.exe"
  ) ELSE IF "%%s"=="Powershell(shell)" (
	start pwsh
  ) ELSE IF "%%s"=="File Manager(gui)" (
	start explorer
  ) ELSE IF "%%s"=="Visual Studio 2019" (
	"C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\Common7\IDE\devenv.exe"
  ) ELSE IF "%%s"=="Emacs(runemacs)" (
	"C:\Program Files\Emacs\emacs-28.1\bin\runemacs.exe"
  ) ELSE IF "%%s"=="Notepad++" (
	start %%s
  ) ELSE IF "%%s"=="Anki" (
	"C:\Program Files\Anki\anki.exe"
  ) ELSE IF "%%s"=="Calculator(speedcrunch)" (
	"C:\Program Files (x86)\SpeedCrunch\speedcrunch.exe"
  ) ELSE IF "%%s"=="QBitTorrent" (
	"C:\Program Files\qBittorrent\qbittorrent.exe"
  ) ELSE IF "%%s"=="Uget(Download Manager)" (
	"C:\ProgramData\chocolatey\bin\uget.exe"
  ) ELSE IF "%%s"=="AnyDesk(remote desktop)" (
	"C:\Program Files (x86)\AnyDesk\AnyDesk.exe"
  ) ELSE IF "%%s"=="ChocoCleaner" (
	pwsh -c  gsudo choco-cleaner.bat 
  ) ELSE IF "%%s"=="CmakeGui" (
	"C:\Program Files\CMake\bin\cmake-gui.exe"
  ) ELSE IF "%%s"=="DependencyWalker" (
	"C:\ProgramData\chocolatey\lib\dependencywalker\content\depends.exe"
  ) ELSE IF "%%s"=="ProcessExplorer" (
	"C:\ProgramData\chocolatey\lib\procexp\tools\procexp64.exe"
  ) ELSE IF "%%s"=="WindowDetective" (
	"C:\Program Files (x86)\Window Detective\Window Detective.exe"
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
  ) ELSE (
	REM default case...
  )
)

del "%temp%\apps.txt"