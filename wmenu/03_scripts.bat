@echo off

set scripts=screencast
start /B wmenu.exe -elements "%scripts%" -prompt "Scripts: " -fontName "Cascadia Code" -fontSize 8 -caseInsensitive | more > %temp%/scripts.txt

for /f "tokens=*" %%s in (%temp%\scripts.txt) do (
  IF "%%s"=="screencast" (
	D:\workspace\other\winconf\batch\Screencast.bat
  ) ELSE IF "%%s"=="Powershell(shell)" (
	start pwsh
  ) ELSE (
	REM default case...
  )
)

del "%temp%\scripts.txt"