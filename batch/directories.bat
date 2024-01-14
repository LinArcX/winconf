@echo off

set dirs=C:\,%USERPROFILE%,%APPDATA%,%LOCALAPPDATA%,%TEMP%,^
.ssh,nvim,lf,mpv,alacritty.yml,Clavier.ini,Downloads,^
D:\,video(D:\),E:\,video(E:\),^
winconf,wmenu,kaveh,pardis,^
languages(books),proramming(books),connect to phone(ftp)

start /B wmenu.exe -elements "%dirs%" -prompt "Directories: " -fontName "Cascadia Code PL" -fontSize 9 -caseInsensitive -lineNumber 10 | more > %temp%/dirs.txt

for /f "tokens=*" %%s in (%temp%\dirs.txt) do (
  if "%%s"=="C:\" ( start C:\ ) 
  if "%%s"=="%USERPROFILE%" ( start %USERPROFILE% )
  if "%%s"=="%APPDATA%" ( start %APPDATA% )
  if "%%s"=="%LOCALAPPDATA%" ( start %LOCALAPPDATA% )
  if "%%s"=="%TEMP%" ( start %TEMP% )

  if "%%s"==".ssh" ( start %USERPROFILE%\.ssh )
  if "%%s"=="nvim" ( start %LOCALAPPDATA%\nvim )
  if "%%s"=="lf" ( start %LOCALAPPDATA%\lf )
  if "%%s"=="mpv" ( start %LOCALAPPDATA%\mpv )
  if "%%s"=="alacritty.yml" ( start nvim %APPDATA%\alacritty\alacritty.yml )
  if "%%s"=="Clavier.ini" ( start nvim %USERPROFILE%\scoop\apps\clavier-plus\current\Clavier.ini )
  if "%%s"=="Downloads" ( start %USERPROFILE%\Downloads )

  if "%%s"=="D:\" ( start D:\ )
  if "%%s"=="video(D:\)" ( start D:\video )
  if "%%s"=="E:\" ( start E:\ )
  if "%%s"=="video(E:\)" ( start E:\video )

  if "%%s"=="winconf" ( start D:\workspace\other\winconf )
  if "%%s"=="wmenu" ( start D:\workspace\c++\02_maintainance\wmenu )
  if "%%s"=="kaveh" ( start D:\workspace\c\01_active\kaveh )
  if "%%s"=="pardis" ( start D:\workspace\assembly\pardis )

  if "%%s"=="languages(books)" ( start D:\books\02_languages )
  if "%%s"=="proramming(books)" ( start D:\books\01_computer\programming )
  if "%%s"=="connect to phone(ftp)" ( start explorer ftp://saeed@192.168.1.38:2121/ )
)
del "%temp%\dirs.txt"
