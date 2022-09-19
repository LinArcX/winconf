@echo off

set dirs=C:\;Home;.ssh;LocalAppData;.emacs.d;nvim;lf;mpv;Clavier.ini;Downloads;winconf;wmenu;vivre;languages;ConnectToPhone(Ftp)
start /B wmenu.exe --elements "%dirs%" | more > %temp%/dirs.txt

for /f "tokens=*" %%s in (%temp%\dirs.txt) do (
  IF "%%s"=="C:\" (
	start C:\
  ) ELSE IF "%%s"=="Home" (
	start %USERPROFILE%
  ) ELSE IF "%%s"==".ssh" (
	start %USERPROFILE%\.ssh
  ) ELSE IF "%%s"=="LocalAppData" (
	start %LOCALAPPDATA%
  ) ELSE IF "%%s"==".emacs.d" (
	start %APPDATA%\.emacs.d
  ) ELSE IF "%%s"=="nvim" (
	start %LOCALAPPDATA%\nvim
  ) ELSE IF "%%s"=="lf" (
	start %LOCALAPPDATA%\lf
  ) ELSE IF "%%s"=="mpv" (
	start %LOCALAPPDATA%\mpv
  ) ELSE IF "%%s"=="Clavier.ini" (
	start nvim %LOCALAPPDATA%\Clavier+\Clavier.ini
  ) ELSE IF "%%s"=="Downloads" (
	start %userprofile%\Downloads
  ) ELSE IF "%%s"=="winconf" (
	start D:\workspace\other\winconf
  ) ELSE IF "%%s"=="wmenu" (
	start D:\workspace\c++\projects\wmenu
  ) ELSE IF "%%s"=="vivre" (
	start D:\workspace\other\vivre
  ) ELSE IF "%%s"=="languages" (
	start D:\books\02_languages
  ) ELSE IF "%%s"=="ConnectToPhone(Ftp)" (
	start explorer ftp://saeed@192.168.1.38:2121/
  )  ELSE IF "%%s"=="Uget(Download Manager)" (
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

del "%temp%\dirs.txt"