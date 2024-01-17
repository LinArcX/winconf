@echo off
setlocal EnableDelayedExpansion

rem Use type command to read the content of apps.txt and pipe it to fzf
for /f "delims=" %%a in ('type D:\workspace\other\winconf\batch\fzf\a.txt ^| fzf --header="apps:"' ) do ( set "selectedApp=%%a" )

if "!selectedApp!"=="btm" ( btm )
if "!selectedApp!"=="PATH" ( PATH )
if "!selectedApp!"=="disableF1" ( 
  REM Run this section as Administrator
  gsudo.exe taskkill /f /im HelpPane.exe
  gsudo.exe takeown /f c:\windows\HelpPane.exe
  gsudo.exe icacls c:\windows\HelpPane.exe /deny Everyone:(X)
)
if "!selectedApp!"=="screencast" (
  start /B wmenu.exe -prompt "Output: " -fontName "Cascadia Code PL" -fontSize 9 | more > %temp%/screenshot_output.txt
  
  for /f "tokens=*" %%s in (%temp%\screenshot_output.txt) do (
    cd /d "%USERPROFILE%\Desktop"
    start ffmpeg -f gdigrab -framerate 30 -i desktop %%s.mkv
    start ffmpeg -f dshow -i audio="Headset (BT Hands-Free AG Audio)" %%s.m4a
  )
  
  del "%temp%\screenshot_output.txt"
)

if "!selectedApp!"=="mergeAudioAndVideo" ( 
  start ffmpeg -i audio.mp4 -i sqlBrowser.mkv final_video.avi
)

endlocal
