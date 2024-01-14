@echo off

start /B wmenu.exe -prompt "Output: " -fontName "Cascadia Code PL" -fontSize 9 | more > %temp%/screenshot_output.txt

for /f "tokens=*" %%s in (%temp%\screenshot_output.txt) do (
  cd /d "%USERPROFILE%\Desktop"
  start ffmpeg -f gdigrab -framerate 30 -i desktop %%s.mkv
  start ffmpeg -f dshow -i audio="Headset (BT Hands-Free AG Audio)" %%s.m4a
)

del "%temp%\screenshot_output.txt"
