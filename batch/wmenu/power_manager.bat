@echo off

set items=Zzz(lock),logout,restart,shutdown
start /B wmenu.exe -elements "%items%" -prompt "PowerManager: " -caseInsensitive -fontName "Cascadia Code PL"  -fontSize 9 | more > %temp%/items.txt

for /f "tokens=*" %%s in (%temp%\items.txt) do (
  if "%%s"=="Zzz(lock)" ( Rundll32.exe user32.dll,LockWorkStation )
  if "%%s"=="logout" ( shutdown /l )
  if "%%s"=="restart" ( shutdown -r -t 0 )
  if "%%s"=="shutdown" ( shutdown /p /f)
)
del "%temp%\items.txt"
