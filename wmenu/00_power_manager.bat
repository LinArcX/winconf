@echo off

set items=Zzz(lock),Logout,Restart,Shutdown

start /B wmenu.exe -elements "%items%" -prompt "PowerManager: " -caseInsensitive -fontName "Cascadia Code" -fontSize 8 | more > %temp%/items.txt

for /f "tokens=*" %%s in (%temp%\items.txt) do (
  IF "%%s"=="Zzz(lock)" (
	Rundll32.exe user32.dll,LockWorkStation
  ) ELSE IF "%%s"=="Logout" (
	shutdown /l
  ) ELSE IF "%%s"=="Restart" (
	shutdown -r -t 0
  ) ELSE IF "%%s"=="Shutdown" (
	shutdown /p /f
  ) ELSE (
	REM default case...
  )
)

del "%temp%\items.txt"