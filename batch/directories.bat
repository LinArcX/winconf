@echo off

set dirs=C:\,Home,.ssh,LocalAppData,.emacs.d,nvim,lf,mpv,Clavier.ini,Downloads,D:\;winconf,wmenu,vivre,languages,video(D:\),proramming(books),E:\,video(E:\),ConnectToPhone(Ftp)
start /B wmenu.exe -elements "%dirs%" -prompt "Directories: " -fontName "Cascadia Code" -fontSize 8 -caseInsensitive -lineNumber 8 | more > %temp%/dirs.txt

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
  ) ELSE IF "%%s"=="D:\" (
	start D:\
  ) ELSE IF "%%s"=="winconf" (
	start D:\workspace\other\winconf
  ) ELSE IF "%%s"=="wmenu" (
	start D:\workspace\c++\projects\wmenu
  ) ELSE IF "%%s"=="vivre" (
	start D:\workspace\other\vivre
  ) ELSE IF "%%s"=="languages" (
	start D:\books\02_languages
  ) ELSE IF "%%s"=="video(D:\)" (
	start D:\video
  ) ELSE IF "%%s"=="proramming(books)" (
	start D:\books\01_computer\programming
  ) ELSE IF "%%s"=="E:\" (
	start E:\
  ) ELSE IF "%%s"=="video(E:\)" (
	start E:\video
  ) ELSE IF "%%s"=="ConnectToPhone(Ftp)" (
	start explorer ftp://saeed@192.168.1.38:2121/
  ) ELSE IF "%%s"=="E:\" (
	start E:\
  ) ELSE (
	REM default case...
  )
)

del "%temp%\dirs.txt"