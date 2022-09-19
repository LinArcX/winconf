@echo off

set items=Zzz(lock);LogOut;Restart;PowerOff;
start /B wmenu.exe --elements "%items%" | more > %temp%/items.txt

for /f "tokens=*" %%s in (%temp%\items.txt) do (
  IF "%%s"=="Zzz(lock)" (
	Rundll32.exe user32.dll,LockWorkStation
  ) ELSE IF "%%s"=="LogOut" (
	shutdown /l
  ) ELSE IF "%%s"=="Restart" (
	shutdown /r /f
  ) ELSE IF "%%s"=="PowerOff" (
	shutdown /p /f
  ) ELSE (
	REM default case...
  )
)

del "%temp%\items.txt"